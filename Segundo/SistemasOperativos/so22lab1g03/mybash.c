#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <linux/limits.h>

#include "command.h"
#include "execute.h"
#include "parser.h"
#include "parsing.h"
#include "builtin.h"

#define SIZE_USR 32
#define SIZE_HOST 64

static void show_prompt(void)
{
    char usr[SIZE_USR];
    char host[SIZE_HOST];
    char path[PATH_MAX];

    getlogin_r(usr, SIZE_USR);
    gethostname(host, SIZE_HOST);
    getcwd(path, PATH_MAX);

    /*
        «\033[0;31m» set the text colour to red
        «[myBash]%s@%s> » text to be displayed in red
        «\033[0m» resets the text colour to default
    */
    // printf("\033[0;31m[myBash]%s@%s: %s > [0m", usr, host, path);
    printf("\033[0;31m[myBash]%s@%s:\033[36m%s\033[00m\033[0;31m\n$ \033[00m", usr, host, path);
    fflush(stdout);
}

int main(int argc, char *argv[])
{
    pipeline pipe;
    Parser input;
    bool quit = false;

    input = parser_new(stdin);
    while (!quit)
    {
        show_prompt();
        pipe = parse_pipeline(input);

        /* Hay que salir luego de ejecutar? */
        quit = parser_at_eof(input);
        if (pipe != NULL)
        {
            execute_pipeline(pipe);
            pipe = pipeline_destroy(pipe);
        }
    }
    parser_destroy(input);
    input = NULL;
    return EXIT_SUCCESS;
}
