#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "common.h"
#include "preprocess.h"
#include "token.h"

int feature_preprocess = 0;
char source_path[PATH_LEN];
FILE *source_file;
char *source_buffer;

static void print_help() {
    printf("Usage: verelation [flags] [verilog file]\n");
    printf("flags:\n");
    printf("-np/--no-preprocess: do not preprocess the verilog source file\n");
    printf("-h/--help: print this help\n");
}

void parse_args(int argc, char **argv) {
    if (argc < 2) {
        // no arguments specified
        print_help();
    }
    int file_count = 0;
    for (int i = 1; i < argc; ++i) {
        if (strncmp(argv[i], "-h", 4) == 0 || strncmp(argv[i], "--help", 8) == 0) {
            print_help();
            exit(0);
        } else if (strcmp(argv[i], "-np") == 0 || strcmp(argv[i], "--no-preprocess") == 0) {
            feature_preprocess = 1;
        } else if (file_count == 0) {
            strncpy(source_path, argv[i], PATH_LEN);
            ++file_count;
        } else {
            printf("Error parse agruments: too many file args\n");
        }
    }
}

int main(int argc, char **argv) {
    // printf("Hello, World!\n");
    parse_args(argc, argv);
    source_file = fopen(source_path, "r");
    if (source_file == NULL) {
        printf("Error opening source file: %s\n", source_path);
        exit(1);
    }
    preprocess(&source_buffer);
    /*
    for (int i = 0; source_buffer[i] != 0; ++i) {
        putchar(source_buffer[i]);
    }
    */
    tokenize();
    print_token_info();

    return 0;
}
