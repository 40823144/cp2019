
import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 200;
num circle_x = flag_w / 4;
num circle_y = flag_h / 4;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  drawROC(ctx);
  querySelector("#roc").onClick.listen((e) => drawROC(ctx));
  querySelector("#jp").onClick.listen((e) => drawJP(ctx));
  querySelector("#fr").onClick.listen((e) => drawFR(ctx));
  querySelector("#ru").onClick.listen((e) => drawRU(ctx));
  querySelector("#nl").onClick.listen((e) => drawNL(ctx));
  querySelector("#ge").onClick.listen((e) => drawGE(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}
void drawGE(ctx){
  //鋪黑
  ctx.fillStyle = '#000000';
  ctx.fillRect(0, 0, flag_w, flag_h);
  //鋪紅
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 66, flag_w, flag_h);
  //鋪黃
  ctx.fillStyle = '#FFCC00';
  ctx.fillRect(0, 132, flag_w, flag_h);
}
void drawNL(ctx){
  //鋪紅
  ctx.fillStyle = 'rgb(255, 42, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  //鋪白
  ctx.fillStyle = '#fff';
  ctx.fillRect(0, 66, flag_w, flag_h);
  //鋪藍
  ctx.fillStyle = 'rgb(0, 71, 170)';
  ctx.fillRect(0, 132, flag_w, flag_h);
}
void drawRU(ctx){
  //鋪白
  ctx.fillStyle = '#fff';
  ctx.fillRect(0, 0, flag_w, flag_h);
  //鋪藍
  ctx.fillStyle = 'rgb(0,81,186)';
  ctx.fillRect(0, 66, flag_w, flag_h);
  //鋪紅
  ctx.fillStyle = 'rgb(216,30,5)';
  ctx.fillRect(0, 132, flag_w, flag_h);
}
void drawFR(ctx){
  //鋪藍
  ctx.fillStyle = 'rgb(0,85,164)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  //鋪白
  ctx.fillStyle = '#fff';
  ctx.fillRect(90, 0, flag_w, flag_h);
  //鋪紅
  ctx.fillStyle = 'rgb(250,60,50)';
  ctx.fillRect(189, 0, flag_w, flag_h);
}
void drawJP(ctx){
  // 請畫出日本國旗
  num circle_x = flag_w / 2;
num circle_y = flag_h / 2;
  ctx.clearRect(0, 0, flag_w, flag_h);
  // 先畫滿地白
  ctx.fillStyle = '#fff';
  ctx.fillRect(0, 0, flag_w, flag_h);
    // 再畫紅色中心
    ctx.beginPath();
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w / 5.5, 0, Math.pi *2, true);
  ctx.closePath();
    // 填色設為紅色
  ctx.fillStyle = 'rgb(200, 0, 0)';
  ctx.fill();
}

void drawROC(ctx){
  // 先畫滿地紅
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, flag_h / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num star_radius = flag_w / 8;
  num angle = 0;
  for (int i = 0; i < 25; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circle_x + Math.cos(angle) * star_radius;
    num toY = circle_y + Math.sin(angle) * star_radius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  // 白日:白心
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
}

void clearCanvas(){
  ctx.clearRect(0, 0, flag_w, flag_h);
}