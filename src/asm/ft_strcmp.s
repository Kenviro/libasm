section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
.loop:
	movzx rdx, byte [rdi + rax]
	movzx rcx, byte [rsi + rax]
	cmp rdx, rcx
	jne .diff
	cmp rdx, 0
	je .end
	inc rax
	jmp .loop
.diff:
	sub rdx, rcx
	mov rax, rdx
	ret
.end:
	xor rax, rax
	ret
