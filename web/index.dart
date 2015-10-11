import 'dart:html';

//////////////////////
InputElement todo_input;
UListElement todo_list;
ButtonElement delet_eall;
///////////////////////
void main() {
  todo_input=querySelector('#todoinput');
  todo_list=querySelector('#todolist');
  delet_eall=querySelector('#deleteall');
  delet_eall.onClick.listen((e)=>todo_list.children.clear());
todo_list.onClick.listen((e)=>todo_list.firstChild.remove());

  todo_input.onChange.listen(addItem);
}

void addItem(Event e){
  var newtodo=new LIElement();
  newtodo.text=todo_input.value;
  todo_input.value='';
  todo_list.children.add(newtodo);

}
