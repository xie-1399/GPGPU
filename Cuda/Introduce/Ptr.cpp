/* here add some ptr option as review */


#include <stdio.h>
#include <iostream>
using namespace std;

int main(){

    /* here add some ptr option */
    int *ptr1 = NULL;

    /* declare two ways */
    int value = 10;
    int *pi;
    pi = &value;

    int value1 = 10;
    int *ptr3 = &value1;

    cout << "addr:" << pi << "  " << "value:" << *pi << endl;
    cout << "addr:" << ptr3 << "  "<< "value:" << *ptr3 << endl;
    return 0;


    /* the pointer is not like the reference (like a label in it )*/
    int value4 = 10;
    int &r = value4;


}