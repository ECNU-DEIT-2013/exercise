// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

var wordList;
//List dataname = new List();

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');
//  querySelector('#getNames').onClick.listen(make1Request);
  //wordList = querySelector('#nameList');
  //querySelector('#getGender').onClick.listen(make2Request);
  //wordList = querySelector('#genderList');
  //querySelector('#getAge').onClick.listen(make3Request);
  //wordList = querySelector('#ageList');
  //querySelector('#getdepart').onClick.listen(make4Request);
  //wordList = querySelector('#departList');
}

void makeRequest(Event e) {
  var path = 'http://127.0.0.1:8080/';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux = JSON.decode(request.responseText);
    for (int i = 0; i < portmanteaux.length;i++) {
      //for (int j=0;j<portmanteaux[i];j++){
      // if(j!=' ')
      // dataname.add(portmanteaux[i][j],break,)}
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
