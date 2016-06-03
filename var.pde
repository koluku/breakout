// ゲーム進行の分岐
int flag = 0;
// earth変数とmoon変数をPImageで定義
PImage earth, moon;

// ボールのx座標、y座標の定義
float x, y;
// ボールの速度
float speed = 7;
// ボールの横方向の移動変化
float speedX = speed * cos(radians(random(60,75)));
// ボールの縦方向の移動変化
float speedY = speed * sin(radians(random(60,75)));
// ボールの幅
int ballWidth = 50;
// ボールの高さ
int ballHeight = 50;

// ラケットの幅
int racketWidth = 80;
// ラケットの高さ
int racketHeight = 10;
// ラケットの位置の高さ
int racketY = 600; 

// ブロックの幅
int blockWidth = 70;
// ブロックの高さ
int blockHeight = 20;
// 上方ブロックのy座標
int topBlockY = 10;
// 下方ブロックのx座標
int botBlockY = 650;
// ブロックの横方向の数
int BlockColumn = 5;
// ブロックの縦方向の数
int BlockLine = 3;
// 上方ブロックの数
int topBlockItems = BlockColumn * BlockLine;
// 下方ブロックの数
int botBlockItems = BlockColumn;
// 上方ブロックのヒットカウントの配列の定義
int topHit[] = new int[topBlockItems];
// 下方ブロックのヒットカウントの配列の定義
int botHit[] = new int[5];
// 上方ブロックのヒットカウントの合計の定義
int sum;