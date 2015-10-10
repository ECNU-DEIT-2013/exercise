import 'dart:html';
DivElement toDoDiv;
InputElement toDoInput1;
InputElement toDoInput2;
ButtonElement toDoAdd;
ButtonElement toDoDelete;
void main()
{
  toDoDiv=querySelector('#add');
  toDoInput1=querySelector('#num1');
  toDoInput2=querySelector('#num2');
  toDoAdd=querySelector('#btn1');
  toDoDelete=querySelector('#btn2');
  toDoAdd.onClick.listen(addItem);
  toDoDelete.onClick.listen((e)=>toDoDiv.children.clear());
  toDoDelete.onClick.listen(numReset);
}


void addItem(Event e)
{
  var newToDo=new InputElement();
  var result;
  result=int.parse(querySelector('#num1').value)+int.parse(querySelector('#num2').value);
  newToDo.value=result.toString();
  newToDo.onClick.listen((e)=>newToDo.remove());

  toDoDiv.children.add(newToDo);
}


void numReset(MouseEvent event) {
  toDoInput1.value = '';
  toDoInput2.value = '';
}

