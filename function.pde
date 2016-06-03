// ボールの移動方向の反転
void reflect(String name) {
  // 名前が"x"の時　= x軸
  if(name == "x") {
    // x軸方向の反転
    speedX *= -1;
  }
  // 名前が"y"の時　= y軸
  if(name == "y") {
    // y軸方向の反転
    speedY *= -1;
  }
}
// ボールの再射出
void reset() {
  // ボールのx座標の指定
  x = int(random(50, width - 50));
  // ボールのy座標の指定
  y = (blockHeight + 3) * BlockLine + 33;
}
// ボールの表示
void ball(PImage image) {
  // ボールが左端にいった時
  if(x < 0) {
    // x軸方向の反転
    reflect("x");
  }
  // ボールが右端にいった時
  if(x > width - ballWidth) {
    // x軸方向の反転
    reflect("x");
  }
  // ボールが上端にいった時
  if(y < 0){
    // y軸方向の反転
    reflect("y");
  }
  // x座標
  x += speedX;
  // y座標
  y += speedY;
  // ボールを表示
  image(image, x, y);
}
// ラケットの表示
void racket() {
  // ラケットの色を指定
  fill(255);
  
  // ラケットが左端にいった時
  if(mouseX - racketWidth/2 < 0) {
    // ラケットを表示
    rect(0, racketY, racketWidth, racketHeight);
  }
  // ラケットが右端にいった時
  else if(mouseX + racketWidth/2 > width) {
    // ラケットを表示
    rect(width - racketWidth, racketY, racketWidth, racketHeight);
  }
  // それ以外の場合
  else {
    // ラケットを表示
    rect(mouseX - racketWidth/2, racketY, racketWidth, racketHeight);
  }
}
// 上方ブロックの表示
void topBlock(int i){
  // ブロックの色の指定
  // ヒットカウントが2以上の時
  if(topHit[i] >= 2) {
    // 青色に指定
    fill(150, 150, 255);
  }
  // それ以外の時
  else {
    // 白に指定
    fill(255);
  }
  // ブロックの表示
  rect((blockWidth + 3) * (i % 5) + 16, (blockHeight + 3) * (i / 5) + 10, blockWidth, blockHeight);
}
// 下方ブロックの表示
void botBlock(int i){
  // ブロックの色の指定
  fill(255);
  // ブロックの表示
  rect((blockWidth + 3) * (i % 5) + 16, botBlockY, blockWidth, blockHeight);
}