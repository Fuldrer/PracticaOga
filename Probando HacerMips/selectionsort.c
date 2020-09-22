//#include <easm_crt.h>
 
void selection_sort(int array[], int n)
{
    for (int c = 0; c < (n - 1); c++)
    {
        int position = c;
    
        for (int d = c + 1; d < n; d++)
        {
            if (array[position] > array[d])
                position = d;
        }
        
        if (position != c)
        {
            int swap = array[c];
            array[c] = array[position];
            array[position] = swap;
        }
    }
}
 
int main()
{
    int array[] = {91, 96, 48, 1, 8, 52, 9, 24, 45, 9};
    int size = sizeof(array)/sizeof(array[0]);
    
    selection_sort(array, size);
    for (int i = 0; i < size; i++)
    {
        print_int(array[i]);
        print_char('\n');
    }
}