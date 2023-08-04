void main(){
  
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack);

  final element = stack.pop();
  print('Popped: $element');

  const list = ['S', 'M', 'O', 'K', 'E'];
  final smokeStack = Stack.of(list);
  print(smokeStack);
  smokeStack.pop();

}

class Stack<E>{
  Stack() : _storage = <E>[];
  //The letter E represents any data type you will mwant to put inside your stack
  //whether that be string or double of your own custom type
  final List<E> _storage;

  @override
  String toString() {
    // This will list all of the elements in _storage with the last one at the top.
    return '--- Top ---\n'
          '${_storage.reversed.join('\n')}'
          '\n------------';
  }

  //Calling push will add an element to the end of the list
  void push(E element)=> _storage.add(element);
  //while pop will remove the last element of the list and return it
  E pop() => _storage.removeLast();

  //Creating a Stack From an Iterable
  // you can add a named constructor that just sets the underlying private storage
  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  //push and pop both have O(1) time complexity.
}