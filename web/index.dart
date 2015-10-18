<<<<<<< HEAD
var wordList;

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');
}

void makeRequest(Event e) {
  var path = 'https://www.dartlang.org/f/portmanteaux.json';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');//''ø… °
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux = JSON.decode(request.responseText);
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
=======
import 'dart:html';
import 'dart:math' as math;
ButtonElement DeleteAll;
ButtonElement QingKong;
void main() {
  querySelector('#button_for_add')
    ..text='+'
    ..onClick.listen(addUpNumber);
  querySelector('#button_for_add1')
    ..text='-'
    ..onClick.listen(addUpNumber1);
  QingKong=querySelector('#sample_qingkong_id');
  QingKong.onClick.listen(Qingkong);
}

void Qingkong(Event e){
  querySelector('#input1').value='';
  querySelector('#input2').value='';
  querySelector('#sample_input1_id').value='';
}

void addUpNumber (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_input1_id').value=addUp(x,y).toString();
}

void addUpNumber1 (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_input1_id').value=addUp1(x,y).toString();
}

int addUp(var x,var y){
  var m=x+y;
  return m;
}
int addUp1(var x,var y){
  var n=x-y;
  return n;
>>>>>>> origin/10130340207
}