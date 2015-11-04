import'dart:async';

import 'dart:io';

import 'package:sqljocky/sqljocky.dart';


main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  var pool = new ConnectionPool(host: 'localhost',port: 3306, user: 'ylf', password: '123456', db: '11130340201', max: 5);
  var results = await pool.query("select * from stu_Info");
  results.forEach((row) {
    print('${row.stuName},${row.stuID},${row.stuMail},${row.stuAge}');
    a.add('"${row.stuName},${row.stuID},${row.stuMail},${row.stuAge}"');

  });

await for (var request in server) {
    HttpResponse response = request.response;
    addCorsHeaders(response);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(a)
      ..close();

  }
}



void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add( 'Access-Control-Allow-Methods', 'POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
}


