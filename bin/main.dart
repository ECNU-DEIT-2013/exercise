import'dart:async';
import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

main() async {
  List a = new List();
  var pool = new ConnectionPool(host: '52.8.67.180',port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340247', max: 5);
  var results = await pool.query("SELECT * FROM mystu");
    results.forEach((row) {
      print('${row.stuName},${row.stuID},${row.stuMail},${row.stuAge}');
      a.add('"${row.stuName},${row.stuID},${row.stuMail},${row.stuAge}"');

  });

  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4,8080);
  print("Serving at ${server.address}:${server.port}");

    await for (var request in server) {
      request.response.headers
      ..add('Access-Control-Allow-Origin', '*')
      ..add('Access-Control-Allow-Methods', 'POST, OPTIONS')
      ..add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
      request.response
        ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
        ..write(a)
        ..close();

}
      }
