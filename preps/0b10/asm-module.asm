
    bits 64

    section .data

    section .text
    ; Ukol 1
    global asm_area
asm_area:
    enter 0, 0 
    mov rdx, 0 ; 
    mov eax, dword [edi] ; eax = sides[0]
    mov r8d, dword [edi + 1 * 4] ; eax = sides[1]
    mov r9d, esi ; second paramentr

    cmp r9d, 1 ; compares 2nd paramenter to 1, 
    je .is_rect ; if its 1, than go to .is_rectangle
    cmp r9d, 2 ; compares 2nd param to 2
    je .is_triangle ; if it's 2, go to is_triangle

.is_rect:
    mul r8d ; eax = eax * r8d
    leave ; is needed because of return value
    ret

 .is_triangle:
    mul r8d ; eax = eax * r8d
    mov r10d, 2 ; divisor set to 2
    div r10d ; eax = eax / r10d (2)
    leave   ;is needed because of return value
    ret

    ; Ukol 2
    global asm_div
asm_div:
    enter 0, 0
    mov rax, 0
    mov rcx, 0  ; counter
    mov r10, rdx ; r10 = divisor
    mov rdx, 0
    ; rdi ... arr_int
    ; rsi ... arr_mod
.again:
    cmp ecx, 5
    jge .end_loop
    mov rax, qword [rdi + rcx * 8] ; rax = arr_in[counter]
    div r10 ; rax = rax / r10
    mov qword [rsi + rcx * 8], rdx ; arr_mod[i] = zbytek po deleni
    mov rdx, 0 ; vynulovani rdx
    inc rcx ;i++
    jmp .again
    
.end_loop:
    leave
    ret

    global asm_prime_div
asm_prime_div:
    enter 0,0

    mov rcx, 0 ; nulování počítače iterací
    mov r9d, 0 ; nulování registru pro součty prvočísel

.forloop:
    ; skok pro kontorolu iterací v poli a nastavení prvního prvočísla
    cmp rcx, 10
    je .end

    mov r8d, 2

.prime:
    ; kontrola prvočíselnosti
    ; veme se parametr funkce a kontrolují a se vlastnosti prvnočísla
    ; nakonec se vydělí a cyklus se opakuje
    ; výsledkem je buď skok na .before_loop nebo .is_prime
    mov rdx, 0
    mov eax, [rdi + rcx * 4]
   
    cmp eax, 1
    jle .before_loop

    cmp eax, r8d
    je .is_prime

    div r8d

    cmp rdx, 0
    je .before_loop
    inc r8d
    jmp .prime

.is_prime:
    ; přičtení prvočísla do registru -> p
    add r9d, eax

.before_loop:
    ; inkrementace počítače iterací a skok zpět na .loop
    inc rcx
    jmp .forloop

.end:
    ; nulování rdx (zbytku po dělení), následnovné dělení a vrácení hodnoty
    mov rdx, 0
    mov eax, r9d
    div rsi

    leave
    ret