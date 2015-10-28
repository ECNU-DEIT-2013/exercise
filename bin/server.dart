import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';

List table=new List();int i=0;
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

connect() async{
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340208', max: 10);
  var results = await pool.query('select * from stu;');

  results.forEach((row) {
    print('stu_id: ${row[0]},stu_name: ${row[1]}');
    table.add('stu_id:${row[0]}, stu_name:${row[1]}');
    i++;
    print(table[i-1]);
  });
}

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  connect();
  await for (var request in server) {
    var list = JSON.encode(table);
    HttpResponse res = request.response;
    addCorsHeaders(res);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('${list}'
    )
      ..close();

/*  res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[');

    for(int i=0;i<table.length;i++)
      //res.write('"${table[i]}"');

    res.write(']');
    res.close();

    */
  }
}
