extern __errno_location

section .text
	global ft_write

ft_write:
	mov rax, 1						; setup the syscall to call write
	syscall							; the arg are already setup so we can call write
	cmp rax, 0						; check if there is any error
	jl .error
	ret
.error:
	neg rax
	push rax
	call __errno_location wrt ..plt	; call to get errno 
	pop rdx
	mov [rax], edx					; setup errno
	mov rax, -1						; setup the return value
	ret
