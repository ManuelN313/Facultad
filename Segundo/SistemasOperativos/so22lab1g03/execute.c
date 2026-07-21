#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <fcntl.h>
#include <signal.h>

#include "tests/syscall_mock.h"

#include "command.h"
#include "execute.h"
#include "parser.h"
#include "parsing.h"
#include "builtin.h"

#define PIPE_READ_END 0
#define PIPE_WRITE_END 1

#define SINGLE_COMMAND -1
#define FIRST_COMMAND 0
#define MIDDLE_COMMAND 1
#define LAST_COMMAND 2

static void get_args(char **args, scommand scmd)
{
    unsigned int i = 0u;
    while (!scommand_is_empty(scmd))
    {
        args[i] = strdup(scommand_front(scmd));
        scommand_pop_front(scmd);
        i++;
    }
    args[i] = NULL;
}

static void set_redir(scommand scmd)
{
    /* If there's input redirection, we change the READING file descriptor */
    if (scommand_get_redir_in(scmd) != NULL)
    {
        int fd_in = open(scommand_get_redir_in(scmd), O_RDONLY, S_IRUSR);
        if (fd_in != -1)
        {
            if (dup2(fd_in, STDIN_FILENO) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to dup IN redirection with STDIN.\n");
                exit(EXIT_FAILURE);
            }
            if (close(fd_in) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to close IN redirection.\n");
                exit(EXIT_FAILURE);
            }
        }
        else
        {
            fprintf(stderr, "MyBash Error: failed to open IN redirection.\n");
            exit(EXIT_FAILURE);
        }
    }

    /* If there's output redirection, we change the WRITING file descriptor */
    if (scommand_get_redir_out(scmd) != NULL)
    {
        int fd_out = open(scommand_get_redir_out(scmd), O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
        if (fd_out != -1)
        {
            if (dup2(fd_out, STDOUT_FILENO) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to dup OUT redirection with STDIN.\n");
                exit(EXIT_FAILURE);
            }
            if (close(fd_out) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to close OUT redirection.\n");
                exit(EXIT_FAILURE);
            }
        }
        else
        {
            fprintf(stderr, "MyBash Error: failed to open OUT redirection.\n");
            exit(EXIT_FAILURE);
        }
    }
}

static void execute_command(pipeline pipe, int *fd_read, int *fd_write, int selec)
{
    // Get command
    scommand cmd = pipeline_front(pipe);
    pid_t pid;
    // Check if builtin
    if (builtin_is_internal(cmd))
    {
        builtin_run(cmd);
    }
    else
    {
        // Fork
        pid = fork();
        if (pid < 0)
        {
            fprintf(stderr, "MyBash Error: failed to fork.\n");
            exit(EXIT_FAILURE);
        }
        else if (pid == 0)
        {
            /* CHILD */
            // Setup pipe redir
            switch (selec)
            {
            case FIRST_COMMAND:
                /* FIRST OF PIPELINE */
                // write_to_pipe(fd_write);
                close(fd_write[PIPE_READ_END]);
                dup2(fd_write[PIPE_WRITE_END], STDOUT_FILENO);
                close(fd_write[PIPE_WRITE_END]);
                break;
            case MIDDLE_COMMAND:
                /* MIDLE OF PIPELINE */
                // write_to_pipe(fd_write);
                close(fd_write[PIPE_READ_END]);
                dup2(fd_write[PIPE_WRITE_END], STDOUT_FILENO);
                close(fd_write[PIPE_WRITE_END]);
                // read_from_pipe(fd_read);
                close(fd_read[PIPE_WRITE_END]);
                dup2(fd_read[PIPE_READ_END], STDIN_FILENO);
                close(fd_read[PIPE_READ_END]);
                break;
            case LAST_COMMAND:
                /* LAST OF PIPELINE */
                // read_from_pipe(fd_read);
                close(fd_read[PIPE_WRITE_END]);
                dup2(fd_read[PIPE_READ_END], STDIN_FILENO);
                close(fd_read[PIPE_READ_END]);
                break;
            default:
                /* SINGLE COMMAND */
                break;
            }

            // Overwrite with command redir
            set_redir(cmd);

            // Get arguments
            char **args = calloc(scommand_length(cmd) + 1, sizeof(char *));
            get_args(args, cmd);

            // execvp
            if (execvp(args[0], args) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to execute command %s.\n", args[0]);
                free(args);
                exit(EXIT_FAILURE);
            }
        }
        /* PARENT */
    }
}

void execute_pipeline(pipeline apipe)
{
    if (apipe == NULL)
    {
        exit(EXIT_FAILURE);
    }
    else
    {
        /* To avoid creating a zombie process when the child processes terminate
        the SIGCHLD signal is set to be ignored */
        signal(SIGCHLD, SIG_IGN);

        unsigned int pipe_len = pipeline_length(apipe);

        if (pipeline_length(apipe) == 1)
        {
            execute_command(apipe, NULL, NULL, SINGLE_COMMAND);
        }
        else if (pipeline_length(apipe) > 1)
        {
            int fd_old[2], fd_new[2];
            if (pipe(fd_old) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to create pipe.\n");
                exit(EXIT_FAILURE);
            }

            execute_command(apipe, NULL, fd_old, FIRST_COMMAND);
            pipeline_pop_front(apipe);

            while (pipeline_length(apipe) > 1)
            {
                if (pipe(fd_new) == -1)
                {
                    fprintf(stderr, "MyBash Error: failed to create pipe.\n");
                    exit(EXIT_FAILURE);
                }

                execute_command(apipe, fd_old, fd_new, MIDDLE_COMMAND);
                pipeline_pop_front(apipe);

                if (close(fd_old[0]) == -1 || close(fd_old[1]) == -1)
                {
                    fprintf(stderr, "MyBash Error(execute.c:133): failed to close fd_old.\n");
                    exit(EXIT_FAILURE);
                }
                fd_old[0] = fd_new[0];
                fd_old[1] = fd_new[1];
            }

            execute_command(apipe, fd_old, NULL, LAST_COMMAND);
            pipeline_pop_front(apipe);

            if (close(fd_old[0]) == -1 || close(fd_old[1]) == -1)
            {
                fprintf(stderr, "MyBash Error: failed to close fd_old.\n");
                exit(EXIT_FAILURE);
            }
        }
        if (pipeline_get_wait(apipe))
        {
            for (unsigned int i = 0; i < pipe_len; i++)
                waitpid(-1, NULL, 0);
        }
    }
}