extern malloc

section .text
	global ft_list_push_front

ft_list_push_front:
	push rdi
	push rsi
	mov rdi, 16
	call malloc wrt ..plt
	pop rsi
	pop rdi
	mov [rax], rsi		; new->data = data
	mov rbx, [rdi]		; rbx = *begin (tete)
	mov [rax + 8], rbx	; new->next = ancien begin
	mov [rdi], rax		; begin = new setup nouvelle tete
.end:
	ret
