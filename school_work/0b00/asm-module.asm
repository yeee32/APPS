    bits 64

    section .data

    extern g_char
    extern g_short_merged
    extern g_extended

    extern g_decoded
    extern enc_string

    section .text

    global merge_and_extend
merge_and_extend:
    ; vynulovani registru al, dl
    mov al, 0
    mov dl, 0

    mov al, [g_char + 0] ; do al se nahraje g_char[0] = 0xCA
    mov dl, [g_char + 1] ; do dl se nahraje g_char[1] = 0xFE
    mov [g_short_merged + 0 ], dl ; do g_short_merged se nahraje dl
    mov [g_short_merged + 1], al ; do g_short_merged se nahraje al posunute

    movzx eax, al ; doplneni 0
    mov [g_extended], dl    
    mov [g_extended + 1], eax
    ret

    global decode
decode:
    ; vynulovani registru al
    mov al, 0

    
    mov al, [enc_string + 2] ; al = enc_string[2]
    mov [g_decoded + 0], al  ; g_decoded[0] = al   

    mov al, [enc_string + 1] ;al = enc_string[1]
    mov [g_decoded + 1], al  ; g_decoded[1] = al 

    mov al, [enc_string + 0] ;al = enc_string[0]
    mov [g_decoded + 2], al  ; g_decoded[2] = al 

    mov al, [enc_string + 3] ;al = enc_string[3]
    mov [g_decoded + 3], al  ; g_decoded[3] = al 
    ret