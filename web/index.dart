import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = '1+2+3+...+100='
    ..onClick.listen(add);
}

void add(MouseEvent event) {
  var buffer =0;
  for (int i = 0; i <= 100; i++) {
    buffer=buffer+i;
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
