#include<stdio.h>
#include<stdlib.h>
typedef struct node
{
    int data;
    struct node* next;
} Node;
int isEmpty(Node * list) {
    if (list == NULL) return 1;
    return 0;
}
void insertNode(Node * prev,int x) {
    Node * new = (Node *) malloc(sizeof(Node));
    new->data = x;
    new->next = prev->next;
    prev->next = new;
}
void deleteNode(Node ** list, Node * x) {
    if (*list == x) *list = (*list)->next;
    else {
        Node * temp = (Node *) malloc(sizeof(Node));
        temp = *list;
        while (temp->next != NULL) {
            if (temp->next == x) {
                temp->next = x->next;
                break;
            }
            temp = temp->next;
    }} free(x);
}
void enqueue(Node ** list, int x) {
    Node * new = (Node *) malloc(sizeof(Node));
    if (isEmpty(*list)) {
        *list = new;
        (*list)->data = x;
        (*list)->next = NULL;
    }
    else {
        new = *list;
        while (new->next != NULL) new = new->next;
        insertNode(new,x);
    }
}
int dequeue(Node **list) {
    if (isEmpty(*list)) {
        printf("Error. Empty queue");
        return -5;
    }
    else {
        int x = (*list)->data;
        deleteNode(list,*list);
        return x;
    }
}
void display(Node *node) {
    while(node != NULL) {
        printf("%d ",node->data);
        node = node->next;
    }
}
int main() {
    int x,inp;
    Node * list = (Node *) malloc(sizeof(Node));
    list = NULL;
    printf("1) Enqueue 2) Dequeue 3) Exit");
    do {
        printf("\nEnter choice ");
        scanf("%d",&inp);
        if (inp == 1) {
            printf("Enter number to enqueue ");
            scanf("%d",&x);
            enqueue(&list,x);
            display(list);
        }
        else if (inp == 2) printf("Dequeued: %d",dequeue(&list));
        else inp = -1;
    } while (inp == 3);
}