; insertion sort

.data 
    a:  .word 5, 2, 3, 1, 7, 0, 4, 6    ; array di interi
    n:  .word 8                         ; numero di elementi

.text
partial:
    LW r2, n(r0)                         ; dimensione array
    DADDI r3, r0, 1                      ; contatore i
    DADDI r4, r0, a                      ; array

extern_loop:                             ; Ciclo for esterno