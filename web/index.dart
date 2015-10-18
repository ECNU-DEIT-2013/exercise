import 'dart:html';
import 'dart:math' as math;

InputElement toDoInput;
UListElement toDoList1,toDoList2;
ButtonElement button1,button2,button3,button4,button5;

void main() {
  toDoList1 = querySelector('#to-do-list');
  toDoList2 = querySelector("#to-do-list1");
  button1 = querySelector('#add');
  button2=querySelector('#delete');
  button3=querySelector('#input');
  button4=querySelector('#sum1');
  button5=querySelector('#delete1');
  button1.onClick.listen(addToDoItem);
  button2.onClick.listen((e) {
    toDoList1.children.clear();
  });
  button3.onClick.listen(addTry);
  button4.onClick.listen(addNumber);
  button5.onClick.listen((e) {
    toDoList2.children.clear();
  });
  button5.onClick.listen(backsPace);
}

void addToDoItem(Event e) {
  var newToDo = new InputElement();
  var a,b,c;
  a=int.parse(document.getElementById('input1').value);
  b=int.parse(document.getElementById('input2').value);
  c=a+b;
  newToDo.value=c.toString();
  toDoList1.children.add(newToDo);
}

void addTry(Event e) {
  var newToDo = new InputElement();
  newToDo.value = '';
  toDoList2.children.add(newToDo);
}

void addNumber(Event e){
  var s=0;
  var i=0;
  var a=int.parse(toDoList2.children[i].value);
  do{                                                    //为什么不能用？
    s=s+a;
    i=i+1;
    a=int.parse(toDoList2.children[i].value);
  }while(a);                                            //
  querySelector('#sum').text = s.toString();
}

void backsPace(Event e){
  querySelector('#sum').text ='';
}