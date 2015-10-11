import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput;
UListElement toDoList;
ButtonElement DeleteAll;
void main(){
  toDoInput=querySelector('#sample_todoinput_id');
  toDoList=querySelector('#sample_todolist_id');
  DeleteAll=querySelector('#sample_button_id');
  DeleteAll.onClick.listen((e) {toDoList.children.clear();});
  toDoInput.onChange.listen(AddInput);
  querySelector('#btn3')
    ..onClick.listen(clear);
}

void AddInput(Event e){
  var newToDo=new InputElement();
  var m,n;
  var c=0;
  m=int.parse(document.getElementById('sample_todoinput1_id').value);
  n=int.parse(document.getElementById('sample_todoinput_id').value);
  if(m>n){
    var temp;
    temp=m;
    m=n;
    n=temp;
  }
  for(int i=m;i<=n;i++)
  {c=c+i;}
  newToDo.value=c.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());
  toDoList.children.add(newToDo);
}

clear(MouseEvent event){
  querySelector('#sample_todoinput1_id').value='';
  querySelector('#sample_todoinput_id').value='';
}