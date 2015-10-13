import 'dart:html';
import 'dart:math' as math;    //11
Element new1,new2;
InputElement t1,t2,t3,t4;
UListElement ul1;
List<ButtonElement> buttons =new List();
int i;
Map map1 = { 1:'a', 2:'b', 0:'c '};     //11
void main() {
  i=1;
  ul1 =querySelector('#hello');
  t1=querySelector('#text1');
  t2=querySelector('#text2');
  t3=querySelector('#text3');
  new1=querySelector('#new1');
  new2=querySelector('#new2');
  querySelector('#button')
    ..onClick.listen((MouseEvent e)=>start(int.parse(t1.value),int.parse(t2.value),e))
    ..onClick.listen(start2);
  querySelector('#button2')
    ..onClick.listen((MouseEvent e)=>start(1,100,e))
    ..onClick.listen(start1)
    ..onClick.listen(start2);
  querySelector('#button3').onClick.listen(start3);
  newLetters();
}
String start(int origin1,int origin2,MouseEvent e){
  if(origin1>origin2){
    var temp;
    temp=origin2;
    origin2=origin1;
    origin1=temp;
  }
  int sum=0;
  for(int i = origin1; i <= origin2; i++){
    sum=sum+i;
  }
  t3.value=sum.toString();
  return t3.value;
}
void start1(MouseEvent e){
  t1.value=1.toString();
  t2.value=100.toString();
}

void start2(MouseEvent e) {
  var gifts = {
    1 :'first',
    2 : 'second',
    3 : 'third'
  };
  var TextField1 = new LIElement();
  String he1 =sum1();
  if (i > 3)
  {
    TextField1.text = "No more space";
    querySelector('#button').disabled =true;
    querySelector('#button2').disabled =true;
  }
  else
    TextField1.text = "It is the" + " " + gifts[i] + " time:" + he1+"="+t3.value;
  ul1.children.add(TextField1);
  i++;
}

void start3(MouseEvent e){
  ul1.children.clear();
  i=1;
  querySelector('#button').disabled =false;
  querySelector('#button2').disabled =false;
}

String sum1(){
  if(int.parse(t2.value)<int.parse(t1.value)){
    var temp;
    temp=t2.value;
    t2.value =t1.value;
    t1.value = temp;
  }
  String he=t1.value;
  for(int j=int.parse(t1.value)+1;j<=int.parse(t2.value);j++){
    he =he+"+"+j.toString();
  }
  return he;
}
void moveLetters(MouseEvent e){
  Element letter2 =e.target;
  if(letter2.parent==new1){
    new2.children.add(letter2);
  }
  else
  {
    new1.children.add(letter2);
  }
}
newLetters(){
  var random = new math.Random();
  buttons.clear();
  for (var j = 0; j < 3; j++) {
    int letter1 = random.nextInt(3);
    buttons.add(new ButtonElement());   //在button列表中添加一个新的button元素；
    buttons[j].classes.add("letter");    // 给这个button的类中添加一个名为“letter”的类别
    buttons[j].onClick.listen(moveLetters);
    buttons[j].text = map1[letter1];        //这个按钮里面的字母是从字符串中取来的；
    new1.children.add(buttons[j]);                 //在letterPile这个块里面添加上这一个按钮；
  }
}
