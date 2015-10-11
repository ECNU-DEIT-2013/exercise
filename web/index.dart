import 'dart:html';
import 'dart:math' as math;
void main() {
 querySelector('#btn1')
    ..onClick.listen((MouseEvent e)=>add1(int.parse(querySelector('#txt1').value),int.parse(querySelector('#txt2').value),e));
 querySelector('#btn2')
   ..onClick.listen((MouseEvent e)=>add2(int.parse(querySelector('#txt1').value),int.parse(querySelector('#txt2').value),e));
 querySelector('#btn3')
    ..onClick.listen(clear);
 toDoList=querySelector('#sample_todolist_id');
}

void add1(int m,int n, MouseEvent e){
  var s=0;
 if(m>n){
    var temp;
    temp=m;
    m=n;
    n=temp;
  }
  for(int i=m;i<=n;i++)
  {s=s+i;}
 // querySelector('#txt3').value=s.toString();
  document.getElementById("sample_add_id").value=s.toString();
}

void add2(int m,int n, MouseEvent e){
  var c=0;
  c=m+n;
  querySelector('#txt3').value=c.toString();
}

clear(MouseEvent event){
  querySelector('#txt1').value='';
  querySelector('#txt2').value='';
  //querySelector('#txt3').value='';
  }
