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
  var httpRequest = new HttpRequest(); //���󵽾���
  httpRequest
    ..open('GET', path)  //��һ������������ͨ��
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))  //�ú����ݺ����requestCoplete����
    ..send('');//����һ����
}

requestComplete(HttpRequest request) {
  if (request.status == 200) {//�ж�״̬��200��һ��Ԥ��ֵ
    List<String> portmanteaux = JSON.decode(request.responseText);//JSON��һ�ຯ�����蹹�죬���ڽ�������
    for (int i = 0; i < portmanteaux.length; i++) {
      wordList.children.add(new LIElement()..text = portmanteaux[i]);
    }
  } else {
    wordList.children.add(new LIElement()
      ..text = 'Request failed, status=${request.status}');
  }
}
