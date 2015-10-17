import 'dart:html';
import 'dart:async';
import 'dart:convert';


UListElement toDoList=querySelector('#toDoList');
UListElement toDoList2=querySelector('#toDoList2');
ButtonElement deleteAll;
var wordList;

void main() {
  //querySelector('#botton1_id').onClick.listen((MouseEvent e)=>add1to100(int.parse(querySelector('#text1').value),int.parse(querySelector('#text2').value),e));
  querySelector('#botton2_id')//����Ԫ��
  ..onClick.listen((MouseEvent e)=>querySelector('#botton2_id').remove())
  ..onClick.listen(addLi)
  ..onClick.listen(addToDoItem2);

  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');

  deleteAll = querySelector('#delete-all');//ɾ��Ԫ��
  deleteAll
  ..onClick.listen((e) => toDoList.children.clear())
  ..onClick.listen((e) => toDoList2.children.clear());

  //querySelector('#item2-newbutton').onClick.listen((MouseEvent e)=>add1to100(1,int.parse(querySelector('#item2-newtodo').value),e));
  }

Future makeRequest(Event e) async {
  var path = 'https://www.dartlang.org/f/portmanteaux.json';
  //var path = 'http://127.0.0.1:8080';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}

processString(String jsonString) {
  //wordList.children.add(new LIElement()..text = "111");
  List<String> portmanteaux = JSON.decode(jsonString);
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
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

void addToDoItem2(Event e)
{
  var newToDo1=new InputElement();
  newToDo1.placeholder="the first number";
  newToDo1.id='item-newtodo';
  toDoList.children.add(newToDo1);

  var newToDo=new InputElement();
  var newButton=new ButtonElement();
  newToDo.placeholder="the second number";
  newToDo.id='item2-newtodo';
  toDoList2.children.add(newToDo);
  newButton.text="START";
  newButton.id='item2-newbutton';
  toDoList2.children.add(newButton);
  querySelector('#item2-newbutton').onClick.listen((MouseEvent e)=>add1to100(int.parse(querySelector('#item-newtodo').value),int.parse(querySelector('#item2-newtodo').value),e));
}

void addLi(Event e)
  {
  LIElement toDoList=querySelector('#toDoLi');
  var newToDo=new LIElement();
  newToDo.text="Add to ?";
  newToDo.onClick.listen((MouseEvent e)=>newToDo.remove());
  toDoList.children.add(newToDo);
}