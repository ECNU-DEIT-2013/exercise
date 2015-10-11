import 'dart:html';

InputElement T1,T2;
UListElement toDoList;

void main() {
  T1= querySelector('#text1');
  T2= querySelector('#text2');
  querySelector('#text1').value = 1.toString();
  querySelector('#button').onClick.listen((MouseEvent e)=>pluse(int.parse(document.getElementById("text1").value),e));
  toDoList = querySelector('#to-do-list');
  querySelector('#button2').onClick..listen(addToDoItem);
}
void pluse(int n1,MouseEvent e){
  int s=0, a=5;
  for(int i = n1;;i++){
    s=5+i;
  }
  querySelector('#text2').value=s.toString();
}
void addToDoItem(MouseEvent e) {
  var newToDo = new LIElement();
  newToDo.text =querySelector('#text2').value;
  T1.value = '';T2.value='';
  toDoList.children.add(newToDo);
}

void add(MouseEvent event) {
  var sum = 0;
  for (var i = 0;i <= 100;i++) {
    sum = sum + i;
  }
  querySelector('#sample_text_id').text = sum.toString();
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}
