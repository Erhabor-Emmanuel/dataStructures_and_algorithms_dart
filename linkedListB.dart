import 'dart:collection';

void main(){
  final linkedList = LinkedList<int>();

  linkedList.add(10);
  linkedList.add(20);
  linkedList.add(30);

  linkedList.printList(); // Output: 10 20 30

  linkedList.remove(20);

  linkedList.printList(); // Output: 10 30
}

class Node<T> {
  T? value;
  Node<T>? next;

  Node(this.value);
}

class LinkedList<T>{
  Node<T>? head; //Reference to the first node in the list

  LinkedList();
  bool get isEmpty => head == null; //check if the list is empty;

  //Add a new node to the end of the list
  void add(T value){
    final newNode = Node<T>(value);
    if(isEmpty){
      //if the list is empty set the new node as the head;
      head = newNode;
    }else {
      var current = head;
      while(current!.next != null){
        //Traverse the list to find the last node
        current = current.next;
      }
      current.next = newNode; // Set the new node as the next node of the last node
    }
  }

  //Remove the first node with the given value
  void remove(T value){
    if(isEmpty) return;

    if(head!.value == value){
      //if the value is in the head node, update the head to the next node
      head = head!.next;
      return;
    }
    var current = head;
    while(current!.next != null){
      if(current.next!.value == value){
        //if the value is found in the next node, skip the next node;
        current.next == current.next!.next;
        return;
      }
      current = current.next;
    }
  }

  // Print the values of all nodes in the list
  void printList() {
    var current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}
