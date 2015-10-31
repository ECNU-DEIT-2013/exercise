// Copyright (c) 2012, the Dart project authors.  
// Please see the AUTHORS file for details. 
// All rights reserved. Use of this source code 
// is governed by a BSD-style license that can be 
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

var wordList;

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');
  querySelector('#Cancel').onClick.listen(CancelTextInput);
}
void CancelTextInput(event e){
  querySelector('#IdInput').value=' ';
  querySelector('#KeyInput').value=' ';
}
void makeRequest(Event e) {
 // var path = 'https://www.dartlang.org/f/portmanteaux.json';
  var path = 'http://127.0.0.1:8008';

  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
  querySelector('#wordList').children.add(new LIElement()..text = '-');
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
}
