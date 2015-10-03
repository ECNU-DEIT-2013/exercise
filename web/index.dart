import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(add1to100);
}

void add1to100(MouseEvent event) {
  int sum=0;
  for (int i = 1; i <=100; i++) {
    sum+=i;
  }
  String s="1 add to 100 is:"+sum.toString();
  querySelector('#sample_studentid_id').text = s;
}
void randomStudentID(String showStr,MouseEvent even){
  var students={
    0:100001,
    1:100002,
    2:100003,
    3:100004,
    4:100005,
    5:100005
  };
  var random = new math.Random();
  var getYou=students[random.nextInt(6)];
  querySelector('#sample_studentid_id').text = getYou.toString()+showStr;
}
