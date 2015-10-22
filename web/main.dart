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
}

void makeRequest(Event e) {
  var path = 'https://www.dartlang.org/f/portmanteaux.json';
  var httpRequest = new HttpRequest(); //抽象到具象
  httpRequest
    ..open('GET', path)  //打开一条跟服务器的通道
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))  //拿好数据后调用requestCoplete函数
    ..send('');//发送一个‘
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {//判断状态，200是一个预设值
    List<String> portmanteaux = JSON.decode(request.responseText);//JSON这一类函数无需构造，用于解析数据
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
