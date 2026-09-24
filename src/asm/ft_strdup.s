extern malloc

section .text
	global ft_strdup

ft_strdup:
	xor rax, rax
.len:
	cmp byte [rdi + rax], 0
	je .malloc
	inc rax
	jmp .len
.malloc:
	push rdi
	inc rax
	mov rdi, rax
	call malloc wrt ..plt
	cmp rax, 0
	je .error
	pop rdi
	xor rdx, rdx
.copy:
	cmp byte [rdi + rdx], 0
	je .end
	mov sil, [rdi + rdx]
	mov [rax + rdx], sil
	inc rdx
	jmp .copy
.end:
	mov [rax + rdx], 0
	ret
.error:
	ret
