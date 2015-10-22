import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  connectDB();

  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(
        '["111", "222","333","444"]'

    )
      ..close();
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
connectDB() async{
  var pool = new ConnectionPool(host: 'localhost', port: 3306, user: 'root', password: '1234', db: 'stu', max: 5);
  var results = await pool.query('select * from stu1');
  results.forEach((row) {
    print('Name: ${row[0]}, email: ${row[1]}');
  });

}