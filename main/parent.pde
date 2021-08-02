class Parent {
  int px = width/2-100, py = 20, pLen = 200;
  int textX = width/2-200, textY = 270;
  int gx = width/2-170, gy = 240, gLen = 200;
  int anger;
  PImage img1, img2, img3;
  Parent() {
    img1 = loadImage("img1.png");
    img2 = loadImage("img2.png");
    img3 = loadImage("img3.png");
  }

  void display(int ir) {
    anger = ir;
    if(0 <= anger && anger < 20) { 
      image(img3, px, py, pLen, pLen);
      fill(255);
      rect(gx+200, gy, gLen, 30);
      fill(100,100,200);
      rect(gx+200, gy, anger*2, 30);
      fill(0);
      textSize(50);
      text("えらい！", textX, textY);
    }else if(anger < 40) {
      image(img2, px, py, pLen, pLen);
      fill(255);
      rect(gx+200, gy, gLen, 30);
      fill(100,200,100);
      rect(gx+200, gy, anger*2, 30);
      fill(0);
      textSize(50);
      text("よし！", textX, textY);
    }else {
      image(img1, px, py, pLen, pLen);
      fill(255);
      rect(gx+200, gy, gLen, 30);
      fill(200,100,100);
      rect(gx+200, gy, anger*2, 30);
      fill(0);
      textSize(50);
      text("コラー！", textX, textY);
    }
  }
}
