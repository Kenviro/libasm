section .text
	global ft_atoi_base

ft_strlen:
	xor rax, rax
.loop:
	cmp byte [rdi + rax], 0
	je .end
	inc rax
	jmp .loop
.end:
	ret

check_size:
	call ft_strlen
	cmp rax, 2
	jl .error
	mov rax, 0
	ret
.error:
	mov rax, 1

check_char:
	xor r8, r8
.loop:
	cmp byte [rdi + r8], 0
	je .end
	cmp byte [rdi + r8], 43 ; check if char is '+'
	je .error
	cmp byte [rdi + r8], 45 ; check if char is '-'
	je .error
	cmp byte [rdi + r8], 32 ; check if char is SPACE
	je .error
	cmp byte [rdi + r8], 7 ; check if less than '\a'
	jle .inc
	cmp byte [rdi + r8], 13 ; check if greater than '\r'
	jge .inc
.error:
	mov rax, 1
	ret
.inc:
	inc r8
	jmp .loop
.end:
	mov rax, 0
	ret

check_duplicate:
	xor r8, r8
.loop:							; first loop
	cmp byte [rdi + r8], 0
	je .end
	mov rcx, r8
	jmp .search
.inc:
	inc r8
	jmp .loop
.search:						; second loop
	inc rcx
	cmp byte [rdi + rcx], 0
	je .inc
	movzx rdx, byte [rdi + rcx]	; strcmp
	movzx rax, byte [rdi + r8]
	cmp rdx, rax
	je .error
	jmp .search
.error:
	mov rax, 1
	ret
.end:
	mov rax, 0
	ret

check_base:
	call check_duplicate
	push rax
	call check_char
	push rax
	call check_size
	pop r8
	or rax, r8				; apply or on every return to check
	pop r8					; if one of them is zero
	or rax, r8
	ret

sign:
	mov rax, 1
.loop:
	cmp byte [rdi], 45	; check if the char is a '-'
	je .minus
.plus:
	cmp byte [rdi], 43	; check if the char is a '+'
	jne .end
	inc rdi
	jmp .loop
.minus:
	neg rax
	inc rdi
	jmp .loop
.end:
	ret

index:
	xor rax, rax
.loop:
	cmp byte [rsi + rax], 0
	je .error
	movzx rcx, byte [rdi]		; strcmp
	movzx r9, byte [rsi + rax]
	cmp r9, rcx
	je .end
	inc rax
	jmp .loop
.end:
	ret
.error:
	mov rax, -1
	ret

ft_atoi_base:
	cmp byte [rdi], 0			; check for valid ptr
	je .error
	push rdi					; setup arg for other fct
	mov rdi, rsi
	call check_base
	cmp rax, 0					; if the return is 0 error
	jne .error_pop
	call ft_strlen
	mov rdx, rax
	mov rsi, rdi
	pop rdi
	call sign
	push rax
	call index
	xor r8, r8
.loop:
	cmp rax, -1
	je .end
	imul r8, rdx	; mult the result by the size of the base
	add r8, rax		; add the result of the index to the result
	inc rdi
	call index
	jmp .loop
.end:
	pop rcx
	mov rax, r8
	imul rax, rcx
	ret
.error:
	mov rax, 0
	ret
.error_pop:
	mov rsi, rdi
	pop rdi
	mov rax, 0
	ret
