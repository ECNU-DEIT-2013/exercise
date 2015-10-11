import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput;
UListElement toDoList;
UListElement list1;
UListElement list3;
ButtonElement toDoButton;
ButtonElement clear;
ButtonElement addup;
ButtonElement addthemup;
ButtonElement clear1;

int sum=0;
int j=0;

void main() {
  querySelector('#sample_text_id1')
    ..text = 'Add:1+2+...+100='
    ..onClick.listen(display);

  toDoList = querySelector('#list2');
  toDoButton = querySelector('#to-do-button');
  toDoButton.onClick.listen(addToDoItem1);

  addthemup=querySelector('#button3');
  list3 = querySelector('#list3');
  addthemup.onClick.listen(addnumberup);

  addup = querySelector('#button1');
  list1 = querySelector('#list1');
  addup.onClick.listen(addnumup);

  clear = querySelector('#button2');
  clear.onClick.listen((e)=>list1.children.clear());
  clear.onClick.listen(qingkong);

  clear1 = querySelector('#button4');
  clear1.onClick.listen((e)=>list3.children.clear());
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
  var a=int.parse(querySelector('#kong1').value);
  var b=int.parse(querySelector('#kong2').value);
  var c=a+b;
  var newToDo=new TextInputElement();
  newToDo.value=c.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());
  list1.children.add(newToDo);
}

void qingkong(Event e){
  querySelector('#kong1').value='';
  querySelector('#kong2').value='';
}


void addToDoItem1(Event e) {
  var newToDo=new TextInputElement();
  newToDo.text='';
  toDoList.children.add(newToDo);
}

void addsum(){
  for (int i=1;i<=100;i++)
    sum=sum+i;
  return sum;
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}

void display(MouseEvent event){
  int a=addsum();
  if (j<=0){
    querySelector('#sample_text_id1').text = querySelector('#sample_text_id1').text+a.toString();
    j=1;
  }
}
