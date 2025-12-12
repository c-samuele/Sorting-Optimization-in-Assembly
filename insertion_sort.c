#include <stdio.h>

void insertion_sort(int arr[],int n);


int main(){
    int i,n;
    int a[] = {16,4,15,5,1,6,2,10};

    n = sizeof(a)/sizeof(int);

    printf("### Insert Sort ###\n");

    printf("Array Originale: \n");

    for(i=0;i<n;i++)
        printf("%d\t",a[i]);
    printf("\n");

    insertion_sort(a,n);

    printf("Array ordinato: \n");
    for(i=0;i<n;i++)
        printf("%d\t",a[i]);

}


void insertion_sort(int arr[],  /* Input: Array da ordinare */
                int n       /* Input: Numero di elementi */
                ){

    int tmp, /* Lavoro: valore temporaneo */
        i,   /* Lavoro: indice i dell'array */
        j;   /* Lavoro: indice j dell'array */

    for(i = 1; i < n; i++){
        tmp = arr[i]; /* Memorizzo l'elemento corrente */
        
        for(j = i - 1;                  /* Riferimento all'elemento precedente */
            j >= 0 && tmp < arr[j];     /* Se il valore precedente è maggiore del valore successivo && l'array non è finito */
            j--){                       /* Decremento per il contatore per il confronto successivo */
            arr[j + 1] = arr[j];        /* Sposto l'elemento precedente nella posizione successiva */
        }
        arr[j + 1] = tmp; /* Inserisco l'elemento corrente in posizione corretta */

    }
    
}
