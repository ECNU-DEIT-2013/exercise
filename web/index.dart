import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput1;
InputElement toDoInput2;
UListElement toDoList;
ButtonElement Button1;
ButtonElement Button2;
void main(){
  toDoInput1=querySelector('#input1');
  toDoInput2=querySelector('#input3');
  toDoList=querySelector('#list_id');
  Button1=querySelector('#button1');
  Button2=querySelector('#button2');
  Button1.onClick.listen((e) {
    toDoList.children.clear();
  });
  Button1.onClick.listen(delete);
  Button2.onClick.listen(AddInput);
}

void AddInput(Event e){
  var newToDo = new InputElement();
  var one,two,three,a,b;
  one= toDoInput1.value;
  two=toDoInput2.value;
  a=int.parse(one);
  b=int.parse(two);
  three=a+b;
  newToDo.value=three.toString();
  toDoList.children.add(newToDo);
}
void delete(Event e){
  toDoInput1.value='';
  toDoInput2.value='';
}

import 'dart:io';
import 'dart:convert' show UTF8, JSON;

main() async {
  List jsonData= [ "portmanteau", "fantabulous", "spork", "smog",
  "spanglish", "gerrymander", "turducken", "stagflation",
  "bromance", "freeware", "oxbridge", "palimony", "netiquette",
  "brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"]

  ;
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(JSON.encode(jsonData))
      ..close();
  }
}