    bits 64

    section .data

    section .text

    global asm_palindrome
asm_palindrome:
    enter 0, 0
    call strLen ; length of word in rax
    mov rcx, rax ; rcx = rax
    mov r8, 0 ; index i
    mov r9, rax ; index j
    mov rdx, 0 ; word 
    mov rbx, 0  ; mirrored word
    mov rax, 1 ; we assume that the word is palindrome

.forloop:
    cmp r8, rcx ; i < strlen
    jge .endloop ; i >= strlen, jump to end
    mov dl, byte [rdi + r8] ; dl = rdi[i]
    mov bl, byte [rdi + r9 - 1] ; bl = rdi[j-1]
    cmp dl, bl
    jnz .isNotPalindrome ; if [i] != [j] is not palindrome
    inc r8 ;i++
    dec r9 ;j--
    jmp .forloop ; another iteration

.isNotPalindrome:
    mov rax, 0 ; set return value to 0

.endloop:
    leave 
    ret

    global strLen
strLen:
    enter 0, 0
    mov rcx, 0 ; index
    mov rax, 0 ; strlen
    mov rdx, 0
    
.forloop:
    cmp byte [rdi + rcx], 0
    je .end
    inc rcx
    inc rax
    jmp .forloop

.end:
    leave
    ret

    global multi_f
multi_f:
;     ; n!! = n(n-2)(n-4) ...
;     ; n!!! = n(n-3)(n-6) ...
    enter 0, 0
    ; mul n  ... rax = rax * n
    mov rax, 0
                 ; rdi ; number n
                 ; rsi ; # of ! k
    mov rax, rsi
    mov rcx, 0 ; counter
    mov r9, 1
    cmp rdi, 0
    je .o_z_fac
    cmp rdi, 1
    je .o_z_fac
.loopf:
    mov rax, rsi ; rax = k
    mul rcx ; rax = counter * k
    cmp rax, rdi ; check
    jge .end ; (n - k) > 0 (5-0)(5-2)(5-4)(5-6) ; counter * k >= n
    
    mov r8, rdi
    sub r8, rax
    mov rax, r9

    mul r8 ; rax = rax * r8

    mov r9, rax

    inc rcx
    jmp .loopf


.o_z_fac:
    mov rax, 1

.end:
    mov rax, r9 ; r9 result
    leave
    ret