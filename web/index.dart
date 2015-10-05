import 'dart:html';
import 'dart:math' as math;
var number=0;
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen((MouseEvent e)=>randomStudentID("you!",e));
  querySelector('#sample_text_id2')
    ..text = '1+..+100=?'
    ..onClick.listen(addSum);
  querySelector('#sample_text_id3')
    ..text = 'Here is the answer...';
  querySelector('#button').onClick.listen(add);
}
void add(MouseEvent event){
  int a =int.parse(document.getElementById("text1").value);
  int b =int.parse(document.getElementById("text2").value);
  var x =a+b;
  querySelector('#button').value=x.toString();
}
void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}
void addSum(MouseEvent event) {
  var number=0;

  for (var i = 1;i<=100;i++)
  {
    number = i+ number;
  }

  querySelector('#sample_text_id3').text = number.toString();
}

void randomStudentID(String showStr,MouseEvent even){
  var students={
    0:10001,
    1:10002,
    2:100003,
    3:100004,
    4:100005,
    5:100005
  };
  var random = new math.Random();
  var getYou=students[random.nextInt(6)];
  querySelector('#sample_studentid_id').text = getYou.toString()+showStr;
}
