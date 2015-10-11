import 'dart:html';
InputElement toDoInput,toDoInput1,toDoInput2;
UListElement toDoList;

//var number=0;
void main() {
  toDoInput = querySelector('#to-do-input');
  toDoInput1 = querySelector('#to-do-input1');
  toDoInput2 = querySelector('#to-do-input2');
  toDoList = querySelector('#to-do-list');

  querySelector('#sample_text_id1')
    ..text = '1+..+100=?'
    ..onClick.listen(addSum);
  querySelector('#sample_text_id2')
    ..text = 'Here is the answer...';
  querySelector('#button').onClick.listen(add);
  querySelector('#button').onClick.listen(addToDo);
}
void addToDo(Event e) {

  var newToDo = new LIElement();
  newToDo.text =toDoInput1.value+" + "+toDoInput2.value+ " = "+toDoInput.value;
  querySelector('#button').value = 'answer';

  toDoList.children.add(newToDo);
}
void add(MouseEvent event){
  int a =int.parse(document.getElementById("to-do-input1").value);
  int b =int.parse(document.getElementById("to-do-input2").value);
  var x =a+b;
  querySelector('#button').value =x.toString();
  toDoInput.value =x.toString();
}

void addSum(MouseEvent event) {
  var number=0;
  for (var i = 1;i<=100;i++)
  {
    number = i+ number;
  }
  querySelector('#sample_text_id2').text = number.toString();
}


