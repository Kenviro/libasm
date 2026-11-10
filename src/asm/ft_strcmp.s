section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
.loop:
	movzx rdx, byte [rdi + rax]	; movzx to mov only the last byte and set the rest at 0
	movzx rcx, byte [rsi + rax]
	cmp rdx, rcx				; cmp the 2 charactere
	jne .diff
	cmp rdx, 0
	je .end
	inc rax
	jmp .loop
.diff:
	sub rdx, rcx				; sub the first char to the last 
	mov rax, rdx				; and store it in return
	ret
.end:
	xor rax, rax
	ret
