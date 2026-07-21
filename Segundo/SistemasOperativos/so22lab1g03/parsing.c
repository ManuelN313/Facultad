#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

#include "parsing.h"
#include "parser.h"
#include "command.h"

static scommand parse_scommand(Parser p)
{
    /*Inicialization of variables*/
    scommand scommand_from_file = scommand_new();
    char *result = NULL;
    arg_kind_t arg;
    bool end_of_command = false;

    /*Trim spaces*/
    parser_skip_blanks(p);

    /*Analysis of the file content*/
    while (!parser_at_eof(p) && !end_of_command)
    {
        result = parser_next_argument(p, &arg);
        end_of_command = (result == NULL); // If parser_next_argument() returns a NULL string, we are at the end of the command
        if (!end_of_command)
        {
            switch (arg)
            {
            case ARG_NORMAL:
                scommand_push_back(scommand_from_file, result);
                break;
            case ARG_OUTPUT:
                scommand_set_redir_out(scommand_from_file, result);
                break;
            case ARG_INPUT:
                scommand_set_redir_in(scommand_from_file, result);
                break;
            default:
                break;
            }
        }
        parser_skip_blanks(p);
    }

    /* Cleanup if invalid command */
    if (scommand_is_empty(scommand_from_file))
    {
        scommand_from_file = scommand_destroy(scommand_from_file);
    }

    return scommand_from_file;
}

pipeline parse_pipeline(Parser p)
{
    assert(!parser_at_eof(p));

    /* Initialize variables */
    pipeline result = pipeline_new();
    scommand cmd = NULL;
    bool error = false, another_pipe = true, garbage = false, was_op_background = false;

    /* Parse pipeline */
    cmd = parse_scommand(p);
    error = (cmd == NULL);

    while (another_pipe && !error)
    {
        /* Parse command while on a pipeline*/
        pipeline_push_back(result, cmd);
        parser_op_pipe(p, &another_pipe);
        cmd = parse_scommand(p);
        error = (cmd == NULL);
    }

    /* Check if pipeline should wait */
    parser_op_background(p, &was_op_background);
    pipeline_set_wait(result, !was_op_background);

    /* Destroy pipeline if empty */
    if (pipeline_is_empty(result))
    {
        /* If empty pipe, destroy pipe, returns null*/
        result = pipeline_destroy(result);
    }

    /* Cleanup parser */
    parser_garbage(p, &garbage); // Consumes final /n

    return result;
}