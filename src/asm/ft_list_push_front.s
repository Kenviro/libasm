extern malloc

section .text
	global ft_list_push_front

ft_list_push_front:
	push rdi
	mov rdi, 16
	call malloc wrt ..plt
	cmp rax, 0
	je .end
	leaq rax, rsi
	pop r8
	leaq [rax + 8], [r8]
.end:
	ret
