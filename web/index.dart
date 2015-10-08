import 'dart:html';
import 'dart:math' as math;
import 'utility/people.dart';
void main() {
  querySelector('#text1').value=1.toString();
  querySelector('#button').onClick.listen((MouseEvent e)=>add(int.parse(document.getElementById("text2").value),e));
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
  var ple= new people();
ple..lastName='aa'
  ..firstName='bb';
  var getYou=students[random.nextInt(6)];
  querySelector('#sample_studentid_id').text = ple.lastName;
}
void add(int n2,MouseEvent e){
  int s=0;
  for(int i = 1; i <= n2; i++){
    s=s+i;
  }
  querySelector('#text3').value=s.toString();
}