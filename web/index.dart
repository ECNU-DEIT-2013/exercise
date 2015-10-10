import 'dart:html';
import 'dart:math' as math;

UListElement toDoList;

void main() {
  querySelector('#to-do-input')
    ..onClick.listen(addToDoItem);
}


void addToDoItem(Event e) {
  var newToDo=new LIElement();
  newToDo.value="1234";
  toDoList.children.add(newToDo);

}
