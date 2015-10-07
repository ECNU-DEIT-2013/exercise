import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = '1+2+3+...+98+99+100=?'
    ..onClick.listen(add);
}


void add(MouseEvent event) {
  int i=0;
  int m=0;
  for (i=1;i<=100;i++)
  {m=m+i;}
  querySelector('#sample_text_id').text = m.toString();
}
