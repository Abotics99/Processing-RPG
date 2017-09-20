PImage grass;
PImage sand;
PImage player;
PImage fullMap;
PImage NPC1;
PImage NPC2;
PImage textBox1;
PImage animTex;
PImage parBack1;
PImage parBack2;
PImage parBack3;

void loadTextures() {
  player = loadImage("PlaceHolder_CharL.png");
  fullMap = loadImage("FullTextMap_L.png");
  NPC1 = loadImage("character2L.png");
  NPC2 = loadImage("character3_L.png");
  textBox1 = loadImage("TextBoxL.png");
  animTex = loadImage("animMap_L.png");
  parBack1 = loadImage("BackGround1.png");
  parBack2 = loadImage("BackGround2.png");
  parBack3 = loadImage("BackGround3.png");
}

void drawBackground_L1() {
  for(int y=camX;y<(tiSi*worldSizeY)+camX;y+=tiSi) {
    for(int x=0+camY;x<(tiSi*worldSizeX)+camY;x+=tiSi) {
      int matX = (x-camY)/tiSi;
      int matY = (y-camX)/tiSi;
      if(areaNumber==1){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W1_L1[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W1_L1[matY][matX]%112)*64,(W1_L1[matY][matX]/112)*64,((W1_L1[matY][matX]%112)*64)+64,((W1_L1[matY][matX]/112)*64)+64);
        }
      }
      if(areaNumber==2){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W2_L1[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W2_L1[matY][matX]%112)*64,(W2_L1[matY][matX]/112)*64,((W2_L1[matY][matX]%112)*64)+64,((W2_L1[matY][matX]/112)*64)+64);
        }
      }
    }
  }
}

void drawBackground_L2() {
  for(int y=0+camX;y<(tiSi*worldSizeY)+camX;y+=tiSi) {
    for(int x=0+camY;x<(tiSi*worldSizeX)+camY;x+=tiSi) {
      int matX = (x-camY)/tiSi;
      int matY = (y-camX)/tiSi;
      if(areaNumber==1){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W1_L2[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W1_L2[matY][matX]%112)*64,(W1_L2[matY][matX]/112)*64,((W1_L2[matY][matX]%112)*64)+64,((W1_L2[matY][matX]/112)*64)+64);
        }
      }
      if(areaNumber==2){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W2_L2[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W2_L2[matY][matX]%112)*64,(W2_L2[matY][matX]/112)*64,((W2_L2[matY][matX]%112)*64)+64,((W2_L2[matY][matX]/112)*64)+64);
        }
      }
    }
  }
}

void drawBackground_L3() {
  for(int y=0+camX;y<(tiSi*worldSizeY)+camX;y+=tiSi) {
    for(int x=0+camY;x<(tiSi*worldSizeX)+camY;x+=tiSi) {
      int matX = (x-camY)/tiSi;
      int matY = (y-camX)/tiSi;
      if(areaNumber==1){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W1_L3[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W1_L3[matY][matX]%112)*64,(W1_L3[matY][matX]/112)*64,((W1_L3[matY][matX]%112)*64)+64,((W1_L3[matY][matX]/112)*64)+64);
        }
      }
      if(areaNumber==2){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W2_L3[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W2_L3[matY][matX]%112)*64,(W2_L3[matY][matX]/112)*64,((W2_L3[matY][matX]%112)*64)+64,((W2_L3[matY][matX]/112)*64)+64);
        }
      }
    }
  }
}

void drawBackground_L4() {
  for(int y=0+camX;y<(tiSi*worldSizeY)+camX;y+=tiSi) {
    for(int x=0+camY;x<(tiSi*worldSizeX)+camY;x+=tiSi) {
      int matX = (x-camY)/tiSi;
      int matY = (y-camX)/tiSi;
      if(areaNumber==1){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W1_L4[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W1_L4[matY][matX]%112)*64,(W1_L4[matY][matX]/112)*64,((W1_L4[matY][matX]%112)*64)+64,((W1_L4[matY][matX]/112)*64)+64);
        }  
      }
      if(areaNumber==2){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W2_L4[matY][matX]!= -1) {
          image(fullMap,x,y,tiSi,tiSi,(W2_L4[matY][matX]%112)*64,(W2_L4[matY][matX]/112)*64,((W2_L4[matY][matX]%112)*64)+64,((W2_L4[matY][matX]/112)*64)+64);
        } 
      }
    }
  }
}

int animBackCount = -8;
long animBackTime = 0;

void drawBackground_LA() {
  for(int y=0+camX;y<(tiSi*worldSizeY)+camX;y+=tiSi) {
    for(int x=0+camY;x<(tiSi*worldSizeX)+camY;x+=tiSi) {
      int matX = (x-camY)/tiSi;
      int matY = (y-camX)/tiSi;
      if(areaNumber==1){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W1_LA[matY][matX]!= -1) {
          image(animTex,x,y,tiSi,tiSi,((W1_LA[matY][matX] + abs(animBackCount))%24)*64,((W1_LA[matY][matX] + abs(animBackCount))/24)*64,(((W1_LA[matY][matX] + abs(animBackCount))%24)*64)+64,(((W1_LA[matY][matX] + abs(animBackCount))/24)*64)+64);
        }
      }
      if(areaNumber==2){
        if(-tiSi<x && x<width && -tiSi<y && y<height && W2_LA[matY][matX]!= -1) {
          image(animTex,x,y,tiSi,tiSi,((W2_LA[matY][matX] + abs(animBackCount))%24)*64,((W2_LA[matY][matX] + abs(animBackCount))/24)*64,(((W2_LA[matY][matX] + abs(animBackCount))%24)*64)+64,(((W2_LA[matY][matX] + abs(animBackCount))/24)*64)+64);
        }
      }
    }
  }
  if(millis()-animBackTime > 400) {
    animBackTime = millis();
    if(animBackCount==4) {
      animBackCount = -8;
    }
    else{
      animBackCount += 4;
    }
  }
}

int parBack1_Coord = 0;

void drawBackground_P1() {
  parBack1_Coord = 0;
  while(parBack1_Coord + camY/3 < width) {
    image(parBack1,parBack1_Coord + camY/3,camX/3 + 100);
    image(parBack2,parBack1_Coord + camY/3,camX/3 + 100 + parBack1.height);
    image(parBack3,parBack1_Coord + camY/3,camX/3 + 100 - parBack1.height);
    parBack1_Coord+=parBack1.width;
  }
}

void drawText(int _dialogNum){
  if(millis()-textDelay>15 && textPos<dialogTab.getString(NPCDialog,_dialogNum).length()) {
    textPos++;
    textDelay = millis();
  }
  fill(0);
  textSize(1);
  textFont(font);
  text(dialogTab.getString(NPCDialog,_dialogNum).substring(0,textPos),(width/2)-400,height-100,800,height);
}

void drawTB() {
  if(TBup){
    if(boxPosY<160){
      boxPosY += 20;
    }
    else{
      talking=true;
    }
  }
  if(TBup==false){
    talking=false;
    if(boxPosY>0){
        boxPosY -= 20;
    }
  }
  image(textBox1,(width/2)-440,height-boxPosY,880,160);
}
int fadeVal = 0;
int fadeSpeed = 10;

void drawFade() {
  if(fading) {
    if(fadeVal<255){
    fadeVal+=fadeSpeed;
    }
  }else{
    if(fadeVal>0){
    fadeVal-=fadeSpeed;
    playerCoordX=playerNextPtX;
    playerCoordY=playerNextPtY;
    }
  }
  fill(0,fadeVal);
  rect(0,0,width,height);
}