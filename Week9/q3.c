#include<stdio.h>
#include<stdlib.h>
typedef struct node *Node;
typedef struct node{
    char data;
    Node next;
}LL;
Node getNode(){
    Node temp = (Node)malloc(sizeof(LL));
    return temp;
}
void InsertRear(Node* List,int ele){
    Node head = *List;
    Node rear;
    Node temp = getNode();
    temp->data = ele;
    temp->next = head;
    if(*List == NULL){
        *List = temp; head = *List;
        (*List)->next = head; return;
    } rear = head->next;
    while(rear->next != head)rear = rear->next;
    rear->next = temp;
}
void display(Node List){
    Node head = List;
    printf("%c ",head->data);
    Node temp = head->next;
    while(temp != head){
        printf("%c ",temp->data); temp = temp->next;
}}
void sort(Node* List){
    Node head = *List, current = *List, next = NULL;
    char x;
    while(current->next != head){
        next = current->next;
        while(next != head){
            if(current->data > next->data){
                x = current->data; current->data = next->data;
                next->data = x;
            } next = next->next;
        } current = current->next;
}}
void merge(Node* List1,Node List2){
    Node First = *List1, Second = List2, rear = First->next, temp;
    while(rear->next != First)rear = rear->next;
    temp = getNode();
    temp->data = List2->data; temp->next = First;
    rear->next = temp; rear = rear->next;
    List2 = List2->next;
    while(List2 != Second){
        temp = getNode();
        temp->data = List2->data; temp->next = First;
        rear->next = temp; rear = rear->next;
        List2 = List2->next;
}}
void main(){
    Node List1 = NULL, List2 = NULL;
    InsertRear(&List1,'d'); InsertRear(&List1,'e'); InsertRear(&List1,'f');
    display(List1); printf("\n");
    InsertRear(&List2,'a'); InsertRear(&List2,'b'); InsertRear(&List2,'c');
    display(List2); printf("\n");
    merge(&List1,List2); sort(&List1); display(List1);
}