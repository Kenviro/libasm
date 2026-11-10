extern __errno_location

section .text
	global ft_read

ft_read:
	mov rax, 0						; setup the syscall
	syscall
	cmp rax, 0
	jl .error
	ret
.error:
	neg rax
	push rax
	call __errno_location wrt ..plt ; call errno
	pop rdx
	mov [rax], edx					; setup errno
	mov rax, -1						; setup the return value
	ret
