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

