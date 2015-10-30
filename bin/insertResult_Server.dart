import 'dart:io';
import 'dart:async';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';


main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8085);
  print("Serving at ${server.address}:${server.port}");
  await for (var req in server) {
      var jsonString = await req.transform(UTF8.decoder).join();
      await insertSql(jsonString);
      req.response.close();
  }


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
}


hello(var server,var results) async{
  List list = new List();
  await results.forEach((row) {
    print('Name: ${row[0]}, email: ${row[1]}');
    list.add(row[0]);
  });
  print(list);
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
insertSql(var x) async{
  var name1 =JSON.decode(x);
  print(name1);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340201', max: 10);
  var query = await pool.prepare('insert into user_info (name, email) values (?, ?)');
  await query.execute(['${name1}', '${name1}@qq.com']);
}