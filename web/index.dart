import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#button_add_id1')
    ..text = '='
    ..onClick.listen(addTwoNumber);

  querySelector('#button_add_id2')
    ..text = '='
    ..onClick.listen(addOneToHundred);
}


void addTwoNumber(MouseEvent event){
  vax x=int.parse(querySelector('#a').value);
  vax y=int.parse(querySelector('#b').value);
  querySelector('#c').text=addNumber(x,y).toString();
}

int addNumber(x,y){
  return(x+y);
}


void addOneToHundred(MouseEvent event){
  int sum=0;
  for(int i=1;i<=100;i++)
    sum=sum+i;
  querySelector('#result').text=sum.toString();
} 