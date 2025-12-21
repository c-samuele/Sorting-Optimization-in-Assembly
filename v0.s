.data
a:  .word 2,4,6,5,0,7,1,3
n:  .word 8

.text
    LD    r2, n(r0)        ; r2 = n = 8
    DADDI r3, r0, 1        ; r3 = i = 1
    DADDI r4, r0, a        ; r4 = a (carica l'indirizzo base dell'array in r4)

extern_loop:
    SLT   r7, r3, r2       ; r7 = (i < n) ? 1 : 0 
    BEQZ  r7, end_extern   ; if i >= n, esce dal ciclo

    DSLL  r6, r3, 3        ; r6 = i*8 (calcolo offset per 64-bit word)
    DADDU r8, r4, r6       ; r8 = &a[i]
    LD    r9, 0(r8)        ; r9 = tmp = a[i]

    DADDI r5, r3, -1       ; r5 = j = i - 1

inner_loop:    
    SLT r10, r5, r0        ; r10 = 1 se j < 0
    BNEZ r10, end_inner    ; se j < 0, esce dal ciclo

    DSLL  r13, r5, 3       ; r13 = j * 8 (calcolo offset per 64-bit word)
    DADDU r14, r4, r13	   ; r14 = &a[j]
    LD    r11, 0(r14)	   ; r11 = a[j]

    SLT   r12, r9, r11     ; r12 = (tmp < a[j]) ? 1 : 0
    BEQZ  r12, end_inner   ; if tmp >= a[j], esce dal ciclo

    SD    r11, 8(r14)      ; a[j+1] = a[j]

    DADDI r5, r5, -1       ; j--

    J     inner_loop	   ; ripetizione del ciclo interno

end_inner:
    DADDI r5, r5, 1        ; r5 = j + 1   
    DSLL  r6, r5, 3	       ; r6 = j * 8 
    DADDU r15, r4, r6       ; r15 = &a[j+1]
    SD    r9, 0(r15)        ; r9 = a[j+1] = tmp

    DADDI r3, r3, 1        ; i++
    J     extern_loop	   ; ripetizione del ciclo esterno

end_extern:
    HALT
