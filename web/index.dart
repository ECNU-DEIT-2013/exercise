import 'dart:html';
import 'dart:math' as math;

int sum=0;
int j=0;

void main() {
  querySelector('#sample_text_id1')
    ..text = 'Add:1+2+...+100='
    ..onClick.listen(display);
}

void addsum(){
  for (int i=1;i<=100;i++)
  sum=sum+i;
  return sum;
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}

void display(MouseEvent event){
  int a=addsum();
  if (j<=0){
    querySelector('#sample_text_id1').text = querySelector('#sample_text_id1').text+a.toString();
    j=1;
  }
}





