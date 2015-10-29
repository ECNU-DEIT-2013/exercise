// Copyright (c) 2012, the Dart project authors.  
// Please see the AUTHORS file for details. 
// All rights reserved. Use of this source code 
// is governed by a BSD-style license that can be 
// found in the LICENSE file.
//���������ڵ�����ͳ���
//���ע�͵��ĵ������ַ�ʽ���Թ����ڷ�������dart�ļ��ﻹʹ����д���ģ��ڿͻ��˵�dart����ԡ�
//���һ�ΰ�ť����ˢ��һ��127.0.0.1��8080�����ݾͻᷭ��������û�в鵽��ʲô���⡣
//���Դ���JSON����[{"ID":"101","NAME":"ZYJ",��EMAIL":"ZYJ@163.COM"},{"ID":"102","NAME":"SYN",��EMAIL":"SYN@163.COM"}]
//���ά����[["101","ZYJ","ZYJ@163.COM"]["101","ZYJ","ZYJ@163.COM"]]��������ǵ����ַ���decode��encode���Թ���δ�ɹ���
//������dart������д�����ݿ⣺
//var query = await pool.prepare('insert into user_inf (user_name,user_email) values (?,?)');
// �������������ʱ�޷������ݿ�����Ӽ�¼��Ҳ�������������� query.execute���������Ӽ�¼������¼�е�����ȴ����һ���еģ��������������ͬ�ļ�¼����
//var result = await query.execute(['SXJ', 'SXJ@163.com']);
// �����������values���Ϊ����������������ӵļ�¼Ϊ��������е����ݡ������ɳ���������ͬ���ݡ���
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

