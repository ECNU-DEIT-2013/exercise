import 'dart:html';
import 'dart:math' as math;
InputElement toDoButton;
UListElement toDoList;
void main() {

  toDoButton = querySelector('#to-do-button');
  toDoList = querySelector('#to-do-list');
  toDoButton.onClick.listen(addToDoItem);

}
void addToDoItem(Event e) {
  var newToDo = new TextInputElement();
  newToDo.text = '';
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



void plus1(MouseEvent event) {
  var stuMap={
    0:1213344345,
    1:6786876872
  };
  var random = new math.Random();

  var randomID=random.nextInt(2);
  var stuID=stuMap[randomID];
  querySelector('#sample_studentid_id').text =stuID.toString();
}
void add(MouseEvent event){
  var number=0;
  for (int i = toDoList.text.length - 1; i >= 0; i--){
    toDoList.text=toDoList.toString();
     number=number+toDoList.text[i];
   }
    querySelector('#sample_text_id').text = number.toString();

}