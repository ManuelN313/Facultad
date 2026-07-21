#include <assert.h>
#include <glib-2.0/glib.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "command.h"
#include "strextra.h"

/* merges the two arguments into one string and frees memory used by the first */
static char *strmerge_free(char *s1, char *s2)
{
    /*reaper is an auxiliar pointer to help us free memory before calling strmerge*/
    char *reaper = NULL;
    reaper = s1;
    s1 = strmerge(s1, s2);
    free(reaper);
    return s1;
}

struct scommand_s
{
    GQueue *command;
    char *output_file_RE;
    char *input_file_RE;
};

static bool invar_scommand(scommand self)
{
    return (self != NULL);
}

scommand scommand_new(void)
{
    scommand simple_command = malloc(sizeof(struct scommand_s));
    simple_command->command = g_queue_new();
    simple_command->input_file_RE = NULL;
    simple_command->output_file_RE = NULL;
    assert(invar_scommand(simple_command) && scommand_is_empty(simple_command) &&
           scommand_get_redir_in(simple_command) == NULL &&
           scommand_get_redir_out(simple_command) == NULL);
    return simple_command;
}

scommand scommand_destroy(scommand self)
{
    assert(invar_scommand(self));

    while (!g_queue_is_empty(self->command))
    {
        scommand_pop_front(self);
    }

    g_queue_free(self->command);
    free(self->input_file_RE);
    free(self->output_file_RE);
    free(self);
    self = NULL;
    assert(self == NULL);
    return self;
}

void scommand_push_back(scommand self, char *argument)
{
    assert(invar_scommand(self) && argument != NULL);
    g_queue_push_tail(self->command, argument);
    assert(invar_scommand(self) && !scommand_is_empty(self));
}

void scommand_pop_front(scommand self)
{
    assert(invar_scommand(self) && !scommand_is_empty(self));
    free(scommand_front(self));
    g_queue_pop_head(self->command);
    assert(invar_scommand(self));
}

void scommand_set_redir_in(scommand self, char *filename)
{
    assert(invar_scommand(self));
    if (scommand_get_redir_in(self) != NULL)
    {
        free(self->input_file_RE);
    }
    self->input_file_RE = filename;
    assert(invar_scommand(self));
}

void scommand_set_redir_out(scommand self, char *filename)
{
    assert(invar_scommand(self));
    if (scommand_get_redir_out(self) != NULL)
    {
        free(self->output_file_RE);
    }
    self->output_file_RE = filename;
    assert(invar_scommand(self));
}

bool scommand_is_empty(const scommand self)
{
    assert(invar_scommand(self));
    return g_queue_get_length(self->command) == 0;
}

unsigned int scommand_length(const scommand self)
{
    assert(invar_scommand(self));
    unsigned int result = g_queue_get_length(self->command);
    assert((result == 0) == scommand_is_empty(self));
    return result;
}

char *scommand_front(const scommand self)
{
    assert(invar_scommand(self) && !scommand_is_empty(self));
    char *result = g_queue_peek_head(self->command);
    assert(result != NULL);
    return result;
}

char *scommand_get_redir_in(const scommand self)
{
    assert(invar_scommand(self));
    return self->input_file_RE;
}

char *scommand_get_redir_out(const scommand self)
{
    assert(invar_scommand(self));
    return self->output_file_RE;
}

char *scommand_to_string(const scommand self)
{
    assert(invar_scommand(self));

    /* "result" will contain the command converted to string */
    char *result = calloc(1, sizeof(char));

    /*Creates a copy of self->command (queueu)*/
    GQueue *self_copy = g_queue_copy(self->command);

    while (!g_queue_is_empty(self_copy))
    {
        /* if 'result' contains an argument then add a space character */
        if (strcmp(result, ""))
        {
            result = strmerge_free(result, " ");
        }
        result = strmerge_free(result, g_queue_pop_head(self_copy));
    }

    if (self->output_file_RE != NULL)
    {
        result = strmerge_free(result, " > ");
        result = strmerge_free(result, self->output_file_RE);
    }

    if (self->input_file_RE != NULL)
    {
        result = strmerge_free(result, " < ");
        result = strmerge_free(result, self->input_file_RE);
    }

    /*Destroys the queue copy*/
    g_queue_free(self_copy);

    assert(scommand_is_empty(self) ||
           scommand_get_redir_in(self) == NULL || scommand_get_redir_out(self) == NULL ||
           strlen(result) > 0);

    return result;
}

struct pipeline_s
{
    GQueue *pipeline;
    bool wait_bool; // True = Wait
};

static bool invar_pipeline(pipeline test)
{
    return test != NULL;
}

pipeline pipeline_new(void)
{
    pipeline new = malloc(sizeof(struct pipeline_s));
    new->pipeline = g_queue_new();
    new->wait_bool = true;
    assert(invar_pipeline(new) && pipeline_is_empty(new) && pipeline_get_wait(new));
    return new;
}

pipeline pipeline_destroy(pipeline self)
{
    assert(invar_pipeline(self));
    while (!pipeline_is_empty(self))
    {
        pipeline_pop_front(self);
    }
    g_queue_free(self->pipeline); // gqueue has to be freed by glib functions
    self->pipeline = NULL;
    free(self);
    self = NULL;
    assert(self == NULL);
    return self;
}

void pipeline_push_back(pipeline self, scommand sc)
{
    assert(invar_pipeline(self) && sc != NULL);
    g_queue_push_tail(self->pipeline, sc);
    assert(invar_pipeline(self) && !pipeline_is_empty(self));
}

void pipeline_pop_front(pipeline self)
{
    assert(invar_pipeline(self) && !pipeline_is_empty(self));
    scommand aux = pipeline_front(self);
    scommand_destroy(aux);
    g_queue_pop_head(self->pipeline);
    assert(invar_pipeline(self));
}

void pipeline_set_wait(pipeline self, const bool w)
{
    assert(invar_pipeline(self));
    self->wait_bool = w;
    assert(invar_pipeline(self));
}

bool pipeline_is_empty(const pipeline self)
{
    assert(invar_pipeline(self));
    return g_queue_is_empty(self->pipeline);
}

unsigned int pipeline_length(const pipeline self)
{
    assert(invar_pipeline(self));
    unsigned int result = g_queue_get_length(self->pipeline);
    assert((result == 0) == pipeline_is_empty(self));
    return result;
}

scommand pipeline_front(const pipeline self)
{
    assert(invar_pipeline(self) && !pipeline_is_empty(self));
    scommand result = g_queue_peek_head(self->pipeline);
    assert(result != NULL);
    return result;
}

bool pipeline_get_wait(const pipeline self)
{
    assert(invar_pipeline(self));
    return self->wait_bool;
}

char *pipeline_to_string(const pipeline self)
{
    assert(invar_pipeline(self));
    unsigned int len = pipeline_length(self);
    char *result = calloc(1, sizeof(char));
    char *aux = NULL;
    for (unsigned int i = 0u; i < len; i++)
    {
        aux = scommand_to_string(g_queue_peek_nth(self->pipeline, i));
        result = strmerge_free(result, aux);
        free(aux);
        if (i != len - 1)
        {
            result = strmerge_free(result, " | ");
        }
    }
    if (!pipeline_get_wait(self))
    {
        result = strmerge_free(result, " &");
    }
    assert(pipeline_is_empty(self) || pipeline_get_wait(self) || strlen(result) > 0);
    return result;
}
