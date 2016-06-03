// void draw()より前に1度だけ実行
void setup() {
  // ウィンドウサイズの変更
  size(400, 900);
  // フレームレートの変更
  frameRate(30);
  // 文字サイズの変更
  textSize(24);
  
  // earth変数に地球の画像を代入
  earth = loadImage("earth.jpg");
  // moon変数に月の画像を代入
  moon = loadImage("moon.png");
  // 上方ブロックのヒットカウントを設定
  for(int i=0;i<topBlockItems;i++) {
    // ヒットカウントに代入
    // 代入値はランダム
    topHit[i] = int(random(1,3));
  }
  // 下方ブロックのヒットカウントを設定
  for(int i=0;i<botBlockItems;i++) {
    // ヒットカウントに代入
    // 代入値は固定
    botHit[i] = 1;
  }
  reset();
}
// プログラムを終了させるまでループ
void draw() {
  // 背景の設定 
  background(7,5,10);
  // 背景に地球を表示
  image(earth, 0, height - 266);
  
  // switch文で制御すると不具合あるのでif文で制御
  // 勝利条件を満たした時
  if(flag == 1) {
    // 文字を表示
    text("game clear", width/2 -50, height/2);
  }
  // 敗北条件を見たした時
  else if(flag == 2) {
    // 文字を表示
    text("game over", width/2 -50, height/2);
  }
  // プログラム開始時
  else {
    // 上方ブロックのカウント計算用変数を最初にリセット
    sum = 0;
    // ボールを表示
    ball(moon);
    // ラケットを表示
    racket();
    
    // ボールが一番下まで落ちた時
    if(y > height - ballHeight) {
      // 敗北フラグを立てる
      flag = 2;
    }
    // ラケットの挙動の設定
    // ボールがラケットに接するか中に埋まりこんだ場合
    // y軸における指定
    if(y >= racketY - ballHeight && y <= racketY) {
      // ボールがラケットの間に落ちた場合
      // x軸における指定
      if(x + ballWidth/2 >= mouseX - racketWidth/2 && x + ballWidth/2 <= mouseX + racketWidth/2) {
        // y軸におけるボールの移動方向を反転
        reflect("y");
      }
    }
    // 上方ブロックの制御
    for(int i=0;i<topBlockItems;i++) {
      // 各ブロックのカウントが1以上の場合
      if(topHit[i] >= 1){
        // ボールがブロックに接するか中に埋まりこんだ場合
        // y軸における指定
        if(y <= (blockHeight + 3) * (i / 5) + blockHeight && y >= (blockHeight + 3) * (i / 5)) {
          // ボールがブロックの幅に当たった場合
          // x軸における指定
          if(x + ballWidth/2 >= (blockWidth + 3) * (i % 5) + 16 && x + ballWidth/2 <= (blockWidth + 3) * ((i % 5) + 1) + 13) {
            // ヒットカウントを1減らす
            topHit[i]--;
            // y軸におけるボールの移動方向を反転
            reflect("y");
          }
        }
        // ブロックの表示
        topBlock(i);
      }
      // ブロックすべての消滅させるのに必要なヒット数を計算
      sum += topHit[i];
    }
    // 下方ブロックの制御
    for(int i=0;i<botBlockItems;i++) {
      // 各ブロックのカウントが1以上の場合
      if(botHit[i] >= 1){
        // ボールがブロックに接するか中に埋まりこんだ場合
        // y軸における指定
        if(y >= botBlockY && y <= botBlockY + blockHeight){
          // ボールがブロックの幅に当たった場合
          // x軸における指定
          if(x + ballWidth/2 >= (blockWidth + 3) * i + 16 && x + ballWidth/2 <= (blockWidth + 3) * (i + 1) + 13) {
            // ヒットカウントを1減らす
            botHit[i] = 0;
            // ボールを上の方に戻す
            reset();
          }
        }
        // ブロックの表示
        botBlock(i);
      }
    }
    // 上方ブロックの残り必要ヒット数が0以下の時
    if(sum <= 0) {
      // 勝利フラグを立てる
      flag = 1;
    }
  }
}