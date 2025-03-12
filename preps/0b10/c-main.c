
#include <stdio.h>
#include <stdlib.h>

long asm_area(int * sides, int shape);
void asm_div(long * arr_in, long * arr_mod, int divisor);
int asm_prime_div(int * num_arr, int div);

int isPrime(int num){
    if (num <= 1)
        return 0;

    for (int i = 2; i < num; i++)
        if (num % i == 0)
            return 0;

    return 1;
}

int myPrimeSum(int* arr, int size){
    int retVal = 0;
    for(int i = 0; i < size; i++){
        if(isPrime(arr[i]))
            retVal += arr[i];
    }
    return retVal;
}

int main(){
    
    int* sides = (int*)malloc(sizeof(int) * 2);
    sides[0] = 3;
    sides[1] = 4;

    // Ukol 1
    printf("Ukol 1\n");
    printf("obsah je: %ld\n", asm_area(sides, 2));
    
    // Ukol 2
    long arr_in[5] = {107, 250, 313, 481, 693};
    long* arr_mod = (long*)malloc(sizeof(long) * 5);
    int divisor = 3;
    
    asm_div(arr_in, arr_mod, divisor);
    printf("Ukol 2\n");
    for (int i = 0; i < 5; i++){
        printf("%ld mod %d = %ld\n", arr_in[i], divisor, arr_mod[i]);
    }

    // Ukol 3
    printf("Ukol 3\n");
    int* num_arr = (int*)malloc(sizeof(int) * 10);
    num_arr[0] = 3;
    num_arr[1] = 3;
    num_arr[2] = 3;
    num_arr[3] = 3;
    num_arr[4] = 5;
    num_arr[5] = 11;
    num_arr[6] = 7;
    num_arr[7] = 8;
    num_arr[8] = 9;
    num_arr[9] = 10;

    int primedivisor = 2;

    printf("sum of primes: %d / %d = %d\n",myPrimeSum(num_arr, 10) ,primedivisor, asm_prime_div(num_arr, primedivisor));

    free(num_arr);
    free(arr_mod);

    return 0;
}
