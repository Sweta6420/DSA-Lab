#include <stdio.h>
#include <stdlib.h>
typedef struct node
{
    int data;
    struct node* next;
} Node;
void insertNode(Node * prev,int x) {
    Node * new = (Node *) malloc(sizeof(Node));
    new->data = x;
    new->next = prev->next;
    prev->next = new;
}
void input(Node *node,int n) {
    int i,temp;
    for (i=0;i<n;i++) {
        scanf("%d",&temp);
        if (i == 0) {
            node->data = temp;
            node->next = NULL;
            continue;
        }
        insertNode(node,temp);
        node = node->next;
}}

void deleteDuplicates(Node **head){
    Node *current = *head,*next,*prev;   
    if(head == NULL) printf("List is Empty");
    else{
        while(current != NULL){
            next = current->next;
            prev = current;
            while(next!=NULL){
                if(current->data == next->data){
                    prev->next = next->next;
                    free(next);
                    next = prev;
                }
                next = next->next;
                prev = prev->next;
            }
            current = current->next;
}}}
void display(Node *node) {
    while(node != NULL) {
        printf("%d ",node->data);
        node = node->next;
    } printf("\n");
}
int main() {
    int n,x;
    Node *list = (Node *) malloc(sizeof(Node));
    printf("Enter length of list: "); scanf("%d",&n);
    printf("Enter input for list: "); input(list,n);
    printf("After removing duplicates: "); deleteDuplicates(&list);
    display(list);
}