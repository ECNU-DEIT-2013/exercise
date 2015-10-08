import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#botton1_id').onClick.listen((MouseEvent e)=>add1to100(int.parse(document.getElementById("text1").value),int.parse(document.getElementById("text2").value),e));
  querySelector('#sample_text_id').text = 'Click me!';
  querySelector('#botton2_id')
  ..onClick.listen(addToDoItem);
}

void add1to100(int origin1,int origin2,MouseEvent e) {
  int sum=0;
  for (int i = origin1; i <=origin2; i++) {
    sum+=i;
}
  String s=origin1.toString()+" add to "+origin2.toString()+" is "+sum.toString();
  querySelector('#sample_studentid_id').text = s;
}
void addToDoItem(Event e)
{
  UListElement toDoList=querySelector('#toDoList');
  var newToDo=new TextInputElement();
  newToDo.value="12334";
  toDoList.children.add(newToDo);
}
