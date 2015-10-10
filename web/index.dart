import 'dart:html';
void main()
{
  querySelector('#btn').onClick.listen(NumberAdd);
}
void NumberAdd(MouseEvent event)
{
  var sum=0;
  var i;
  for(i=1;i<=100;i++)
  {
    sum+=i;
  }
  querySelector('#txtl').value=sum.toString();
}
