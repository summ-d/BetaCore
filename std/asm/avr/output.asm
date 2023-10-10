

.global _print
.global _init_UART
.global _exit
.global _set_baud

section .text

  _set_baud:
    #TODO:
  

  _init_UART:
    sts 0xC4, r16
    sts 0xC5, r17

    ldi r16, (1 << RXEN0) | (1 << TXEN0)
    out UCSR0B, r16
    
    ldi r16, (1 << USBS0) | (3 << UCSZ00)
    out UCSR0C, r16
    ret

  _print:
    ldi r16, Z+
    cpi r16, 0x00
    breq exit

  puts:
    lds r17, UCSR0A
    sbrs r17, UDRE0
    rjmp puts

    sts UDR0, r16
    rjmp print
    
  _exit:
    ldi r0, 0x00
    ret

section .data

  .equ RXEN0 4
  .equ TXEN0 3
  .equ UCSR0B 0xC1
  .equ UCSR0A 0xC0
  .equ UCSR0C 0xC2
  .equ USBS0 3
  .equ UCSZ00 1
  .equ UDR0 0xC6
  .equ UDRE0 5