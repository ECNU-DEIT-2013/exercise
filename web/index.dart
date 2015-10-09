import 'dart:html';
void main()
{
  querySelector('#btn').onClick.listen(NumberAdd);

}
void NumberAdd(MouseEvent event){
  var result=0;
  var m;
  for(m=1;m<11;m++)
  {
    result+=m;
  }
  querySelector('#txt1').value=result.toString();
}
