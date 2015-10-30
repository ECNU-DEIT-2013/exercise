import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = '='
    ..onClick.listen(addNumber);
}

void addNumber(MouseEvent event)
{ var i;
  var A= int.parse(document.getElementById("left").value);
  var B=int.parse(document.getElementById("right").value);
  var sum=0;
  var C;
  if(A>B)
  { C=A;
    A=B;
    B=C;}
  for(i=A;i<=B;i++)
  sum=sum+i;
querySelector('#sample_text').text=sum.toString();
}
