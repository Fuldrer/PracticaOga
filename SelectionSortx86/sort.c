#include <easm_crt.h>
 
int get_min(int arreglo[], int n)
{
    int min = 0;
 
    for(int i = 1; i<n; i++) {
        if(arreglo[min] > arreglo[i])
            min = i;
    }
    return min;
}
 
void selection_sort(int arreglo[], int n) 
{
    if (n > 1) {
        int pos = get_min(arreglo, n);
        if(pos != 0) {
            int temp = arreglo[0];
            arreglo[0] = arreglo[pos];
            arreglo[pos] = temp;
        }
        selection_sort(&arreglo[1], n-1);
    }
}
 
int main()
{
    int arr[] = {100, 2, 67, 38, 76, 12, 50, 62, 14, 60, 294, 193, 351};
    int size = sizeof(arr) / sizeof(arr[0]);
    
    selection_sort(arr, size);
    print_str("Sorted array: ");
    for (int i = 0; i < size; i++)
    {
        print_int(arr[i]);
        print_char(' ');
    }
    print_char('\n');
    
    return 0;
}