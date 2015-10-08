import 'dart:html';
import 'dart:math' as math;
import 'utility/people.dart';
void main() {
  querySelector('#sample_text_id')
    ..text = '1+2+3+...+100='
    ..onClick.listen(add);
}

void add(MouseEvent event) {
  int x=0;
  for (int i =  1; i <= 100; i++) {
    x += i;
  }
  querySelector('#x').text = x.toString();
}
