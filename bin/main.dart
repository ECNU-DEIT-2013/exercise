//根据百度得到的代码修改出来的！
import 'dart:io';
import 'package:sqljocky/sqljocky.dart';//连接数据库
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  var x = await addSql();//连接数据库；
  await for (var request in server) {
    //从数据库中提取数据!
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
addSql(List<String> arguments) {//连接数据库
  //创建一个连接池，host：连接地址，port：端口，user：用户名，password：密码，db：数据库名，max：最大并发数
  var pool = new ConnectionPool(host: '52.8.67.180',port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340203', max: 5);
  //执行一条SQL语句
  pool.query("SELECT * FROM users").then((results) {
    results.forEach((row) {
      //使用下标查询结果
      print('${row[1]},${row[3]}');
    });
  });
}
