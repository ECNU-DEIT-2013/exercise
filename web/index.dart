import 'dart:html';
import 'dart:math' as math;

InputElement toDoInput;
UListElement toDolist;

void main()
{
  toDoInput=querySelector('#sample_todoinput_id');
  toDolist=querySelector('#sample_todolist_id');
  toDoInput.onChange.listen(addThemUp);


}

void addThemUp(Event e){
  var newToDo=new LIElement();
  var x = int.parse(querySelector('#sample_todoinput1_id').value);
  var y = int.parse(querySelector('#sample_todoinput_id').value);
  var z=x+y;
  newToDo.text=z.toString();
  toDoList.children.add(newToDo);
}


