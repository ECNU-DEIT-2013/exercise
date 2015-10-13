import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput;
UListElement toDoList;
UListElement list1;
ButtonElement toDoButton;
ButtonElement addup;
ButtonElement addthemup;


int sum=0;
int j=0;
 void main() {
querySelector('#sample_text_id1');


  toDoButton = querySelector('#to-do-button');
  toDoButton.onClick.listen(addToDoItem1);



  addup = querySelector('#button1');
  list1 = querySelector('#list1');
  addup.onClick.listen(addnumup);


}

void addnumberup(Event e){
  var a=toDoList.children[0].value;
  var b=toDoList.children[1].value;
  var x=int.parse(a);
  var y=int.parse(b);
  var c=x+y;
  var newToDo=new TextInputElement();
  newToDo.value=c.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());
  list3.children.add(newToDo);
}

void addnumup(Event e){
  var a=int.parse(querySelector('#kongge').value);
 var b=int.parse(querySelector('#kongge1').value);
  var c=a+b;
  var newToDo=new TextInputElement();
  newToDo.value=c.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());
  list1.children.add(newToDo);
}





void addToDoItem1(Event e) {
  var newToDo=new TextInputElement();
  newToDo.text='';
  toDoList.children.add(newToDo);
}



 void display(MouseEvent event){
j=1;
}






