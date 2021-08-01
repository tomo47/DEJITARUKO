class Screen {
  int x = width/3;
  int y = height/2;
  int stepX = -1;
  int stepY = 1;
  void start_scene() {
    background(150, 200, 150);
    fill(0);
    textSize(80);
    text("ゴミをすててみよう！",x-100,y);
  }
  void over_scene() {
    background(100,200,255);
    
    String[] msg = {"わからなかったらパパとママにきいてみよう","またやってみよう",
                    ""};
    int rand = int(random(msg.length));
    
    fill(#FFFFFF);
    textSize(80);
    text(msg[rand],x+30,y);
    fill(0);
    textSize(50);
    text("またやってみてね！",x+30,y+70);
  }
  void clear_scene() {
    fill(255);
    textSize(80);
    text("きれいになったね！",x,y);
    fill(255,150,100);
    text("おめでとう！！",x,y+80);
  }
  void move() {
    if(x < 0 || width < x+410) {
      stepX *= -1;
    }
    x += stepX;
    if(y-80 < 0 || height < y+20) {
      stepY *= -1;
    }
    y += stepY;
  }
  void back_color() {
    color c1 = color(255, 200, 100);
    color c2 = color(255,250,250);
    noStroke();
    for(float h = 0; h < height; h+=5) {
      color c = lerpColor(c1,c2,h/height);
      fill(c);
      rect(0,h,width,height);
    }
  }
}
