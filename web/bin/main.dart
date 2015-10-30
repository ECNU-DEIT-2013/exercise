import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
List dataemail = new List();
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  getData();

  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(dataemail)
      ..close();
  }
}

getData() async{
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340248', max: 5);
  var results = await pool.query('select * from student;');
  results.forEach((row) {
    print('number: ${row.number}, name: ${row.name}, gender:${row.gender}, age: ${row.age},department: ${row.department}');
    dataemail.add('"${row.number} ${row.name}  ${row.gender} ${row.age} ${row.department}"');
  });
  print(dataemail);
}


void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}