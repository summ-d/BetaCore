

.global _print
.global _exit


section .text

  _strlen:
    mov r1, [r0 + r2]
    cmp r1, 0x00
    bne continue
    ret

  continue:
      add r2, r2, 1
      b _strlen

  _print:
    mov r1, r0
    mov r0, 0x01
    mov r7, 0x04
    svc 0
    b _exit

  _exit:
    mov r0, 0
    mov r7, 1
    svc 0
  