//���ݰٶȵõ��Ĵ����޸ĳ����ģ�
import 'dart:io';
import 'package:sqljocky/sqljocky.dart';//�������ݿ�
main() async {
  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
  print("Serving at ${server.address}:${server.port}");
  var x = await addSql();//�������ݿ⣻
  await for (var request in server) {
    //�����ݿ�����ȡ����!
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
addSql(List<String> arguments) {//�������ݿ�
  //����һ�����ӳأ�host�����ӵ�ַ��port���˿ڣ�user���û�����password�����룬db�����ݿ�����max����󲢷���
  var pool = new ConnectionPool(host: '52.8.67.180',port: 3306, user: 'dec2013stu', password: 'dec2013stu', db: 'stu_10130340203', max: 5);
  //ִ��һ��SQL���
  pool.query("SELECT * FROM users").then((results) {
    results.forEach((row) {
      //ʹ���±��ѯ���
      print('${row[1]},${row[3]}');
    });
  });
}
