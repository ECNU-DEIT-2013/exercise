import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = '1+2+3+4...+100='
    ..onClick.listen(Add);
}

void Add(MouseEvent event){
  var i=0;
  var s=0;
  for(i=1;i<=100;i++)
  {s=s+i;}
  querySelector('#sample_text_id').text=s.toString();
}

