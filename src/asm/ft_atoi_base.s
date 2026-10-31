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
	xor ebx, ebx
	call ft_strlen
	cmp ebx, 2
	jl .error
	mov rax, 0
	ret
.error:
	mov rax, 1

check_char:
	xor rbx, rbx
.loop:
	cmp byte [rdi + rbx], 0
	je .end
	cmp byte [rdi + rbx], 43 ; check if char is '+'
	je .error
	cmp byte [rdi + rbx], 45 ; check if char is '-'
	je .error
	cmp byte [rdi + rbx], 32 ; check if char is SPACE
	je .error
	cmp byte [rdi + rbx], 7 ; check if less than '\a'
	jl .error
	cmp byte [rdi + rbx], 13 ; check if greater than '\r'
	jg .error
	inc rbx
	jmp .loop
.error:
	mov rax, 1
	ret
.end:
	mov rax, 0
	ret

check_duplicate:
	xor rbx, rbx
.loop:
	cmp byte [rdi + rbx], 0
	je .end
	mov rcx, rbx
	jmp .search
.inc:
	inc rbx
	jmp .loop
.search:
	inc ecx
	cmp byte [rdi + rcx], 0
	je .inc
	movzx rdx, byte [rdi + rcx]
	movzx rcx, byte [rdi + rbx]
	cmp rdx, rcx
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
	pop rbx
	or rax, rbx
	pop rbx
	or rax, rbx
	ret

ft_atoi_base:
	push rdi
	mov rdi, rsi
	call check_base
	cmp rax, 0
	jne .error
	mov rsi, rdi
	pop rdi
	call ft_strlen
	mov rdx, rax
	mov ecx, 1
	xor rax, rax
	jmp .loop
.loop:
	cmp edx, 0
	jl .end
	cmp byte [rdi + rdx], 48 ; return if char is less than '0'
	jl .end
	cmp byte [rdi + rdx], 57 ; return if char is greater than '9'
	jg .end
	mov rbx, [rdi + rdx]
	; need to search into rsi for the base
	sub rbx, 48
	imul rbx, rcx
	add rax, rbx
	dec rdx
	imul rcx, rcx, 10
	jmp .loop
.end:
	ret
.error:
	mov rax, 0
	ret
