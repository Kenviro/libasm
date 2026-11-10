extern malloc

section .text
	global ft_strdup

ft_strdup:
	xor rax, rax
.len:
	cmp byte [rdi + rax], 0	; count the size of src 
	je .malloc				; whene we know the size we can malloc
	inc rax
	jmp .len
.malloc:
	push rdi
	inc rax					; add 1 for '\0'
	mov rdi, rax			; setup malloc arg
	call malloc wrt ..plt	; call malloc - wrt ..plt to call extern function
	cmp rax, 0				; check if the new ptr is valid
	je .error
	pop rdi
	xor rdx, rdx
.copy:
	cmp byte [rdi + rdx], 0	; cpy like in strcpy
	je .end
	mov sil, [rdi + rdx]
	mov [rax + rdx], sil
	inc rdx
	jmp .copy
.end:
	mov byte [rax + rdx], 0
	ret
.error:
	ret
