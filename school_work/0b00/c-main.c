#include <stdio.h>

char g_char[2] = {0xCA, 0xFE};
short g_short_merged;
int g_extended;

char g_decoded[4];
int enc_string = 0x53415050;

void merge_and_extend();

void decode();

int main(){

    merge_and_extend();
    printf( "Variables g_short_merged=%d, g_extended=%#010x\n", g_short_merged, g_extended );

    decode();
    printf( "String = %s\n", g_decoded);

    return 0;
}