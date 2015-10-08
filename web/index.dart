import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = '1到100相加总和'
    ..onClick.listen(add);
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
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

void add(MouseEvent event) {
  var sum = 0;
  for (var i = 0;i <= 100;i++) {
    sum = sum + i;
  }
  querySelector('#sample_text_id').text = sum.toString();
}