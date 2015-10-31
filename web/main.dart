import 'dart:html';
import 'dart:convert';

var wordList;

void main() {
  querySelector('#getID').onClick.listen(makeRequest);
  wordList = querySelector('#IDList');
}



void make_reset(Event e){
 document.querySelector('#getID').disabled=false;
}

void makeRequest(Event e) {
 var path = 'http://127.0.0.1:8000/';
 var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux = JSON.decode(request.responseText);
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text= portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
