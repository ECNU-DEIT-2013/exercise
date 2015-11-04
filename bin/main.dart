
import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert' show UTF8 ,JSON;//--1

main() async {
  var inform=new List();
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
    var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340223', max: 5);
  var results = await pool.query('select * from stuff');
  results.forEach((row) {
    print('Id: ${row.id},Name: ${row.name}, email: ${row.email}');
    inform.add('Id: ${row.id},Name: ${row.name}, email: ${row.email}');
  });
  var query = await pool.prepare('insert into stuff (id,name, email) values (?,?, ?)');
  for(var i=5;i<=10;i++)var result = await query.execute([i.toString(),'name'+i.toString(), 'null']);
 // print("New user's id: ${result.insertId}");



  await for (var request in server) {
     HttpResponse res = request.response;
    addCorsHeaders(res);
    res
    ..headers.contentType = new ContentType("application", "json", charset: "utf-8")//--1
      ..write(JSON.encode(inform)) //The encoding, JSON  matches the type specified in the ContentType header.
      ..close();
  }

}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
//The response from the server is encoded in UTF-8