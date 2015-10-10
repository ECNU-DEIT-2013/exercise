import 'dart:html';
import 'dart:math' as math ;

InputElement toDoInput;
UListElement toDoList;
ButtonElement deleteAll;

void main() {

  querySelector('#sample_text_id')
    ..text = '1+2+...+100='
    ..onClick.listen(oneHundred);

  querySelector('#button_add_id')
    ..text='Add'
    ..onClick.listen(addToDoItem);

  deleteAll = querySelector('#delete-all');
  deleteAll.onClick.listen((e) => toDoList.children.clear());

  toDoList = querySelector('#to-do-list');
  toDoInput.onChange.listen(addToDoItem);
}

void addToDoItem(Event e) {
  var x = int.parse(querySelector('#number_a').value);
  var y = int.parse(querySelector('#number_b').value);
  var z = x+y;
  var newToDo = new LIElement();
  newToDo.text = z.toString();
  newToDo.onClick.listen((e) => newToDo.remove());
  toDoList.children.add(newToDo);
}


int addDo(var a, var b){
  var c = a+b;
  return c;
}

void addThemUp(MouseEvent event){
  var x = int.parse(querySelector('#number_a').value);
  var y = int.parse(querySelector('#number_b').value);
  querySelector('#sample_text_id2').text=addDo(x,y).toString();
}

void oneHundred(MouseEvent event){
  var sum = 0;
  var i;
  for(i=1;i<=100;i++){
    sum=sum+i;
  }
  querySelector('#sample_text_id').text =sum.toString();
}
