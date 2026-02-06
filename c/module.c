#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <janet.h>
#include <time.h>
#include <gdbm.h>
#include <string.h>

char* db_path = "db.gdbm";
GDBM_FILE gdbf;
int ex (int argc, char **argv);

datum newDatum(const char* text) {
    datum instance;
    instance.dptr = text;
    instance.dsize = strlen (text);
    return instance;
}

Janet statusToBool(int status) {
    return janet_wrap_boolean (!status);
}

/***************/
/* C Functions */
/***************/

JANET_FN(setup,
         "(citadel/setup)",
         "Set up the gdbm files") {
    int status = 0;

    gdbf = gdbm_open (db_path, 0, GDBM_WRCREAT, 0644, NULL);
    if (gdbf == NULL) {
        fprintf (stderr, "can't open database: %s\n",
                 gdbm_strerror (gdbm_errno));
        status = -1;
    }

    return statusToBool (status);
}


JANET_FN(add_element,
         "(citadel/add-element)",
         "Create a new element [key content]") {
    janet_fixarity (argc, 2);
    datum key = newDatum (janet_getcstring(argv, 0));
    datum content = newDatum (janet_getcstring(argv, 1));

    /* can use replace instead of insert */
    int status = gdbm_store (gdbf, key, content, GDBM_INSERT);
    return statusToBool (status);
}

JANET_FN(read_element,
         "(citadel/read-element)",
         "Read element from database (if exists)") {
    int status = 0;

    janet_fixarity (argc, 1);
    datum lookingFor = newDatum (janet_getcstring(argv, 0));

    char* answer;

    /* Analyze the return */
    if (lookingFor.dptr != NULL) {
        /* The key is found */
        answer = janet_smalloc(lookingFor.dsize + 1);
        memcpy(answer, lookingFor.dptr, lookingFor.dsize);
        answer[lookingFor.dsize] = '\0';
    } else if (gdbm_errno == GDBM_ITEM_NOT_FOUND) {
        /* There is no such key in the database */
        answer = "No such key";
    } else {
        /* An error occurred */
        // asprintf(&answer, "Error;%s\n", gdbm_db_strerror (gdbf));
        answer = "Error";
    }

    /* Close the database and return */
    return janet_cstringv (answer);
}

/****************/
/* Module Entry */
/****************/

JANET_MODULE_ENTRY(JanetTable *env) {
    JanetRegExt cfuns[] = {
        JANET_REG("setup", setup),
        JANET_REG("add-element", add_element),
        JANET_REG("read-element", read_element),
        JANET_REG_END
    };
    janet_cfuns_ext(env, "citadel", cfuns);
}
