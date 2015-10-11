import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput, toDoInput1, toDoInput2;
UListElement toDoList;

void main() {
  toDoInput=querySelector('#to-do-input');
  toDoInput1=querySelector('#to-do-input1');
  toDoInput2=querySelector('#to-do-input2');
  toDoList=querySelector('#to-do-list');

  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen((MouseEvent e)=>randomStudentID("you!",e));
  querySelector('#sample_text_id2')
    ..text="Please input the number.";
  querySelector('#sample_text_id3')
    ..text="Click me to get the result";
    querySelector('#button').onClick.listen(add);
    querySelector('#button').onClick.listen(addToDoItem);
}

void addToDoItem(Event e) {

  var newToDo = new LIElement();
  newToDo.text =toDoInput1.value+"+"+toDoInput2.value+ "="+toDoInput.value;
  querySelector('#button').value = 'answer';

  toDoList.children.add(newToDo);
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}

void add(MouseEvent event){
  int a =int.parse(document.getElementById("to-do-input1").value);
  int b =int.parse(document.getElementById("to-do-input2").value);
  var x =a+b;
  querySelector('#button').value=x.toString();
  toDoInput.value =x.toString();
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