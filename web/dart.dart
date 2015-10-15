import 'dart:html';
void main()
{
  querySelector('#btn').onClick.listen(NumberAdd);

}
void NumberAdd(MouseEvent event){
  var result=0;
  var n;
  for(n=1;m<11;n++)
  {
    result+=n;
  }
  querySelector('#txt1').value=result.toString();
}
