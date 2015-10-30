import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:async';

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  getData();
  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "json", charset:"utf-8")
      ..write('<p>hello world!</p>')
      ..close();
  }
}

getData() async{
  var pool=new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340243', max: 5);
  var results = await pool.query('select * from stu_10130340243');
  results.forEach((row) {
    print('name: ${row[0]}, NO.: ${row[1]},telephone number:${row[2]},E-mail:${row[3]}');
  });

}


