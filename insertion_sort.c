#include <stdio.h>

void Insert_sort(int arr[],int n);


int main(){
    int i,n;
    int a[] = {16,4,15,5,1,6,2,10,9,11,12,13,8,3,7,14};

    n = sizeof(a)/sizeof(int);

    printf("### Insert Sort ###\n");

    printf("Array Originale: \n");

    for(i=0;i<n;i++)
        printf("%d\t",a[i]);
    printf("\n");

    Insert_sort(a,n);

    printf("Array ordinato: \n");
    for(i=0;i<n;i++)
        printf("%d\t",a[i]);

}


void Insert_sort(int arr[],  /* Input: Array da ordinare */
                int n       /* Input: Numero di elementi */
                ){

    int tmp, /* Lavoro: valore temporaneo */
        i,   /* Lavoro: indice i dell'array */
        j;   /* Lavoro: indice j dell'array */

    for(i = 1; i < n; i++){
        tmp = arr[i]; /* Memorizzo l'elemento corrente */
        j = i - 1; /* Riferimento all'elemento precedente */

        while(j >= 0 && arr[j] > tmp){ /* Se il valore precedente è maggiore del valore successivo && l'array non è finito */
            arr[j + 1] = arr[j];    /* Sposto l'elemento precedente nella posizione successiva */
            j--;                    /* Decremento per il contatore per il confronto successivo */
        }
        arr[j + 1] = tmp; /* Inserisco l'elemento corrente in posizione corretta */

    }
    
}
