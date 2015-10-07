import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen((MouseEvent e)=>randomStudentID("you!",e));
  querySelector('#sample_text_id')
  ..text="Please input the number."
  ..onClick.listen(myText);
  querySelector('#sample_text_result')
  ..text="Click me to get the result"
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

void myText(MouseEvent event) {
  var a = document.getElementById("myTexta").value;
  var b = document.getElementById("myTextb").value;
  var A = int.parse(a);
  var B = int.parse(b);
  addNumber(A, B);
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

void addNumber(num a,num b){
  var c=a+b;
  document.getElementById("sample_studentid_id").value=c.toString();
}

void add(MouseEvent event){
  var s=0;
  for(int i=1; i<101; i++)
  {
    s=s+i;
  }
  querySelector('#sample_text_result').text=s.toString();
}