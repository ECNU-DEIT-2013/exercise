import 'dart:html';
import 'dart:async';
import 'dart:convert';


UListElement toDoList=querySelector('#toDoList');
UListElement toDoList2=querySelector('#toDoList2');
ButtonElement deleteAll;
var wordList;

void main() {
  querySelector('#botton2_id')
  ..onClick.listen((MouseEvent e)=>querySelector('#botton2_id').remove())
  ..onClick.listen(addLi)
  ..onClick.listen(jzZhuanhuan(49))
  ..onClick.listen(addToDoItem2);

  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');

  deleteAll = querySelector('#delete-all');
  deleteAll
  ..onClick.listen((e) => toDoList.children.clear())
  ..onClick.listen((MouseEvent e)=>deleteAll.remove())
  ..onClick.listen((e) => toDoList2.children.clear());

  //querySelector('#item2-newbutton').onClick.listen((MouseEvent e)=>add1to100(1,int.parse(querySelector('#item2-newtodo').value),e));
  }

Future makeRequest(Event e) async {
  //var path = 'https://www.dartlang.org/f/portmanteaux.json';
  var path = 'http://127.0.0.1:8080';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}

processString(String jsonString) {
  //["Number: 1, Name: Hu Yonghua,Subject: math""Number: 2, Name: Wang Mei,Subject: chinese""Number: 3, Name: Yan Fengyu,Subject: english""Number: 4, Name: Dong Yuxue,Subject: computer"]
  //你的json数据格式有问题，运行能读出来？
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

void jzZhuanhuan(int b1){
  int s1;
  String s2="";
  while(b1~/2!=0){
    s1=b1%2;
    b1=b1~/2;
    s2=s1.toString()+s2;
  }
  s2=b1.toString()+s2;
  querySelector('#sample_studentid_id').text = s2;
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