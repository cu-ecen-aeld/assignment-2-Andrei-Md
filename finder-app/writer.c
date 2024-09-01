/**
 * Input:
 * Accepts the following arguments: the first argument is a full path to a file (including filename)
 *  on the filesystem, referred to below as writefile; the second argument is a text string which
 *  will be written within this file, referred to below as writestr
 *
 * Output:
 * Exits with value 1 error and print statements if any of the arguments above were not specified
 *
 * Creates a new file with name and path writefile with content writestr,
 * overwriting any existing file.
 * Exits with value 1 and error print statement if the file could not be created.
 *
 */
#include <syslog.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    openlog(NULL, 0, LOG_USER);

    if (3 != argc)
    {
        syslog(LOG_ERR, "Invalid number of arguments, expected 2! Usage: <target> <writefile> <writestr>");
        exit(1);
    }

    syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);

    FILE *stream;
    stream = fopen(argv[1], "w");
    if (!stream)
    {
        syslog(LOG_ERR, "Specified file %s cannot be opened!", argv[1]);
        exit(1);
    }

    if (fputs(argv[2], stream) == EOF)
    {
        syslog(LOG_ERR, "Specified text: ( %s ) was not written into the file %s", argv[2], argv[1]);
        exit(1);
    }

    if (fclose(stream) == EOF)
    {
        syslog(LOG_ERR, "Couldn't close the stream for %s", argv[1]);
        exit(1);
    }

    return 0;
}