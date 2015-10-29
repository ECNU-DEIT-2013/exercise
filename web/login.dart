import 'dart:html';
String username, password;

void main(){
  querySelector('#login_submit').onClick.listen(submit);
}
void submit(Event e){
  MessageEvent
  username=document.getElementById('login_user').value;
  password=document.getElementById('login_password').value;
  querySelector('#login_submit').value="sure";
  if (username=='abcd' ) {
    if(password=='abcd') querySelector('#login_submit').onClick.listen(index_link);
    else querySelector('#login_submit').onClick.listen(error);
  }
  else querySelector('#login_submit').onClick.listen(index_errorlink);
}

void index_link(Event e){
 window.open("index.html","newwindow");
}
void error(Event e){
  querySelector('#error_submit').text="error";
}
void index_errorlink(Event e){
  window.open("page.html","newwindow");
}