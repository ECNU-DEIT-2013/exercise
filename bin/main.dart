
import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert' show UTF8 ,JSON;//--1

main() async {
  var inform=new List();
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  await for (var request in server) {
    var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340223', max: 5);
    var results = await pool.query('select * from stuff');
    results.forEach((row) {
      print('Name: ${row.name}, email: ${row.email}');
      inform.add('Name: ${row.name}, email: ${row.email}');
    });
    HttpResponse res = request.response;
    addCorsHeaders(res);
    res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")//--1
      ..write(JSON.encode(inform))
      ..close();
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}