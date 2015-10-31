// Copyright (c) 2012, the Dart project authors.  
// Please see the AUTHORS file for details. 
// All rights reserved. Use of this source code 
// is governed by a BSD-style license that can be 
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:html';


var wordList;

//void main(List<String> arguments) {
  //����һ�����ӳأ�host�����ӵ�ַ��port���˿ڣ�user���û�����password�����룬db�����ݿ�����max����󲢷���
  //var pool = new ConnectionPool(host: '52.8.67.180',port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340247', max: 5);
  //pool.query("SELECT * FROM users").then((results) {
   // results.forEach((row) {
    //  print('${row.stuName},${row.stuID},${row.stuMail},${row.stuAge}');
    //});
 // });
 // querySelector('#getWords').onClick.listen(makeRequest);
 // wordList = querySelector('#wordList');
//}



/*Future makeRequest(Event e) async {
  request = new HttpRequest();


  var url = 'http://127.0.0.1:8080';
  request.open('GET', url);
  request.send();
}

processString(String jsonString) {
  List<String> portmanteaux = JSON.decode(jsonString);
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.$Status');
}
�������Ĳ�������֮ǰ���ĵ����ڸ��ֽ̳����ѵ��Ĺ����������ݿ�Ĵ��� ճ��ȥ������ϻ��ǲ�̫�� ������Ŭ���Ĺ���*/

void main() {
  querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList');
}

Future makeRequest(Event e) async {
  var path = 'http://127.0.0.1:8080';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}

processString(String jsonString) {
  List<String> portmanteaux = JSON.decode(jsonString);
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.$Status');
}