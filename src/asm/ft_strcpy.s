section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax
.loop:
	cmp byte [rsi + rax], 0	; while dest is not at the end
	je .end
	mov dl, [rsi + rax]		; store the char in a tmp register
	mov [rdi + rax], dl		; and mov the char in the dest array
	inc rax
	jmp .loop
.end:
	mov byte [rdi + rax], 0	; null terminate the dest array
	lea rax, [rdi]			; assign the pointer to dest in rax
	ret
