PImage img;

int rectX, rectY;      // Position of square button
int rectSize = 60;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight, rectSelect;
color currentColor;
boolean buttonOneOver = false;
boolean buttonTwoOver = false;
boolean buttonThreeOver = false;

boolean cookTime = false;
int cookS = 0;
int cookM = 0;
void setup(){
  size(250,500);
  strokeWeight(4);
  img = loadImage("clockBackground.png");
  
  rectColor = color(0);
  rectHighlight = color(51);
  rectSelect = color(0, 102, 153);
  baseColor = color(102);
  currentColor = baseColor;
  rectX = width/2-rectSize-20;
  rectY = height/2-rectSize/2;
}


void draw(){
  
  int LeftRowX = width/2-rectSize-45;
  int MiddleRowX = width/2-rectSize + 30;
  int RightRowX = width/2-rectSize + 105;
  
  int TopRowY =  height/2-rectSize/2;
  int MiddleRowY = height/2-rectSize + 105;
  int BottomRowY = height/2-rectSize + 180;
  
  
  buttonOneOver = mouseOver(LeftRowX, TopRowY, rectSize, rectSize);
  buttonTwoOver = mouseOver(MiddleRowX, TopRowY, rectSize, rectSize);
  buttonThreeOver = mouseOver(RightRowX, TopRowY, rectSize, rectSize);
  
  stroke(255);
  
  boolean start = false;
  

  
  
  if (buttonOneOver){ //Start button
    fill(rectHighlight);
    if (mouseButton == LEFT && mousePressed) {
      fill(rectSelect);
      start = true;
    }
  } else{
    fill(rectColor);
  }
  

  
  
  rect(LeftRowX, TopRowY, rectSize, rectSize);
  
  if (buttonTwoOver){ //Add 30 Sec button
    fill(rectHighlight);
    if (mouseButton == LEFT && mousePressed) {
      fill(rectSelect);
      cookTime = true;
      cookS = cookS + 30;
      if (cookS == 60){
        cookM = cookM + 1;
        cookS = 0;
      }

      delay(100);
    }
  } else{
    fill(rectColor);
  }
  rect(MiddleRowX, TopRowY, rectSize, rectSize);
  
  if (buttonThreeOver){ //Stop Button
    fill(rectHighlight);
    if (mouseButton == LEFT  && mousePressed) {
      fill(rectSelect);
      cookS = 0;
      cookM = 0;
      cookTime = false;
      start = false;
    }
  } else{
    fill(rectColor);
  }
  rect(RightRowX, TopRowY, rectSize, rectSize);

  //background(88);
  
  image(img, -7,10);
  
  textSize(16);
  textAlign(CENTER);
  fill(255, 255, 255);
  text("START\n(>)", LeftRowX+30, TopRowY+22); 
  text("ADD\n30s", MiddleRowX+30, TopRowY+22); 
  text("STOP\n(X)", RightRowX+30, TopRowY+22); 

  int s = second();
  int m = minute();
  int h = hour();
  h = h % 12;
  

  if (start){
    print("wow");
    if(cookS == 0 && cookM == 0){
      start = false;
    }else{
      delay(1000);
      cookS = cookS - 1;
    }
  }


  
  String displayContent = "00:00";
  
  if(cookTime){
    
    if (cookS < 60 && cookM == 0){
      displayContent = "00:" + cookS; 
    }
    if (cookS < 10 && cookM == 0){
      displayContent = "00:0" + cookS; 
    }
    if (cookS < 10 && cookM > 0){
      displayContent = cookM + ":0" + cookS; 
    }
    if(cookM < 10){
      displayContent =  "0" + cookM + ":" + cookS;
    }
    else{
      displayContent =  cookM + ":" + cookS;
    }
    
    textAlign(LEFT);
    textSize(72);  
    fill(0, 102, 153);
    text(displayContent, 25, 110); 
  }else{
    displayContent = h + ":00";
    if (m < 10){
      displayContent = h + ":0" + m;
    } else{
      displayContent = h + ":" + m;
    }
    
    textAlign(LEFT);
    textSize(72);  
    fill(0, 102, 153);
    text(displayContent, 25, 110); 
    //Seconds on the clock
    textSize(12);
    text(s, 210, 130); 
    fill(0, 102, 153);
  }
 
}

boolean mouseOver(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void subtractTime(){
  
}
