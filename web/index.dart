import 'dart:html';
import 'dart:math' as math;
InputElement myInput;
UListElement myList;
ButtonElement DeleteAll;
ButtonElement QingKong;
void main(){
  myInput=querySelector('#sample_input_id');
  myList=querySelector('#sample_todolist_id');
  DeleteAll=querySelector('#sample_button_id');
  DeleteAll.onClick.listen((e) {
    myList.children.clear();
  });
  QingKong=querySelector('#sample_denghao_id');
  QingKong.onClick.listen(Qingkong);
  myInput.onChange.listen(AddInput);
}
void randomSelectStu(String c, MouseEvent event){
  var A,B;
  A=document.getElementById('sample_numberone_id').value;
  B=document.getElementById('sample_numbertwo_id').value;
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
  A=document.getElementById('sample_input1_id').value;
  B=myInput.value;
  a=int.parse(A);
  b=int.parse(B);
  c=a+b;
  newToDo.value=c.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());
  myList.children.add(newToDo);
}
void Qingkong(Event e){
  myInput.value='';
  querySelector('#sample_input1_id').value='';
}
