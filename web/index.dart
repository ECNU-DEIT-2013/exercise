import 'dart:html';
import 'dart:math' as math;

InputElement toDoInput;
UListElement toDoList;
ButtonElement toDoButton,toDobutton2,toDobutton3;

void main() {
  toDoButton = querySelector('#button');
  toDobutton2 = querySelector('#button2');
  toDoList = querySelector('#to-do-list');
  toDoButton.onClick.listen(addToDoItem);
  toDobutton2.onClick.listen(adding);
  querySelector('#button3').onClick.listen((e) => toDoList.children.clear());
  querySelector('#sample_text_id').onClick.listen(add);
}

void remove(Event e){
  toDoList.children[0].text='';
  toDoList.children[1].text='';
}

void adding(Event e){
  var a,b,x,y,z;
  a=toDoList.children[0].value;
  b=toDoList.children[1].value;
  x=int.parse(a);
  y=int.parse(b);
  z=x+y;
  querySelector('#result').text=z.toString();
}

void addToDoItem(Event e) {
  var newInput = new TextInputElement();
  newInput.value = '';
  toDoList.children.add(newInput);
}

void add(MouseEvent event) {
  var buffer =0;
  for (int i = 0; i <= 100; i++) {
    buffer=buffer+i;
  }
  querySelector('#sample_text_id').text = buffer.toString();
}
void randomStudentID(String showStr,MouseEvent even){
  var students={
    0:10001,
    1:10002,
    2:100003,
    3:100004,
    4:100005,
    5:100005
  };
  var random = new math.Random();
  var getYou=students[random.nextInt(6)];
  querySelector('#sample_studentid_id').text = getYou.toString()+showStr;
}
