// Copyright (c) 2012, the Dart project authors.  
// Please see the AUTHORS file for details. 
// All rights reserved. Use of this source code 
// is governed by a BSD-style license that can be 
// found in the LICENSE file.
//几个还存在的问题和尝试
//查过注释的文档，各种方式都试过，在服务器的dart文件里还使不能写中文，在客户端的dart里可以。
//点击一次按钮或者刷新一次127.0.0.1：8080，数据就会翻倍增长，没有查到是什么问题。
//尝试传入JSON数组[{"ID":"101","NAME":"ZYJ",“EMAIL":"ZYJ@163.COM"},{"ID":"102","NAME":"SYN",“EMAIL":"SYN@163.COM"}]
//或二维数组[["101","ZYJ","ZYJ@163.COM"]["101","ZYJ","ZYJ@163.COM"]]，输出的是单个字符，decode、encode都试过，未成功。
//关于用dart将数据写入数据库：
//var query = await pool.prepare('insert into user_inf (user_name,user_email) values (?,?)');
// （仅有这条语句时无法在数据库中添加纪录，也不报错，加上下面 query.execute语句后可以添加纪录，但纪录中的数据却是这一条中的，还会添加两条相同的纪录。）
//var result = await query.execute(['SXJ', 'SXJ@163.com']);
// （若上条语句values后改为（？，？），则添加的纪录为这条语句中的数据。但依旧出现两条相同数据。）
import 'dart:html';
import 'dart:convert';

var IDList;
var nameList;
var EmailList;

void main() {
  querySelector('#getID').onClick.listen(makeRequest1);
  IDList = querySelector('#IDList');
  querySelector('#getName').onClick.listen(makeRequest2);
  nameList = querySelector('#nameList');
  querySelector('#getEmail').onClick.listen(makeRequest3);
  EmailList = querySelector('#EmailList');
}

void makeRequest1(Event e) {
  var path = 'http://127.0.0.1:8080';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete1(httpRequest))
    ..send('');

}
void makeRequest2(Event e) {
  var path = 'http://127.0.0.1:8080';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete2(httpRequest))
    ..send('');

}
void makeRequest3(Event e) {
  var path = 'http://127.0.0.1:8080';
  var httpRequest = new HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete3(httpRequest))
    ..send('');

}


requestComplete1(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux =JSON.decode(request.responseText);
    for (int i = 0; i < portmanteaux.length; i=i+3)
    {IDList.children.add(new LIElement()..text = portmanteaux[i]);}}
   else {
      IDList.children.add(new LIElement()
     ..text = 'Request failed, status=${request.status}');
   }
}


requestComplete2(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux =JSON.decode(request.responseText);
    for (int i = 1; i < portmanteaux.length; i=i+3)
    {nameList.children.add(new LIElement()..text = portmanteaux[i]);}}
  else {
    nameList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}

requestComplete3(HttpRequest request) {
  if (request.status == 200) {
    List<String> portmanteaux =JSON.decode(request.responseText);
    for (int i = 2; i < portmanteaux.length; i=i+3)
    {EmailList.children.add(new LIElement()..text = portmanteaux[i]);}}
  else {
    EmailList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}

