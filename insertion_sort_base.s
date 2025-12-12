.data
a:  .word 43,46,2,6,4,2,32,87
n:  .word 8

.text
    LW    r2, n(r0)        ; r2 = n = 8
    DADDI r3, r0, 1        ; r3 = i = 1
    DADDI r4, r0, a        ; r4 = a (carica l'indirizzo base dell'array in r4)

extern_loop:
    SLT   r7, r3, r2       ; r7 = (i < size) ? 1 : 0
    BEQZ  r7, end_extern   ; if i >= size, esce dal ciclo

    DSLL  r6, r3, 2        ; r6 = i*4 (calcolo offset per 32-bit word)
    DADDU r8, r4, r6       ; r8 = &a[i]
    LW    r9, 0(r8)        ; r9 = valore_ins = a[i]

    DADDI r5, r3, -1       ; r5 = j = i - 1

inner_loop:    
    SLT   r10, r5, r0      ; r10 = (j < 0) ? 1 : 0
    BNEZ  r10, end_inner   ; if j < 0, esce dal ciclo 

    DSLL  r13, r5, 2       ; r13 = j * 4 (calcolo offset per 32-bit word)
    DADDU r14, r4, r13	   ; r14 = &a[j]
    LW    r11, 0(r14)	   ; r11 = a[j]

    SLT   r12, r9, r11     ; r12 = (valore_ins < a[j]) ? 1 : 0
    BEQZ  r12, end_inner   ; if valore_ins >= a[j], esce dal ciclo

    SW    r11, 4(r14)      ; a[j+1] = a[j]

    DADDI r5, r5, -1       ; j--

    J     inner_loop	   ; ripetizione del ciclo interno

end_inner:
    DADDI r5, r5, 1        ; r5 = j + 1   
    DSLL  r6, r5, 2	   ; r6 = j * 4 
    DADDU r8, r4, r6       ; r8 = &a[j+1]
    SW    r9, 0(r8)        ; r9 = a[j+1] = valore_ins

    DADDI r3, r3, 1        ; i++
    J     extern_loop	   ; ripetizione del ciclo esterno

end_extern:
    HALT
