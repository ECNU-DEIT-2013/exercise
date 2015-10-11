import 'dart:html';
import 'dart:math' as math;
InputElement num;
UListElement toDoList;
void main() {
  querySelector('#button_add_id1')
    ..text = '='
    ..onClick.listen(addTwoNumber);
   querySelector('#button_add_id2')
    ..text = '='
    ..onClick.listen(addOneToHundred);

  num=querySelector('#num');
  toDoList=querySelector('#to-do-list');
  m.onChange.listen(addOneToHundred);
}
void addTwoNumber(MouseEvent event){
  vax x=int.parse(querySelector('#a').value);
  vax y=int.parse(querySelector('#b').value);
  querySelector('#c').text=addNumber(x,y).toString();
}

int addNumber(x,y){
  return(x+y);
}

void addOneToHundred(MouseEvent event){
  int sum=0;
  vax n=int.parse(querySelector('#num').value);
  for(int i=1;i<=n;i++)
    sum=sum+i;
  querySelector('#result').text=sum.toString();
  var m=new InputElement();
  m.value=sum.toString();
  toDoList.children.add(m);
  var newbutton=new ButtonInputElement();
  newbutton.value="Remove";
  toDoList.children.add(newbutton);
  newbutton.onClick.listen((e)=> newbutton.remove());
  newbutton.onClick.listen((e)=> m.remove());
}


