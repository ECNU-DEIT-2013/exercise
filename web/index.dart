import 'dart:html';
DivElement Div;
InputElement Input1,Input2;
ButtonElement Result,Delete;
void main()
{
  Div=querySelector('#add');
  Input1=querySelector('#number1');
  Input2=querySelector('#number2');
  Result=querySelector('#btn1');
  Delete=querySelector('#btn2');
  Result.onClick.listen(Add);
  Delete.onClick.listen((e)=>Div.children.clear());
  Delete.onClick.listen(deleteall);
}


void Add(Event e)
{
  var newToDo=new InputElement();
  var result;
  result=int.parse(querySelector('#number1').value)+int.parse(querySelector('#number2').value);
  newToDo.value=result.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());

  Div.children.add(newToDo);
}


void deleteall(MouseEvent event) {
  Input1.value = '';
  Input2.value = '';
}