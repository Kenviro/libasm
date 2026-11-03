section .text
	global ft_list_remove_if
	extern free

ft_list_remove_if:
	push rbx				; push callee saved register
	push r12				; to store the argument
	push r13
	push r14
	push r15
	cmp rdi, 0				; check if *begin is NULL
	je .end
	mov rbx, rdi			; save begin
	mov r12, rsi			; save rsi - cmp_data
	mov r13, rdx			; save rdx - cmp_fnct
	mov r14, rcx			; save rcx - free_fct
.loop:
	mov r15, [rbx]			; r15 = *begin to keep a pointer to begin
	cmp r15, 0				; if list == NULL
	je .end
	mov rdi, [r15]			; put list->data as first arg
	mov rsi, r12			; put cmp_data as second arg
	call r13				; cmp list->data to rsi
	cmp eax, 0
	je .delete
	lea rbx, [r15 + 8]		; list = list->next
	jmp .loop
.delete:
	mov rax, [r15 + 8]		; list->next
	mov [rbx], rax			; load in rbx next 
	mov rdi, [r15]			; put list->data as first arg
	call r14				; call free to free list->data
	mov rdi, r15			; put list in first arg
	call free wrt ..plt		; call free to store list
	jmp .loop
.end:
	pop r15					; resotre every callee saved register
	pop r14
	pop r13
	pop r12
	pop rbx
	ret
