call main

; Syscall Exit Program
mov eax,10
int 0x80

print_int:
    move eax, 1
    mov ebx, dword [esp+4]
    int 0x80
    ret

print_char:
    mov eax, 11
    mov ebx, dword[esp+4]
    int 0x80
    ret

get_min:
    push ebp
    mov ebp, esp
    push esi

    mov eax, 0 ; min
    mov ebx, 1 ; i

$gm_loop:
    cmp ebx, dword [ebp + 12]
    jge $gm_end_loop

    mov esi, dword [ebp +8]
    mov ecx, dword [esi + eax*4] ; array[min]
    cmp ecx, dword [esi + ebx*4] ; compare array[min] con array[i]
    jle $gm_end_if
    mov eax, ebx
$gm_end_if:
    inc ebx
    jmp $gm_loop

$gm_end_loop:
    pop esi
    mov esp, ebp
    pop ebp
    ret

sort:
    cmp dword [esp + 8], 1
    jle $ss_end

    push dword [ esp + 8] ; n
    push dword [ esp + 8] ; array
    call get_min
    add esp, 8
    cmp eax, 0
    je $ss_rec_call

    mov ecx, dword [esp + 4]
    mov ebx, dword [ecx] ; array[0]
    mov edx, dword [ecx + eax*4] ; array[pos]
    mov dword [ecx], edx
    mov dword [ecx + eax *4], ebx

$ss_rec_call:
    mov eax, dword [esp + 8]
    dec eax
    mov ebx, dword [esp + 4]
    lea ebx, [ebx + 4]

    push eax
    push ebx
    call sort
    add esp, 8

$ss_end:
    ret

main:
    push ebp
    mov ebp, esp
    sub esp, 56

    mov dword [esp + 0], 100
    mov dword [esp + 4], 2
    mov dword [esp + 8], 67
    mov dword [esp + 12], 38
    mov dword [esp + 16], 76
    mov dword [esp + 20], 12
    mov dword [esp + 24], 50
    mov dword [esp + 28], 62
    mov dword [esp + 32], 14
    mov dword [esp + 36], 60
    mov dword [esp + 40], 294
    mov dword [esp + 44], 193
    mov dword [esp + 48], 351

    mov eax, esp
    
    push 13
    push eax
    call sort
    add esp, 8

    mov dword [esp + 52], 0

$main_loop:
    cmp dword [esp+52],13
    jge $main_end_loop
    mov eax,dword[esp+52]
    mov eax, [esp + eax*4]
    push eax
    call print_int
    add esp, 4
    push ' '
    call print_char
    add esp,4
    inc dword [esp + 52]
    jmp $main_loop

$main_end_loop:
    push 0xa
    call print_char
    add esp, 4

    mov eax, 0

    mov esp, ebp
    pop ebp
    ret