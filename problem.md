#几个还存在的问题和尝试
- 查过注释的文档，各种方式都试过，在服务器的dart文件里还使不能写中文，在客户端的dart里可以。  
  问题在于文档编码，调成utf-8
  
- 点击一次按钮或者刷新一次127.0.0.1：8080，数据就会翻倍增长，没有查到是什么问题。  
  问题在于，EmailList 是全局的，你每次都往上加：EmailList.children.add 
- 尝试传入JSON数组[{"ID":"101","NAME":"ZYJ",“EMAIL":"ZYJ@163.COM"},{"ID":"102","NAME":"SYN",“EMAIL":"SYN@163.COM"}]
或二维数组[["101","ZYJ","ZYJ@163.COM"]["101","ZYJ","ZYJ@163.COM"]]，输出的是单个字符，decode、encode都试过，未成功。  
  关于上述问题，json 格式{[],[]} 
- 关于用dart将数据写入数据库：
var query = await pool.prepare('insert into user_inf (user_name,user_email) values (?,?)');
 （仅有这条语句时无法在数据库中添加纪录，也不报错，加上下面 query.execute语句后可以添加纪录，但纪录中的数
 据却是这一条中的，还会添加两条相同的纪录。）var result = await query.execute(['SXJ', 'SXJ@163.com']);
 （若上条语句values后改为（？，？），则添加的纪录为这条语句中的数据。但依旧出现两条相同数据。）  
  prepare是为了准备插入构造插入句法用得，还没有执行，顾不能插入，后面的execute就是做这个的。
  关于两条记录，你尝试用firefo浏览器执行试试看。如果问题依旧我们在查看
  