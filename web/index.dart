import 'dart:html';
void main() {
  querySelector('#add').onClick.listen(add);


}

void add(MouseEvent event){

  int z=0;
  for(int i=1;i<=100;i++)
    {z +=i;
    }
  querySelector('#z').value=z.toString();
}









