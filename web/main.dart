// Copyright (c) 2012, the Dart project authors.  
// Please see the AUTHORS file for details. 
// All rights reserved. Use of this source code 
// is governed by a BSD-style license that can be 
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

var wordList;

void main() {
  //querySelector('#getWords').onClick.listen(makeRequest);
  //wordList = querySelector('#wordList');
    querySelector('#checkbox1').onChange.listen(make_checkbox1);//checkbox1中的内容变化是就执行make_checkbox1函数
    querySelector('#reset_button').onClick.listen(make_reset);//重置按钮getname
}


void make_checkbox1(Event e){
  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');
}//在选择name选择项之后，执行makeRequest的函数

void make_reset(Event e){
  document.querySelector('#getWords').disabled=false;
}//重置按钮，可以使得“getname”按钮恢复原来的状态，保证可以再按一遍


void makeRequest(Event e) {
  var path = 'http://127.0.0.1:8080/';//唯一的地址URL
  var httpRequest = new HttpRequest();//访问web网站的协议（网上请求文件——ftp超文本传输协议）
  httpRequest
    ..open('GET', path)//拨号，打开一条通道
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))//搬运、打开一条异步通道“onloadend”数据搬完
    ..send('');/**把请求发送到服务器*/
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {//200代表数据正确拿到
    List<String> portmanteaux = JSON.decode(request.responseText);//decode代表解码
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text= portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
