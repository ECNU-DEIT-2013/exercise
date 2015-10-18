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
  var path = 'http://127.0.0.1:8080/';//URL
  var httpRequest = new HttpRequest();//访问网站的协议，超文本传输协议
  httpRequest
    ..open('GET', path)//打开通道
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))//异步通讯、数据从服务器取完后->
    ..send('');//拨号
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {//200表示数据正确
    List<String> portmanteaux = JSON.decode(request.responseText);//解析数据
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
