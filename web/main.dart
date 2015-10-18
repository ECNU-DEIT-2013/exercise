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
  var httpRequest = new HttpRequest();//������վ��Э�飬���ı�����Э��
  httpRequest
    ..open('GET', path)//��ͨ��
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))//�첽ͨѶ�����ݴӷ�����ȡ���->
    ..send('');//����
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {//200��ʾ������ȷ
    List<String> portmanteaux = JSON.decode(request.responseText);//��������
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
