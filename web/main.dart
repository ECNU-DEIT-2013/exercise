// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

var wordList;
//添加一个top lever 变量来储存checkbox
CheckboxInputElement theChkbox;
void main() {
  //querySelector('#getWords').onClick.listen(makeRequest);
  //wordList = querySelector('#wordList');
  theChkbox= querySelector('#checkbox1');
  theChkbox.onChange.listen(make_checkbox1);//checkbox1中的内容变化是就执行make_checkbox1函数
    querySelector('#reset_button').onClick.listen(make_reset);//重置按钮getname
  querySelector('#getWords').onClick.listen(makeRequest);
}


void make_checkbox1(Event e){
  //如果你的本意是说当用户选择namechekbox后来执行，但是你无法判断是否cheked了，那么可以如下做：
  if(theChkbox.checked){
    makeRequest(null);//这里，如果你定义makeRequest的时候，使用option形式定义，就可以不需要传递null了，留空就可以。
  //  关于option形式参数，你可以参考我们之前一直用得语言特性那页面中的Function部分。
  }

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
    ..send('');/**把请求发送到服务器，张蕾做的很好。这里我纠正一下，当时没有查看文档，凭经验告诉大家说这是请求发给数据库
                  ，其实这里是只客户端吧数据发给数据库，当用'POST'方法的时候里面通常会填写数据*/
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
