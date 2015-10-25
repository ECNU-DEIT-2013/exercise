import 'dart:io';
import 'package:sqljocky/sqljocky.dart';
List information=new List();
int i=0;

main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  connectDB();

  await for (var request in server) {
    HttpResponse res = request.response;
    addCorsHeaders(res);
    res
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write('[');

      int j;
     for(j=0;j<information.length;j++)
    {
      res.write('"${information[j]}"');
    }
    res.write(']');
    res.close();
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
connectDB() async{
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340101', max: 5);
  var results = await pool.query('select * from tea1;');
  results.forEach((row) {
    print('Number: ${row[0]}, Name: ${row[1]},Subject: ${row[2]}');
    information.add('Number: ${row[0]}, Name: ${row[1]},Subject: ${row[2]}');
    i++;
    print(information[i-1]);
  });
}
/*var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340101', max: 5);
  var results = await pool.query('create table stu1(num int,name char(10));');*/