
;Globální proměnné, adresování nepřímé s jedním registrem.

;Instrukce ADD, SUB, CMP, INC, DEC, NEG, AND, 
;TEST, OR, XOR, NOT, SHL, SHR.

;Podmíněné skoky Jcc pro znaménková čísla. 
;Podmínka a cyklus.

    bits 64

    section .data

    extern g_int_array
    extern g_char_array

    extern g_int_evens
    extern g_neg_val_array

    extern g_vowelCount

    section .text

    ; Ukol 1
    global asm_even_nums
asm_even_nums:
    mov ecx, 0 ; suma = 0 (suma je ecx)
    mov eax, 0
.back:
    cmp ecx, 15 ; je rdx mensi nez 15?
    jge .endLoop ; pokud neni mensi nez 15, skoc do endLoop
    mov esi, [ g_int_array + ecx * 4 ]
    inc ecx ; ecx ++
    and esi, 1 ; if ( g_int_array [ ecx ] & 1 ), pokud 1... tak je lichy, pokud 0... tak je sudy
    jz .isEven
    jmp .back
.isEven :
    inc eax ; eax ... pocet sudych, zvysi se pocet sudych eax++
    jmp .back
.endLoop : ; zbytek je v edx
    mov edx, 0 ; clear edivident
    mov ecx, 4   ;edivisor
    div ecx      ;
    neg edx
    mov [g_int_evens], edx ; g_odd_numbers = edx
    ret

    ; Ukol 2
    global asm_select_neg_vals
asm_select_neg_vals:
    mov ecx, 0 ; set counter to 0
    mov esi, 0
    mov eax, 0
    
.again:
    cmp ecx, 15
    jge .end_loop ; if ecx >= 15 goto end_loop
    mov esi, [g_int_array + ecx * 4] ; go through g_int_array[ecx]
    cmp esi, 0
    jl .put_to_neg_arr ; if is lower than 0 jump to put_to_neg_arr

.back:
    inc ecx ; increases counter ecx++
    jmp .again ; jumps to again, starting another iteration

.put_to_neg_arr:
    mov [g_neg_val_array + ecx * 4], esi ; adds the negative value to the array on its index
    jmp .back ; jumps to back

.end_loop:
    ret ; exits

    ; Ukol 3
    global asm_count_vowels
asm_count_vowels:
    mov ecx, 0 ; counter
    mov edi, 0 ; pocet samohlasek
    mov al, 0 ; will store values of g_char_array
.again:
    cmp ecx, 32 ; ecx - 32
    jge .end_loop ; pokud je counter >= 32, tak skoc do end_loop (ecx >= 0)
    mov al, [g_char_array + ecx] ; edi = g_char_arr[ecx]
    inc ecx ; counter++ (ecx++)
    cmp al, 'a' ; compares al to ascii value of letter 'a' (97)
    je .isVowel ; if is equal to the value of letter a, jumps to isVowel
    cmp al, 'e' ; compares al to ascii value of letter 'e' (101)
    je .isVowel ; if is equal to the value of letter e, jumps to isVowel
    cmp al, 'i' ; compares al to ascii value of letter 'i' (105)
    je .isVowel ; if is equal to the value of letter i, jumps to isVowel 
    cmp al, 'o' ; compares al to ascii value of letter 'o' (111)
    je .isVowel ; if is equal to the value of letter o, jumps to isVowel
    cmp al, 'u' ; compares al to ascii value of letter 'u' (117)
    je .isVowel ; if is equal to the value of letter u, jumps to isVowel
    cmp al, 'y' ; compares al to ascii value of letter 'y' (121)
    je .isVowel ; if is equal to the value of letter y, jumps to isVowel
    jmp .again ; start another iteration
.isVowel:
    inc edi ; zvysi se pocet samohlasek
    jmp .again
.end_loop:
    mov [g_vowelCount], edi
    ret ; exit

    ; Ukol 4
    global asm_replace_third
asm_replace_third:
    mov ecx, 0 ; counter = 0
    mov eax, 0 ; vowel counter = 0
    mov dil, 0 ; will store values of g_char_array
    mov bl, 3 ; bl = 3
.again:
    cmp ecx, 32 ; ecx - 32
    jge .end_loop ; pokud je counter >= 32, tak skoc do end_loop (ecx >= 0)
    mov dil, [g_char_array + ecx] ; dil = g_char_arr[ecx]
    inc ecx ; counter++ (ecx++)
    cmp dil, 'a' ; compares al to ascii value of letter 'a' (97)
    je .isVowel ; if is equal to the value of letter a, jumps to isVowel
    cmp dil, 'e' ; compares al to ascii value of letter 'e' (101)
    je .isVowel ; if is equal to the value of letter e, jumps to isVowel
    cmp dil, 'i' ; compares al to ascii value of letter 'i' (105)
    je .isVowel ; if is equal to the value of letter i, jumps to isVowel 
    cmp dil, 'o' ; compares al to ascii value of letter 'o' (111)
    je .isVowel ; if is equal to the value of letter o, jumps to isVowel
    cmp dil, 'u' ; compares al to ascii value of letter 'u' (117)
    je .isVowel ; if is equal to the value of letter u, jumps to isVowel
    cmp dil, 'y' ; compares al to ascii value of letter 'y' (121)
    je .isVowel ; if is equal to the value of letter y, jumps to isVowel
    jmp .again ; start another iteration
.isVowel:
    inc eax ; zvyseni vowel countru
    cmp eax, 3 ; pokud bude vowel counter 3, tak skocime na is_third
    jz .is_third
    jmp .again

.is_third:
    mov byte [g_char_array + ecx - 1], "3"
    mov eax, 0 ; vynulujeme vowel counter
    jmp .again

.end_loop:
    ret
