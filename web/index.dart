import 'dart:html';
import 'dart:math' as math;

void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(add);
  querySelector('#sample_sum_id')
    ..text = 'the sum of all the numbers from 1 to 10';


}

void add(MouseEvent event) {
  int s=0;
  for(int i=1;i<=10;i++){
    s=s+i;
  }
  querySelector('#text1').value = s.toString();
}
