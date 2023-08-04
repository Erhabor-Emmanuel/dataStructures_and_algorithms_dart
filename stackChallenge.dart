

void main(){
  final stackTest = StackTest<int>();
  const listTest = ['C', 'R', 'E', 'A', 'T', 'E'];
  final createThings = StackTest.of(listTest);
  print(createThings);

  stackTest.checkParenthesis('h((e))llo(world)');
  print(stackTest);
}

class StackTest<E>{
  final List<E> _storageTest;
  StackTest() : _storageTest = <E>[];

  StackTest.of(Iterable<E> elements) : _storageTest = List.of(elements);

  @override
  String toString(){
    return '---- Top ----\n'
          '${_storageTest.reversed.join('\n')}'
          '\n-------------';
  }

  void push(E element)=> _storageTest.add(element);
  E pop()=> _storageTest.removeLast();

  //peek is an operation that is often attributed to the stack interface. The idea of peek
//is to look at the top element of the stack without mutating its contents.

  E get peek => _storageTest.last;
  bool get isEmpty => _storageTest.isEmpty;
  bool get isNotEmpty => !isEmpty;

  //------Challenge-----
  //Check for balanced parentheses. Given a string, check if there are ( and ) characters, 
  //and return true if the parentheses in the string are balanced. For example:

  // 1
//h((e))llo(world)() // balanced parentheses
// 2
//(hello world // unbalanced parentheses

bool checkParenthesis(String text){
  var stack = StackTest<int>();

  final open = '('.codeUnitAt(0);
  final close = ')'.codeUnitAt(0);

  for(int codeunit in text.codeUnits){
    if(codeunit == open){
      stack.push(codeunit);
      print(stack);
    } else if(codeunit == close){
      if(stack.isEmpty){
        return false;
      }else{
        stack.pop();
      }
    }
  }
  return stack.isEmpty;
}
}