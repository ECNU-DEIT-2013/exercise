import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

main() async {
  List JTxt1=new List();
  await getData(JTxt1);
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8008);
  print("Serving at ${server.address}:${server.port}");

 // var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340245');
  //var results =await pool.query('select UserNum,UserName,UserPhone from UserList');
  //results.forEach((row) {
    //JTxt1=JTxt1+"'UserNum: ${row.UserNum} , UserName:${row.UserName} , UserPhone:${row[2]}'"+','+'\n';
  //});

  //JTxt1 = await JTxt1+"''\n]";
  await for (var request in server) {

    //var JTxt1 ='['+'"portmanteau", "fantabulous", "spork", "smog","spanglish", "gerrymander", "turducken", "stagflation","bromance", "freeware", "oxbridge", "palimony", "netiquette","brunch", "blog", "chortle", "Hassenpfeffer", "Schnitzelbank"'+']' ;
   request.response.headers
    ..add('Access-Control-Allow-Origin', '*')
    ..add('Access-Control-Allow-Methods', 'POST, OPTIONS')
    ..add('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');

    print(JTxt1);
    request.response
      ..headers.contentType = new ContentType("application", "json", charset: "utf-8")
      ..write(JTxt1)
      ..close();
  }
}

 getData(var JTxt1) async{
   var pool = new ConnectionPool(host: '52.8.67.180', port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340245');
   var results =await pool.query('select UserNum,UserName,UserPhone from UserList');
   results.forEach((row) {
     //JTxt1=JTxt1+"'UserNum: ${row.UserNum} , UserName:${row.UserName} , UserPhone:${row[2]}'"+','+'\n';
     JTxt1.add('"UserNum: ${row.UserNum};   UserName:${row.UserName};   UserPhone:${row[2]}"');
     print('ok');
   });
 }

