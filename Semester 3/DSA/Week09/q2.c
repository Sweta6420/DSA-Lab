#include <stdio.h>
#include <stdlib.h>
typedef struct node
{
    int data;
    struct node* next;
} Node;
int search(Node * list, int x) {
    while (list != NULL) {
        if (list->data == x) return 1;
        list = list->next;
    }
    return 0;
}
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
void getUnion(Node *list1, Node *list2, Node *un) {
    int i = 0;
    Node * unHead = (Node *) malloc(sizeof(Node));
    unHead = un;
    while(list1 != NULL) {
        if (i == 0) {
            i=1;
            un->data = list1->data;
            un->next = NULL;
        }
        else {
            if (search(unHead,list1->data) == 0) {
                insertNode(un,list1->data);
                un = un->next;
            }}
        list1 = list1->next;
    }
    while(list2 != NULL) {
        if (search(unHead,list2->data) == 0) {
            insertNode(un,list2->data);
            un = un->next;
        }
        list2 = list2->next;
}}
void intersection(Node * list1, Node * list2, Node *inter) {
    int i=0;
    while(list1 != NULL) {
        if (search(list2,list1->data)) {
            if (i == 0) {
                i=1;
                inter->data = list1->data;
                inter->next = NULL;
            }
            else {
                insertNode(inter,list1->data);
                inter = inter->next;
        }}
        list1 = list1->next;
}}
void display(Node *node) {
    while(node != NULL) {
        printf("%d ",node->data);
        node = node->next;
    } printf("\n");
}
int main() {
    int n1,n2,x;
    printf("Enter number of elements in list 1: ");
    scanf("%d",&n1);
    printf("Enter number of elements in list 2: ");
    scanf("%d",&n2);
    Node *list1 = (Node *) malloc(sizeof(Node));
    Node *list2 = (Node *) malloc(sizeof(Node));
    Node *intList = (Node *) malloc(sizeof(Node));
    Node *unionList = (Node *) malloc(sizeof(Node));
    printf("Enter elements for list1: "); input(list1,n1);
    printf("The list is: "); display(list1);
    printf("Enter elements for list2: "); input(list2,n2);
    printf("The list is: "); display(list2);
    printf("Union is: "); getUnion(list1,list2,unionList);
    display(unionList); printf("Intersection is: ");
    if (n1 <= n2)  intersection(list1,list2,intList);
    else intersection(list2,list1,intList);
    display(intList);
}