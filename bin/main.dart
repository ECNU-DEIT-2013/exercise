
import 'dart:io';
import 'dart:convert' show UTF8, JSON;
import 'package:sqljocky/sqljocky.dart';

main() async {
  List jsondata=[];
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340202');
  var results = await pool.query('select name,email from user_zl');
  results.forEach((row) {
    print('name: ${row[0]}');
    jsondata.add('${row[0]}');
  });
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(JSON.encode(jsondata))
      ..close();
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}