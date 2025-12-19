#include <stdio.h>

void insertion_sort(int arr[],int n);

int main(){
    int i,n;
    int a[] = {2,4,6,5,0,7,1,3};

    n = sizeof(a)/sizeof(int);

    printf("### Insertion Sort ###\n");

    printf("Array di origine: \n");

    for(i=0;i<n;i++)
        printf("%d\t",a[i]);
    printf("\n");

    insertion_sort(a,n);

    printf("Array ordinato: \n");
    for(i=0;i<n;i++)
        printf("%d\t",a[i]);

    return 0;
}


void insertion_sort(int arr[],  /* Input: Array da ordinare */
                    int n){     /* Input: Numero di elementi */
                
    int tmp, /* Lavoro: valore temporaneo */
        i,   /* Lavoro: indice i dell'array */
        j;   /* Lavoro: indice j dell'array */

    for(i = 1; i < n; i++){
        tmp = arr[i]; /* Memorizzo l'elemento da ordinare */
        
        for(j = i - 1; j >= 0 && tmp < arr[j]; j--){                       
            arr[j + 1] = arr[j];        
        }
        arr[j + 1] = tmp; /* Inserisco l'elemento corrente in posizione corretta */
    }
}
