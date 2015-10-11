import 'dart:html';
import 'dart:math' as math;

UListElement toDoList1;
InputElement toDoInput1;
UListElement toDoList2;
InputElement toDoInput2;
UListElement toDoList3;
InputElement toDoInput3;

void main() {
  toDoInput1=querySelector('#to-do-input1');
  toDoList1=querySelector('#to-do-list1');
  toDoInput1.onChange.listen(addToDoItem1);

  toDoInput2=querySelector('#to-do-input2');
  toDoList2=querySelector('#to-do-list2');
  toDoInput2.onChange.listen(addToDoItem2);


  querySelector('#sample_text_id')
..text = 'Click to obtain the result'
..onClick.listen(add);

}


void addToDoItem1(Event e) {
  var newToDo1=new LIElement();
  newToDo1.text=toDoInput1.value;

  toDoList1.children.add(newToDo1);}

void addToDoItem2(Event e){
  var newToDo2=new LIElement();
  newToDo2.text=toDoInput2.value;

  toDoList2.children.add(newToDo2);}

  void addToDoItem3(Event e){
    var newToDo3=new LIElement();
    newToDo3.text=toDoInput2.value;
    toDoInput3.value='';
    toDoList3.children.add(newToDo3);}

void add(MouseEvent event) {
  var i=int.parse(toDoInput1.value);
  var m=int.parse(toDoInput2.value);
  int s;
  {s=m+i;}
  querySelector('#sample_text_id').text = s.toString();}
