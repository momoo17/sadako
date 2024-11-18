import processing.video.*;

Capture video;
int numPixels;  // 画像のピクセルの総数
int score;  // ゲーム点数
float[] backgroundBrightness;  // 背景の明るさ
float thresh_ = 50.0;  // 閾値
PImage sadakoImg;  // sadako画像
boolean changeDetected = false;  // 変化が検出されたかどうか
boolean prevChangeDetected = false;  // 前回の判定結果

int rectX, rectY;  // 赤い四角の位置
float rectSpeedX = 2;  // 赤い四角のX方向の速度
float rectSpeedY = 2;  // 赤い四角のY方向の速度
int changeSpeedInterval = 60;  // 速度を変更する間隔（フレーム数）
int lastSpeedChangeTime = 0;  // 最後に速度を変更した時間

void setup() {
  size(640, 480);
  colorMode(RGB);
  
  video = new Capture(this, width, height, 24);
  video.start();
  
  numPixels = video.width * video.height; // キャプチャーするビデオ画像の総ピクセル数
  backgroundBrightness = new float[numPixels]; // 現在のキャプチャ画像と比べるために背景画像用の配列を作る
  loadPixels();
  
  score = 0;
  
  sadakoImg = loadImage("sadako.png");  // sadako画像を読み込む
  
  // 初期位置を画面中央に設定
  rectX = width / 2 - 5;
  rectY = height / 2 - 5;
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
    
    // 速度をランダムに変更
    if (frameCount - lastSpeedChangeTime >= changeSpeedInterval) {
      rectSpeedX = random(-20, 20);
      rectSpeedY = random(-20, 20);
      lastSpeedChangeTime = frameCount;
    }
    
    // 矩形領域内の光度変化をチェック
    changeDetected = false;
    
    for (int y = rectY; y < rectY + 100; y++) {
      for (int x = rectX; x < rectX + 100; x++) {
        if (x >= 0 && x < width && y >= 0 && y < height) {  // 範囲チェック
          int index = x + y * width;
          float currBrightness = brightness(video.pixels[index]);
          float bkgdBrightness = backgroundBrightness[index];
          float diff = abs(currBrightness - bkgdBrightness);
          
          if (diff > thresh_) {
            changeDetected = true;
            break;
          }
        }
      }
      if (changeDetected) break;
    }
    
    if (changeDetected && !prevChangeDetected) {
      score++;  // スコアを増加
    }
    prevChangeDetected = changeDetected;
    
    // ピクセルごとの処理
    for (int i = 0; i < numPixels; i++) {
      float currBrightness = brightness(video.pixels[i]);
      float bkgdBrightness = backgroundBrightness[i];
      float diff = abs(currBrightness - bkgdBrightness);
      
      if (changeDetected && diff > thresh_) {
        pixels[i] = color(255, 0, 0);  // 差分を赤色で表示
      } else {
        pixels[i] = video.pixels[i];
      }
    }
    
    updatePixels();  // ピクセルを更新

    // sadako画像を現在の位置に描画
    image(sadakoImg, rectX, rectY, 100, 100);  // sadako画像を四角の位置に描画

    // 赤い四角の位置を更新
    rectX += rectSpeedX;
    rectY += rectSpeedY;

    // 画面の端に当たったら跳ね返る処理
    if (rectX <= 0 || rectX >= width - 100) {  // sadako画像の幅に合わせて -100
      rectSpeedX *= -1;
    }
    if (rectY <= 0 || rectY >= height - 100) {  // sadako画像の高さに合わせて -100
      rectSpeedY *= -1;
    }
    
    if (changeDetected) {
      fill(255, 0, 0);  // テキストの色を赤に設定
      textSize(50);  // テキストサイズを50に設定
      textAlign(CENTER, CENTER);  // テキストの位置を中央揃えに設定
      text(score + " times you died", width / 2, height / 2);  // 画面の中央にテキストを描画
    }
  } 
}

void keyPressed() {
  if (key == '1') {
    thresh_ += 1.0;
    println(thresh_);
  } else if (key == '2') {  
    thresh_ -= 1.0;
    println(thresh_);
  } else if (key == 'b') {
     video.loadPixels();
     for (int i = 0; i < numPixels; i++) {
       backgroundBrightness[i] = brightness(video.pixels[i]);
     }
     println("bg reset");
     score = 0;
  } else if (key == '3') {
    rectSpeedX += (rectSpeedX < 0) ? -1 : 1; // 現在の方向に応じて速度を増加
    rectSpeedY += (rectSpeedY < 0) ? -1 : 1; // 現在の方向に応じて速度を増加
    println(rectSpeedX, rectSpeedY);
  } else if (key == '4') {
    rectSpeedX = (abs(rectSpeedX) > 1) ? rectSpeedX + ((rectSpeedX < 0) ? 1 : -1) : rectSpeedX;
    rectSpeedY = (abs(rectSpeedY) > 1) ? rectSpeedY + ((rectSpeedY < 0) ? 1 : -1) : rectSpeedY;
    println(rectSpeedX, rectSpeedY);
  }
}
