

.global _print
.global _exit


section .text


	_strlen:

		push %ebp
		mov %ebp, %esp
    mov %ebx, [ebp + 4]
    xor %eax, %eax

    jmp if
  
  then:
    inc %eax
  
  if:
    mov %cl, [%ebx + %eax]
    cmp %cl, 0x00
    jne then

  end:
    pop %edp
    ret
	
	_print:
		push %ebp           ; getting the argument of the string
    mov %ebp, %esp      ; moving the stack into the base
    mov %ebx, [ebp + 4] ; getting the argument
    call _strlen        ; calling strlen

    mov %edx, %eax
    mov %ecx, %ebx
    mov %eax, 0x00
    mov %eax, 0x04
    int 0x80
    call _exit
  
  _exit:
    mov %ebx, 0x00
    mov %eax, 0x01
    int 0x80
    
		
