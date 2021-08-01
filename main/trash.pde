class Trush {
  PImage trush;
  int x = width/2;
  int y = height/2;
  int bx,by;
  int separate;
  boolean isClicked = false;
  boolean isInsideBox = false;
  int box2 = 2;
  int box3 = 3;
  int insideCount = 0;
  Trush(int x0, int y0, int bunbe2,PImage dust) {
    bx = x0;
    by = y0;
    separate = bunbe2;
    trush = dust;
  }
  
  void drawDust() {
    if(!isInsideBox) {
      if(isClicked) {
        image(trush,mouseX-50,mouseY-50);
        bx = mouseX;
        by = mouseY;
      }else {
        image(trush,bx-50,by-50);
      }
    }
  }
  
  void judgeClicked() {
    if(abs(mouseX-bx) < 50 && abs(mouseY-by) < 50) {
      if(!isClicked) {
        isClicked = true;
      }else {
        isClicked = false;
      }
    }
  }
  
  void judgeClicked2() {
    if(((abs(mouseX-(width/2-500)) < 100 || abs(mouseX-(width/2-200)) < 100 || abs(mouseX-(width/2+100)) < 100 || abs(mouseX-(width/2+400)) < 100)
    && abs(mouseY-(height/2)) < 100) && isClicked) {
      isInsideBox = true;
      insideCount++;
      if(insideCount == 1) {
        if(abs(mouseX-(width/2-500)) < 100) {
          if(separate == 3) {
            anger -= 10;
          }else {
            anger += 10;
          }
        }
        if(abs(mouseX-(width/2-200)) < 100) {
          if(separate == 4) {
            anger -= 10;
          }else {
            anger += 10;
          }
        }
        if(abs(mouseX-(width/2+100)) < 100) {
          if(separate == 2) {
            anger -= 10;
          }else {
            anger += 10;
          }
        }
        if(abs(mouseX-(width/2+400)) < 100) {
          if(separate == 1) {
            anger -= 10;
          }else {
            anger += 10;
          }
        }
        sortCount++;
      }
    }
  }
}
