import 'dart:html';
import 'dart:math' as math;
import 'utility/people.dart';
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen((MouseEvent e)=>randomStudentID("you!",e));
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}
void test(){}
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
  var ple= new people();
ple..lastName='aa'
  ..firstName='bb';
  var getYou=students[random.nextInt(6)];
  querySelector('#sample_studentid_id').text = ple.lastName;
}
