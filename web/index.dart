import 'dart:html';



//String str;
int sum=0;
bool check=false;
bool check1=false;
UListElement showw;
DivElement divv,div1,div2;

void main() {
  //querySelector('#sample_text_id')
    //..text = 'Please input the start number and the end number!'+'\r\n'+'Then click here!'
    //..onClick.listen(Oh);
  querySelector('#Show')
    ..onClick.listen(Showit);
}
int add([int k]){
  sum=sum+k+1;
  return sum;
}

void Showit(MouseEvent event){
  if(check1==false){
    divv = querySelector('#newwork');
    DivElement Adiv1= new DivElement();
    DivElement Bdiv1= new DivElement();
    TextInputElement T1= new TextInputElement();
    divv.children.add(Adiv1);
    Adiv1.id='C1';
    Bdiv1.text = 'Please input the start unmber:';
    Bdiv1.id='R1';
    T1.id='Te1';
    Adiv1.children.add(Bdiv1);
    Adiv1.children.add(T1);

    DivElement Adiv2= new DivElement();
    DivElement Bdiv2= new DivElement();
    TextInputElement T2= new TextInputElement();
    divv.children.add(Adiv2);
    Adiv2.id='C2';
    Bdiv2.text = 'Please input the end unmber:';
    Bdiv2.id='R2';
    T2.id='Te2';
    Adiv2.children.add(Bdiv2);
    Adiv2.children.add(T2);

    DivElement but=new DivElement();
    but.id='button1';
    but.text='click!';
    divv.children.add(but);


    TextAreaElement TA1=new TextAreaElement();
    TA1.id='TA-1';
    divv.children.add(TA1);

    querySelector('#Show').text='Input numbers and sum them up!';
    querySelector('#TA-1').text = 'Please input the start number and the end number!';

    check1=true;
  }
  querySelector('#button1')
    ..onClick.listen(Oh);
}

void Oh(MouseEvent event) {
  InputElement num1, num2;
  num1 = document.getElementById("Te1");
  num2 = document.getElementById("Te2");
  int i = int.parse(num1.value);
  int j = int.parse(num2.value);
  sum = i;
  if (check == false) {
    querySelector('#TA-1').text = '';
    for (int k = i;k < j;k++) {
      querySelector('#TA-1').text = querySelector('#TA-1').text + '\r\n' + sum.toString() + '+' + (k + 1).toString() + '=' + add(k).toString();
    }
  } else {
    querySelector('#TA-1').text = '';
    querySelector('#TA-1').text = 'Please input the start number and the end number!';
    check = true;
  }
}

