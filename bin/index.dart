import 'dart:io';
import 'dart:async';
import 'package:sqljocky/sqljocky.dart';
import 'dart:convert';


main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8083);
  print("Serving at ${server.address}:${server.port}");
  //await delSql();
  await for (var request in server) {
    if(request.method=="POST"){
      var jsonString = await request.transform(UTF8.decoder).join();
      await insertSql(jsonString);
      request.response.close();
    }
    else if(request.method=="GET"){
      var list= await addSql();
      var json =JSON.encode(list);
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

}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
addSql() async{
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340201', max: 10);
  var results = await pool.query('select name, email from user_info');
  List list = new List();
  await results.forEach((row) {
    print('Name: ${row[0]}, email: ${row[1]}');
    //var json1 = JSON.encode('${row[0]},${row[1]}');
    list.add('Name: ${row[0]}, Email: ${row[1]}');
  });

  return list;
}

delSql() async{
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340201', max: 10);
  var trans = await pool.startTransaction();
  var result = await trans.query('DELETE FROM user_info WHERE name = "Marry"');
  await trans.commit();
}
insertSql(var x) async{
  var name1 =JSON.decode(x);
  print(name1);
  var name2=name1.toLowerCase();
  print(name2);
  var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340201', max: 10);
  var query = await pool.prepare('insert into user_info (name, email) values (?, ?)');
  await query.execute(['${name1}', '${name2}@qq.com']);
}