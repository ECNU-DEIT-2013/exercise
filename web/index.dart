// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
var wordList;
InputElement text;

main() async{
  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');
  text = querySelector('#text');
  querySelector('#insert').onClick.listen(postData);
}

void makeRequest(Event e) {
  var path = 'http://127.0.0.1:8083';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}
void postData(Event e) {
  var path = 'http://127.0.0.1:8083';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('POST', path)
    ..send(_slambookAsJsonData());
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
String _slambookAsJsonData() {
  return JSON.encode(text.value);
}
