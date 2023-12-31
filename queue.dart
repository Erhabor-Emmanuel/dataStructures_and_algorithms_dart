
void main(){
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print("queue =====> $queue");

  queue.dequeue();
  print("queue =====> $queue");

  queue.peek;
  print("queue peek =====> ${queue.peek}");
}


abstract class Queue<E>{
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue<E>{
  final _list = <E>[];

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() => (isEmpty)? null : _list.removeAt(0);

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => (isEmpty)? null : _list.first;

  @override
  String toString() => _list.toString(); 
}