import 'dart:html';
import 'dart:web_audio';
import 'dart:typed_data';
import 'dart:async';

AudioElement audio = querySelector("#player");
CanvasElement canvas = querySelector("#visualization");

var ac = new AudioContext();
var analyser = ac.createAnalyser();
var audioSource = ac.createMediaElementSource(audio);

var height = canvas.height;
var width = canvas.width;
var ctx = canvas.context2D;

var w = 20; // 小方块的宽度
var h = 10; // 小方块的高度
var margin = 5 ;// 上下方块的间隔
var maxSize = 24; // 最高方块输
var widthSize = ceil(width / w + margin); // 列数
var GreenHightArray = List.filled(widthSize + 1, height); // 存放绿色方块高度的数组
var v = (h + margin) * 1; // 下降速度
var lines = ceil(height / (h + margin)); // 计算最高行数
var step = 10; // 步进，按比例取其中的值

Uint8List datas =  Uint8List.fromList(List.filled(analyser.frequencyBinCount, 0)); // 初始化空数据

void main() {
  audio.onLoad.listen((_) => audio.play());

  audioSource.connectNode(analyser);
  analyser.connectNode(ac.destination);

  loop();
  fetchData();
}

void loop() {
  animation();
  Future.delayed(Duration(milliseconds: 300)).then((_) => loop());
}

void fetchData(){
    analyser.getByteFrequencyData(datas);
    Future.delayed(Duration(milliseconds: 150)).then((_) => fetchData());
}

int ceil(double num) {
  return num.toInt();
}

void animation(){
  ctx.clearRect(0, 0, width, height);
  for (var j = 0; j <= widthSize; j++) {
    var val = (datas[j * step]);
    var currentSize = ceil( (val / 255 ) * maxSize);
    CanvasGradient g = ctx.createLinearGradient(0, height, 0 , 0);
    g.addColorStop(0, '#233142');
    g.addColorStop(0.3, '#455d7a');
    g.addColorStop(0.7, '#f95959');
    ctx.fillStyle = g;
    ctx.fillRect(j * w + margin * j, height - (h + margin) * currentSize, w, (h + margin) * currentSize);
    // 绿块逻辑
    ctx.fillStyle = '#08c299';

    var currentGreenHight = height - currentSize * (h + margin);  // 制高点 y 坐标。

    if (GreenHightArray[j] + v > currentGreenHight) {
      GreenHightArray[j] = currentGreenHight;
      ctx.fillRect(j * w + margin * j, GreenHightArray[j], w, h + margin);
    } else {
      GreenHightArray[j] += v;
      ctx.fillRect(j * w + margin * j, GreenHightArray[j], w, h + margin);
    }
  }

  for (var i = 0; i <= lines; i++) {
    ctx.clearRect(0, height - i * (h + margin) , width, margin);
  }
}
