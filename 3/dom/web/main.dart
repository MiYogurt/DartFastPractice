import 'dart:html';

void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  querySelectorAll(".box");  
  document.querySelector("#output");
  var output = querySelector('#output');
  // SpanElement span = querySelector('#output');
  var img = ImageElement(src: "favicon.ico", width: 200, height: 200);
  document.body.append(img);
  var animation = img.animate([
    {"transform": "translate(100px, 100px)"},
    {"transform" : "translate(400px, 500px)"}
  ], 1500);
  animation.play();
  img.children.forEach(window.console.log);
  img.classes.forEach(window.console.log);
  var someNode = querySelector("#none-node");
  img.contains(someNode); // false
  img.innerHtml = "some";
  img.text = "some1";
  img.style.background = "red";
  img.setAttribute("data-size", "large"); // 设置添加的属性
  img.getAttribute("data-size"); // large

  img.onClick.listen((e){
    window.console.log(e);
  });

  img.addEventListener("click", (e){
    print("addevent click");
  });

  EventStreamProvider("my_event").forElement(img).listen((e){
    window.console.log(e);
  });
   var e = Event('my_event');
  img.dispatchEvent(e);

}


