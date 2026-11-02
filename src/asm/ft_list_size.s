section .text
	global ft_list_size

ft_list_size:
	xor rax, rax
	mov rsi, rdi
.loop:
	cmp rsi, 0			; cmp ptr to null
	je .end
	inc rax
	mov rsi, [rsi + 8]	; tmp = tmp->next
	jmp .loop
.end:
	ret
