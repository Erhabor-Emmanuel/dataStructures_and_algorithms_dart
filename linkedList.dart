
//Linked lists are dynamic data structures, meaning they can grow or
// shrink in size during program execution, unlike arrays that have a fixed size.

void main(){
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);

  // //You’ve just created three nodes and connected them:
  // node1.next = node2;
  // node2.next = node3;

  // print(node1);

  // final node4 = LinkedList();
  // print(node4);

  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print(list);

  var middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);

  print("After: $list");
}

class Node<T>{
  //Node only knows a single value;
  //T is the standard letter people use to indicate that the node can hold any type. 
  T value;
  Node<T>? next;
  Node({required this.value, this.next});

  @override
  String toString(){
    //This will recursively print all of the nodes after this one in the linked list
    if (next == null){
      return '$value';
    }
    return '$value -> ${next.toString()}';
  }

  //When a method call itself its known as recurrsion
  //A recursive method must have a base case which is exit strategy so that the method does not
  //keep calling itself forever. In the above example the base currency is when the next node is null

  //A linked list has the concept of a head and tail, which refers to the first and last 
//nodes of the list
}

//A linked list has the concept of a head and tail, which refers to the first and last 
//nodes of the list
class LinkedList<E>{
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  @override
  String toString(){
    if(isEmpty) return 'Empty List';
    return head.toString();
  }

//You know that the list is empty if the head is null. Also, since you already designed 
//Node to recursively print any nodes that follow it, you can print the entire linked list 
//just by calling head.toString.


//Adding Values to a List
// There are three ways to add values to a linked list

// 1..push: Adds a value at the front of the list
// 2..append: Adds a value at the end of the list.
// 3..insertAfter: Adds a value after a particular node in the list.

//push------- also known as "Head first insertion"
void push(E value){
  //You create a new node and point to the node that used to be head. Then you set this 
//new node as head. In the case in which you’re pushing into an empty list, the new 
//node is both the head and tail of the list.
  head = Node(value: value, next: head);
  tail ??= head;
}
//That was a lot easier than building the list by chaining nodes together by hand!

void append(E value) {
 // 1
 if (isEmpty) {
 push(value);
 return;
 }
 // 2
 tail!.next = Node(value: value);
 // 3
 tail = tail!.next;
}


//Inserting in Middle of a List
//This operation inserts a value after a particular node in the list, and requires two steps:
//a. Finding a particular node in the list.
//b. Inserting the new node after it.
Node<E>? nodeAt(int index){
  //You create a new reference to head and set up a counter to keep track of where you are in the list
  //Using a while loop, you move the reference down the list until you’ve reached the desired index
  var currentNode = head;
  var currentIndex = 0;

  while(currentNode != null && currentIndex < index){
    currentNode = currentNode.next;
    currentIndex +=1;
  }
  return currentNode;
}

Node<E>? insertAfter(Node<E> node, E value){
  if(tail == node){
    append(value);
    return tail;
  }

  node.next = Node(value: value, next: node.next);
  return node.next;
}
}

//Creating an Iterator
class _LinkedListIterator<E> implements Iterator<E>{
  final LinkedList _list;
  _LinkedListIterator(LinkedList<E> list) : _list = list;

  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext(){
    if(_list.isEmpty) return false;
    
    if(_firstPass){
      // _currentNode = _list.head;
      _firstPass = false;
    }else{
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}

