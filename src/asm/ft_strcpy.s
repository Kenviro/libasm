section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax
.loop:
	cmp byte [rsi + rax], 0
	je .end
	mov dl, [rsi + rax]
	mov [rdi + rax], dl
	inc rax
	jmp .loop
.end:
	mov [rdi + rax], 0
	lea rax, [rdi]
	ret
