import 'dart:io';
import 'dart:async';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';


main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8082);
  print("Serving at ${server.address}:${server.port}");
  var x = await addSql();
  await  hello(server,x);
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
addSql() async{
  var pool = new ConnectionPool(host: 'localhost', port: 3306, user: 'root', password: '1234', db: 'helloworld', max: 10);
  var results = await pool.query('select name, email from user_info');
  print("edison");
  return results;

 /* results.forEach((row) {
    print('Name: ${row[0]}, email: ${row[1]}');
  });*/
}

hello(var server,var results) async{
  List list = new List();
  results.forEach((row) {
    print('Name: ${row[0]}, email: ${row[1]}');
    list.add(row[0]);
  });
  await for (var request in server) {
    var json = JSON.encode(list);
    print(json);
    HttpResponse res = request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('${json}'
    )
      ..close();
  }
}
