#include <stdio.h>

int g_int_array[15] = { -3, -8, 80, 2710, 32, 439, 9099, 10, 77, -273, 2, 22222, 0, -23, 23};
char g_char_array[32] = "testovaci pole pro cv2";

int g_int_evens;
int g_neg_val_array[15];
int g_vowelCount;

void asm_even_nums();
void asm_select_neg_vals();
void asm_count_vowels();
void asm_replace_third();


int main(){
    // Ukol 1s
    asm_even_nums();
    printf("Ukol 1\n");
    printf("evens / 4 neg: %d\n", g_int_evens);

    // Ukol 2
    printf("Ukol 2\n");
    asm_select_neg_vals();
    printf("negative values: ");
    for(int i = 0; i < 15; i++){
        printf("%d ", g_neg_val_array[i]);
    }
    printf("\n");

    // Ukol 3
    printf("Ukol 3\n");
    asm_count_vowels();
    printf("vowel count: %d\n", g_vowelCount); 
    
    // Ukol 4
    printf("Ukol 4\n");
    printf("%s\n", g_char_array);
    asm_replace_third();
    printf("%s\n", g_char_array);
    return 0;
}
