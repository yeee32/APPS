#include <stdio.h>
#include <stdlib.h>

void asm_tribonacci();

int asm_palindrome(char* in_arr);
int strLen(char* arr);

long multi_f(int in, int n);

int main(){ 
    int o = asm_palindrome("kajak");
    printf("Palindrome: %s\n", o ? "true" : "false");

    
    long f = multi_f(5,3); // 7 * 5 * 3 * 1 = 15
    printf("%ld\n", f);
    return 0;
}
