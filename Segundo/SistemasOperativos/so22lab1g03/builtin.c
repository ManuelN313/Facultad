#include <glib-2.0/glib.h>
#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#include "tests/syscall_mock.h"

#include "command.h"
#include "strextra.h"
#include "builtin.h"

#define SIZE 500

#define cd_info "cd: changes the working directory to the specified path or home if no path is specified."
#define help_info "help: prints information about myBash,the internal commands and its authors."
#define exit_info "exit: terminates MyBash execution."

#define LENGTH 3
const char *internal_cmds[LENGTH] = {"cd", "help", "exit"};

bool builtin_is_internal(scommand cmd)
{
    assert(cmd != NULL);

    unsigned int i = 0;
    bool found = false;
    char *cmd_name = strdup((scommand_front(cmd)));

    /* Searches for cmd on the array that lists the internal commands */
    while (!found && i < LENGTH)
    {
        found = found || strcmp(internal_cmds[i], cmd_name) == 0;
        i++;
    }

    free(cmd_name);
    return found;
}

bool builtin_alone(pipeline p)
{
    assert(p != NULL);
    return (pipeline_length(p) == 1) && builtin_is_internal(pipeline_front(p));
}

static void cd_inst(scommand cmd)
{
    char size[SIZE];
    char *path = NULL;
    scommand_pop_front(cmd);
    if (!scommand_is_empty(cmd))
    {
        path = scommand_front(cmd);
    }
    char *home = getenv("HOME");

    /* If no path is specified, cd to home */
    if (path == NULL && home != NULL)
    {
        if (chdir(home) == -1)
            perror("MyBashError: Directory does not exist.\n");
    }
    else
    {
        /* If the path is relative, concatenate with the current one */
        if (path[0] != '/')
        {
            path = strmerge("/", path);
            path = strmerge(getcwd(size, sizeof(size)), path);
        }
        if (chdir(path) == -1)
            perror("MyBashError: Directory does not exist.\n");
    }
}

static void help_inst(scommand cmd)
{
    if (scommand_length(cmd) != 1)
    {
        fprintf(stderr, "MyBashError: too many arguments in call, try 'help' instead.\n");
    }
    else
    {
        printf("\n\n"
               "\t\t\033[31m                   ___           _     \n"
               "\t\t _ __ ___  _   _  / __\\ __ _ ___| |__  \n"
               "\t\t| '_ ` _ \\| | | |/__\\/// _` / __| '_ \\ \n"
               "\t\t| | | | | | |_| / \\/  \\ (_| \\__ \\ | | |\n"
               "\t\t|_| |_| |_|\\__, \\_____/\\__,_|___/_| |_|\n"
               "\t\t           |___/                       \n\n\033[0m");
        printf("\t\tMyBash authors:\n\n"
               "\t\t\t@Lara Kurtz\n"
               "\t\t\t@Lautaro Rodriguez\n"
               "\t\t\t@Ignacio Facello\n\t\t\t@Manuel Nieto\n\n"
               "\t\t%s\n\n"
               "\t\t%s\n\n"
               "\t\t%s\n\n",
               cd_info, help_info, exit_info);
    }
}

static void exit_inst(void)
{
    exit(0);
}

void builtin_run(scommand cmd)
{
    assert(builtin_is_internal(cmd));

    char *inst = scommand_front(cmd);

    /* strcmp() returns 0 if strings are equal */
    if (strcmp(inst, "cd") == 0)
        cd_inst(cmd);
    else if (strcmp(inst, "help") == 0)
        help_inst(cmd);
    else if (strcmp(inst, "exit") == 0)
        exit_inst();
}