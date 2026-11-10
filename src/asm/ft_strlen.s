section .text
	global ft_strlen

ft_strlen:
	xor rax, rax			; xor the rax register to nullify him
.loop:
	cmp byte [rdi + rax], 0	; cmp if our char is '\0'
	je .end
	inc rax					; inc of 1 our return value
	jmp .loop
.end:
	ret
