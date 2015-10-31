import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

main() async {
  var pool = new ConnectionPool(
      host: '52.8.67.180',
      port: 3306,
      user: 'dec2013stu',
      password: 'dec2013stu',
      db: 'stu_10130340207',
      max: 5);
  var results = await pool.query('select * from USERS_MASSAGE');
  var a;
  await results.forEach((row) {
    if (a == null) {
      a = '["${row[0]}, ${row[1]}, ${row[2]}, ${row[3]}, ${row[4]}"';
    } else {
      a = a + ',"${row[0]}, ${row[1]}, ${row[2]}, ${row[3]}, ${row[4]}"';
    }
  });
  a = a + ']';
  print(a);
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    var res = request.response;
    addCorsHeaders(res);
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
