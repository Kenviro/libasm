section .text
	global ft_list_sort

ft_list_sort:
	mov rbx, [rdi]			; list = *begin
	mov r9, rsi				; save the ptr to the fnct
	push rdi				; save the ptr to begin
.loop:
	cmp QWORD [rbx + 8], 0	; if list->next = NULL
	je .end
	mov r8, [rbx + 8]		; tmp = list->next
	mov rdi, [rbx]			; extract list->data
	mov rsi, [r8]			; extract next->data
	call r9					; call fnct ptr
	cmp eax, 0
	jg .swap
	mov rbx, [rbx + 8]		; list = list->next
	jmp .loop
.swap:
	mov rcx, [rbx]			; tmp = list->data
	mov [rbx], rsi			; list->data = next->data
	mov [r8], rcx			; next->data = tmp
	pop rdi
	mov rbx, [rdi]			; list = *begin
	push rdi
	jmp .loop
.end:
	pop rdi
	ret

