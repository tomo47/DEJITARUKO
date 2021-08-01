Trush[] trush = new Trush[5];
PImage[] gomi = new PImage[8];
PImage box1;
PImage box2;
PImage box3;
PImage box4;

Parent parent;

Screen scene;
boolean isPlay = false;
boolean isClear = false;
boolean isOver = false;

int anger = 50;
int sortCount = 0;

void setup() {
  fullScreen();
  parent = new Parent();
  scene = new Screen();
  box1 = loadImage("moe.png");
  box2 = loadImage("pura.png");
  box3 = loadImage("pet.png");
  box4 = loadImage("kan.png");
  box1.resize(200, 200);
  box2.resize(200, 200);
  box3.resize(200, 200);
  box4.resize(200, 200);
  for(int i = 0; i < gomi.length; i++) {
    gomi[i] = loadImage(i+1 + ".jpg");
    gomi[i].resize(100,100);
  }
  for(int i = 0; i < trush.length; i++) {
    int n = int(random(1,9));
    if(n == 1 || n == 2) {
      trush[i] = new Trush(100+(i*300),800,n,gomi[n-1]);
    }else if(n % 2 == 0) {
      trush[i] = new Trush(100+(i*300),800,4,gomi[n-1]);
    }else {
      trush[i] = new Trush(100+(i*300),800,3,gomi[n-1]);
    }
  }
  
  PFont font = createFont("Meiryo", 50);
  textFont(font);
}

void draw() {
  if(!isPlay) {
    scene.start_scene();
  }else if(isPlay && !isClear && !isOver) {
    //scene.play_scene();
    background(255);
    parent.display(anger);
    int[] boxX={width/2-600, width/2-300, width/2, width/2+300};
    int boxY = height/2-100;
    int H = 201;
    for(int i = 0; i < 4; i ++) {
      line(boxX[i], boxY, boxX[i]+H, boxY);
      line(boxX[i]+H, boxY, boxX[i]+H, boxY+H);
      line(boxX[i]+H, boxY+H, boxX[i], boxY+H);
      line(boxX[i], boxY+H, boxX[i], boxY);
    }
    image(box1, boxX[0]+1, boxY+1);  
    image(box2, boxX[1]+1, boxY+1);
    image(box3, boxX[2]+1, boxY+1);
    image(box4, boxX[3]+1, boxY+1);
  
    for(int i = 0; i < trush.length; i++) {
      trush[i].judgeClicked2();
      trush[i].drawDust();
    }
    if(sortCount == 5) {
      if(anger >= 40) {
        isOver = true;
      }else {
        isClear = true;
      }
    }
  }else if(isClear) {
    scene.back_color();
    scene.move();
    scene.clear_scene();
    anger = 50;
    fill(255);
    textSize(80);
    text("いえのおてつだいもがんばろう！",150,150);
  }else if(isOver) {
    scene.over_scene();
    anger = 50;
  }
}

void mouseClicked() {
  if(!isPlay) {
    isPlay = true;
  }else {
    for(int i = 0; i < trush.length; i++) {
      trush[i].judgeClicked();
    }
    if(isClear || isOver) {
      exit();
    }
  }
}
