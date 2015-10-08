import 'dart:html';

void main() {
  querySelector('#sample_text_id').text = 'calculate sum(10)';
  querySelector('#sample_text_id').onClick.listen(reverseText);
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var sum=0;
  for (int a=1;a<=10;++a) {
    sum=sum+a;
  }
  querySelector('#sample_text_id').text = sum.toString();
}