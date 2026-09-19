## FUNCTION ARGUMENT
it depends of the size of the value (8bit char -> dil, 32bit int -> edi, 64bit ptr -> rdi)
the different arguments are stored in different register depending of their size but if multiple argument of the same size are transfered as argument they are stored in a suite of pre defined register

|argument|8bits|16bits|32bits|64bits|
|1|dil|di|edi|rdi|
|2|sil|si|esi|rsi|
|3|dl|dx|edx|rdx|
|4|el|ex|ecx|rcx|
|5|r8b|r8w|r8d|r8|
|6|r9b|r9w|r9d|r9|

every argument after the 6th are stored in the stack
and remember we count only on with each size separetly:
`void f(int n, int n1, int n2, int n3, char* s)``
the int are stored in edi->esi->edx->ecx but `s` will be stored in rdi because it is the first 64bits variable

## RETURN VALUE
by convention the return value of a function is stored in the `rax` register

## REGISTER
|64 bits|	32 bits|	16 bits|	8 bits (bas)|	8 bits (haut)|
|rax|	eax|	ax|	al|	ah|
|rbx|	ebx|	bx|	bl|	bh|
|rcx|	ecx|	cx|	cl|	ch|
|rdx|	edx|	dx|	dl|	dh|
|rsi|	esi|	si|	sil|	—|
|rdi|	edi|	di|	dil|	—|
|rbp|	ebp|	bp|	bpl|	—|
|rsp|	esp|	sp|	spl|	—|
|r8|	r8d|	r8w|	r8b|	—|
|r9|	r9d|	r9w|	r9b|	—|
|r10|	r10d|	r10w|	r10b|	—|
|r11|	r11d|	r11w|	r11b|	—|
|r12|	r12d|	r12w|	r12b|	—|
|r13|	r13d|	r13w|	r13b|	—|
|r14|	r14d|	r14w|	r14b|	—|
|r15|	r15d|	r15w|	r15b|	—|
