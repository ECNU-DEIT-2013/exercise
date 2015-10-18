import 'dart:html';
import 'dart:math' as math;

InputElement toDoInput;
UListElement toDoList;

void main() {
  toDoInput=querySelector('#to-do-input2');
  toDoList=querySelector('#to-do-list');
  toDoInput.onChange.listen(addToDoItem);
  //querySelector('#sample_text_id')
    //..text = '='
   // ..onClick.listen(addToDoItem);
  querySelector('#clear-id')
    ..text = 'clear'
    ..onClick.listen(clearItem);
}

void addNumber(MouseEvent event)
{ var i;
  var A= int.parse(document.getElementById("left").value);
  var B=int.parse(document.getElementById("right").value);
  var sum=0;
  var C;
  if(A>B)
  { C=A;
    A=B;
    B=C;}
  for(i=A;i<=B;i++)
  sum=sum+i;
querySelector('#sample_text').text=sum.toString();
}

void addToDoItem(Event e){
  var newToDo=new LIElement();
  var A=int.parse(document.getElementById("to-do-input1").value);
  var B=int.parse(toDoInput.value);
  var sum=0;
  sum=A+B;
  newToDo.text=sum.toString();
  toDoList.children.add(newToDo);
  querySelector('#sample_text').text=sum.toString();
}

void clearItem(MouseEvent event){
  document.getElementById("to-do-input1").value='';
  toDoInput.value='';
  querySelector('#sample_text').text='';
  //toDoList.children.clear();
}