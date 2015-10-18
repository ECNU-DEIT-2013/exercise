import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

main() async {
  var pool = new ConnectionPool(
      host: '52.8.67.180',
      port: 3306,
      user: 'dec2013stu',
      password: 'dec2013stu',
      db: 'stu_10130340227',
      max: 5);
  var results = await pool.query('select * from stuinf');
  var da;
  await results.forEach((row) {
    if (da == null) {
      da = '["${row[0]}, ${row[1]}",';
      // Do something.
    } else {
      da = da + '"${row[0]}, ${row[1]}"';
      // Do something else.
    }
  });
  da = da + ']';
  print(da);
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    var res = request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(da)
      ..close();
  }
}
void addCorsHeaders(HttpResponse res) {
  res.headers.add('Access-Control-Allow-Origin', '*');
  res.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.headers.add('Access-Control-Allow-Headers',
  'Origin, X-Requested-With, Content-Type, Accept');
  res.headers.add('Access-Control-Allow-Credentials', true);
}
