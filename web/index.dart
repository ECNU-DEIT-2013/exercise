import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput;
UListElement toDoList;
ButtonElement DeleteAll;
ButtonElement QingKong;
void main(){
  toDoInput=querySelector('#sample_todoinput_id');
  toDoList=querySelector('#sample_todolist_id');
  DeleteAll=querySelector('#sample_button_id');
  DeleteAll.onClick.listen((e) {
    toDoList.children.clear();
  });
  QingKong=querySelector('#sample_qingkong_id');
  QingKong.onClick.listen(Qingkong);
  toDoInput.onChange.listen(AddInput);
}
void randomSelectStu(String c, MouseEvent event){
  var A,B;
  A=document.getElementById('sample_studentone_id').value;
  B=document.getElementById('sample_studenttwo_id').value;
  var a=int.parse(A);
  var b=int.parse(B);
  c=a+b;
  document.getElementById("sample_studentid_id").value=c.toString();
}
void AddNumber(int s, MouseEvent event){
  int i;
  for(i=1;i<=100;i++)
    s=s+i;
  document.getElementById("sample_add_id").value=s.toString();
}
void AddInput(Event e){
  var newToDo=new InputElement();
  var A,B,a,b,c;
  A=document.getElementById('sample_todoinput1_id').value;
  B=toDoInput.value;
  a=int.parse(A);
  b=int.parse(B);
  c=a+b;
  newToDo.value=c.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());
  toDoList.children.add(newToDo);
}
void Qingkong(Event e){
  toDoInput.value='';
  querySelector('#sample_todoinput1_id').value='';
}


