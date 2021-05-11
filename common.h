//
// Created by xim on 5/11/21.
//

#ifndef VERELATION_COMMON_H
#define VERELATION_COMMON_H
#include <stdio.h>

#define STRING_LEN 128
#define PATH_LEN 1024
#define FILE_MAX_SIZE 100000000 // about 100 MB

extern int feature_preprocess;
extern char source_path[PATH_LEN];
extern FILE *source_file;
extern char* source_buffer;

#endif //VERELATION_COMMON_H
