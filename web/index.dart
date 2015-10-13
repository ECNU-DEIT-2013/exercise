import 'dart:html';
int a=1;
UListElement toDoList=querySelector('#toDoList');
UListElement toDoList2=querySelector('#toDoList2');
ButtonElement deleteAll;
void main() {
  //querySelector('#botton1_id').onClick.listen((MouseEvent e)=>add1to100(int.parse(querySelector('#text1').value),int.parse(querySelector('#text2').value),e));
  querySelector('#botton2_id')//Ìí¼ÓÔªËØ
  ..onClick.listen(addToDoItem)
  ..onClick.listen(addLi)
  ..onClick.listen(addToDoItem2);

  deleteAll = querySelector('#delete-all');//É¾³ýÔªËØ
  deleteAll
  ..onClick.listen((e) => toDoList.children.clear())
  ..onClick.listen((e) => toDoList2.children.clear());
}

void add1to100(int origin1,int origin2,MouseEvent e) {
  //querySelector('#sample_studentid_id').text="win";
  int sum=0;
  for (int i = origin1; i <=origin2; i++) {
    sum+=i;
}
  String s=origin1.toString()+" add to "+origin2.toString()+" is "+sum.toString();
  querySelector('#sample_studentid_id').text = s;
}
void addToDoItem(Event e)
{
 if(a<=2){
   var newToDo=new TextInputElement();
   newToDo.placeholder="the first number";
   toDoList.children.add(newToDo);
   a++;
 }
}
void addToDoItem2(Event e)
{
  if(a<=2){
    var newToDo=new TextInputElement();
    var newButton=new ButtonElement();
    newToDo.placeholder="the second number";
    toDoList2.children.add(newToDo);
    newButton.text="START";
    newButton.onClick.listen((MouseEvent e)=>add1to100(1,100,e));
    toDoList2.children.add(newButton);
    a++;
  }
}

void addLi(Event e)
  {
  LIElement toDoList=querySelector('#toDoLi');
  var newToDo=new LIElement();
  newToDo.text="clicked";
  newToDo.onClick.listen((MouseEvent e)=>newToDo.remove());
  toDoList.children.add(newToDo);
}