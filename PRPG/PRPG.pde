boolean[] keys;
String[] W1L1;
String[] W1L2;
String[] W1L3;
String[] W1L4;
String[] W1LA;
String[] WC1;
String[] W2L1;
String[] W2L2;
String[] W2L3;
String[] W2L4;
String[] W2LA;
String[] WC2;
int tiSi = 50;
float playerSpeed = 4;
int areaNumber = 1;

PFont font;
int dialogNum = 0;
boolean nextStep = false;
boolean talkButton = false;
String[] dialog;
boolean talking = false;
boolean talkable;
boolean TBup = false;
int boxPosY = 0;
long textDelay;
int textPos = 0;
Table dialogTab;
boolean pause = false;
boolean collisionOff = false;
boolean fading = false;
int playerNextPtX;
int playerNextPtY;
boolean disableKeys = false;

NPC[] npc;
TRIG[] trigger;

int tileSize;
int worldSizeX = 128;
int worldSizeY = 128;
int texResScale = 4;

int[][] W1_L1 = new int[worldSizeY][worldSizeX];
int[][] W1_L2 = new int[worldSizeY][worldSizeY];
int[][] W1_L3 = new int[worldSizeY][worldSizeX];
int[][] W1_L4 = new int[worldSizeY][worldSizeY];
int[][] W1_LA = new int[worldSizeY][worldSizeY];
int[][] W1_colMap = new int[worldSizeY][worldSizeX];
int[][] W2_L1 = new int[worldSizeY][worldSizeX];
int[][] W2_L2 = new int[worldSizeY][worldSizeY];
int[][] W2_L3 = new int[worldSizeY][worldSizeX];
int[][] W2_L4 = new int[worldSizeY][worldSizeY];
int[][] W2_LA = new int[worldSizeY][worldSizeY];
int[][] W2_colMap = new int[worldSizeY][worldSizeX];
boolean[] A1_Pt = new boolean[100];

void setup() {
  size(1080,640,P2D);
  frameRate(120);
  surface.setResizable(false);
  loadTextures();
  for(int i=0;i<A1_Pt.length;i++){
    A1_Pt[i]=false;
  }
  A1_Pt[1] = true;
  W1L1 = loadStrings("World1TestMaps_Tile Layer 1.csv");
  W1L2 = loadStrings("World1TestMaps_Tile Layer 2.csv");
  W1L3 = loadStrings("World1TestMaps_Tile Layer 3.csv");
  W1L4 = loadStrings("World1TestMaps_Tile Layer 4.csv");
  W1LA = loadStrings("World1TestMaps_Animated.csv");
  WC1 = loadStrings("World1TestMaps_Collisions.csv");
  for(int a=0;a<worldSizeY;a++) {
    W1_L1[a] = int(split(W1L1[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W1_L2[a] = int(split(W1L2[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W1_L3[a] = int(split(W1L3[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W1_L4[a] = int(split(W1L4[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W1_LA[a] = int(split(W1LA[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W1_colMap[a] = int(split(WC1[a], ','));
  }
  W2L1 = loadStrings("World1Rooms_Tile Layer 1.csv");
  W2L2 = loadStrings("World1Rooms_Tile Layer 2.csv");
  W2L3 = loadStrings("World1Rooms_Tile Layer 3.csv");
  W2L4 = loadStrings("World1Rooms_Tile Layer 4.csv");
  W2LA = loadStrings("World1Rooms_Animated.csv");
  WC2 = loadStrings("World1Rooms_Collisions.csv");
  for(int a=0;a<worldSizeY;a++) {
    W2_L1[a] = int(split(W2L1[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W2_L2[a] = int(split(W2L2[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W2_L3[a] = int(split(W2L3[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W2_L4[a] = int(split(W2L4[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W2_LA[a] = int(split(W2LA[a], ','));
  }
  for(int a=0;a<worldSizeY;a++) {
    W2_colMap[a] = int(split(WC2[a], ','));
  }
  trigger = new TRIG[10];
  trigger[0] = new TRIG(2);
  trigger[1] = new TRIG(1);
  npc = new NPC[10];
  npc[0] = new NPC(3,1);
  npc[1] = new NPC(7,1);
  keys=new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  font = loadFont("PressStart2P-16.vlw");
  dialogTab = loadTable("Game Dialog - Sheet1.tsv");
}

int camX = 0;
int camY = 0;
int tileNum;
int playerX = 0;
int playerY = 0;
float stepTime;
int playerDir = 1;
boolean playerMov = false;
int playerWorldX;
int playerWorldY;
boolean collR = true;
boolean collL = true;
boolean collU = true;
boolean collD = true;
int uBuffer = 40;
int dBuffer = -35;
int lBuffer = -10;
int rBuffer = -10;
int colSeperation = 8;
int NPCDialog;
boolean interacting;
boolean interReady;
int NPC_Layer;

void draw() {
  println("NPC Reference: "+playerWorldX+","+playerWorldY);
  println("PlayerCoords: "+playerCoordX+","+playerCoordY);
  println("Player Reference: "+camX+","+camY);
  println("Player on screen: "+playerX+","+playerY);
  println(fading,changingArea,fadeVal,testTrigs());
  background(1);
  doCols();
  drawBackground_P1();
  drawBackground_L1();
  drawBackground_L2();
  drawBackground_LA();
  drawAllNPC(0);
  NPC_Layer=0;
  gameManager();
  if(collisionOff) {
    collL = true;
    collR = true;
    collU = true;
    collD = true;
  }
  drawPlayer();
  NPC_Layer=1;
  drawAllNPC(1);
  drawBackground_L3();
  drawBackground_L4();
  dialogManager();
  drawFade();
  if(talking==false) {
    checkDir();
  }
  stepTime = 1;
  drawTB();
  
  if(talking) {
    drawText(dialogNum);
  }
  if(dialogTab.getString(NPCDialog,dialogNum).length()==0){
    textPos=0;
    dialogNum=0;
    TBup=false;
  }
  testTrigs();
  interactMath();
  fill(112,255);
  textSize(26);
  text(frameRate, 16,43);
}

void dialogManager() {
  if(interacting&&talking){
    if(dialogNum<dialogTab.getColumnCount()-1){
      dialogNum++;
      textPos=0;
    }
    else{
      textPos=0;
      dialogNum=0;
      TBup=false;
    }
  }
  if(interacting&&talking==false){
    talkTo = true;
  }
  else{
    talkTo = false;
  }
  testFullscreen();
}

void testFullscreen() {
  if(width>1080||height>640){
    fill(0);
    rect(0,0,width,height);
  }else{
    
  }
}

void interactMath() {
  if(interact&&interReady){
    interReady = false;
    interacting = true;
  }else{
    interacting=false;
  }
  if(interact==false){
    interacting=false;
    interReady=true;
  }
}

void drawAllNPC(int layer) {
  if(areaNumber==1){
    
  }
}

void doCols() {
  tileNum = 0;
  if(areaNumber==1){
  if(W1_colMap[(playerWorldY+(tiSi-colSeperation)-dBuffer)/tiSi][(playerWorldX+lBuffer)/tiSi]==0 && W1_colMap[(playerWorldY+colSeperation+uBuffer)/tiSi][(playerWorldX+lBuffer)/tiSi]==0){
    collL = true;
  }else{
    collL = false;
  }
  if(W1_colMap[(playerWorldY+(tiSi-colSeperation)-dBuffer)/tiSi][((playerWorldX+tiSi)-rBuffer)/tiSi]==0 && W1_colMap[(playerWorldY+colSeperation+uBuffer)/tiSi][((playerWorldX+tiSi)-rBuffer)/tiSi]==0){
    collR = true;
  }else{
    collR = false;
  }
  if(W1_colMap[(playerWorldY+uBuffer)/tiSi][(playerWorldX+colSeperation+lBuffer)/tiSi]==0 && W1_colMap[(playerWorldY+uBuffer)/tiSi][(playerWorldX+(tiSi-colSeperation)-rBuffer)/tiSi]==0){
    collU = true;
  }else{
    collU = false;
  }
  if(W1_colMap[(playerWorldY+tiSi-dBuffer)/tiSi][(playerWorldX+colSeperation+lBuffer)/tiSi]==0 && W1_colMap[(playerWorldY+tiSi-dBuffer)/tiSi][(playerWorldX+(tiSi-colSeperation)-rBuffer)/tiSi]==0){
    collD = true;
  }else{
    collD = false;
  }
  }
  if(areaNumber==2){
  if(W2_colMap[(playerWorldY+(tiSi-colSeperation)-dBuffer)/tiSi][(playerWorldX+lBuffer)/tiSi]==0 && W2_colMap[(playerWorldY+colSeperation+uBuffer)/tiSi][(playerWorldX+lBuffer)/tiSi]==0){
    collL = true;
  }else{
    collL = false;
  }
  if(W2_colMap[(playerWorldY+(tiSi-colSeperation)-dBuffer)/tiSi][((playerWorldX+tiSi)-rBuffer)/tiSi]==0 && W2_colMap[(playerWorldY+colSeperation+uBuffer)/tiSi][((playerWorldX+tiSi)-rBuffer)/tiSi]==0){
    collR = true;
  }else{
    collR = false;
  }
  if(W2_colMap[(playerWorldY+uBuffer)/tiSi][(playerWorldX+colSeperation+lBuffer)/tiSi]==0 && W2_colMap[(playerWorldY+uBuffer)/tiSi][(playerWorldX+(tiSi-colSeperation)-rBuffer)/tiSi]==0){
    collU = true;
  }else{
    collU = false;
  }
  if(W2_colMap[(playerWorldY+tiSi-dBuffer)/tiSi][(playerWorldX+colSeperation+lBuffer)/tiSi]==0 && W2_colMap[(playerWorldY+tiSi-dBuffer)/tiSi][(playerWorldX+(tiSi-colSeperation)-rBuffer)/tiSi]==0){
    collD = true;
  }else{
    collD = false;
  }
  }
}

int playerCoordX = -204;
int playerCoordY = -911;

void checkDir() {
  if(pause==false && isFading==false){
  if(keys[0]) { //Left
    if(collL){
      if(playerCoordY<(1080-width)/2 && playerX<5){
        playerCoordY+=playerSpeed*stepTime;
        playerMov = true;
        playerX=0;
      }
      else{
        if(playerCoordY>0)camY=0;
        playerMov=true;
        playerX-=playerSpeed*stepTime;
      }
    }
    playerDir=2;
  }
  if(keys[1]) { //Right
    if(collR) {
      if(playerCoordY>(-tiSi*worldSizeX)+width && playerX>-5){
        playerCoordY-=playerSpeed*stepTime;
        playerMov = true;
        playerX=0;
      }
      else{
        if(playerCoordY<(-tiSi*worldSizeX)+width)camY=(-tiSi*worldSizeX)+width;
        playerMov=true;
        playerX+=playerSpeed*stepTime;
      }
    }
    playerDir=3;
  }
  if(keys[2]) { //UP
    if(collU) {
      if(playerCoordX<(640-height)/2 && playerY<5){
        playerCoordX+=playerSpeed*stepTime;
        playerMov = true;
        playerY=0;
      }
      else{
        if(playerCoordX>0)camX=0;
        playerMov=true;
        playerY-=playerSpeed*stepTime;
      }
    }
    playerDir=1;
  }
  if(keys[3]) { //DOWN
    if(collD) {
      if(playerCoordX>(-tiSi*worldSizeY)+height && playerY>-5){
        playerCoordX-=playerSpeed*stepTime;
        playerMov = true;
        playerY=0;
      }
      else{
        if(playerCoordX<(-tiSi*worldSizeY)+height)camX=(-tiSi*worldSizeY)+height;
        playerMov=true;
        playerY+=playerSpeed*stepTime;
      }
    }
    playerDir=0;
  }
  }
  playerWorldX = ((playerX+((width/2)-(tiSi/2)))-camY);
  playerWorldY = ((playerY+((height/2)-(tiSi/2)))-camX);
  camX = playerCoordX+(height-640)/2;
  camY = playerCoordY+(width-1080)/2;
}

void playerGoTo(int X, int Y) {
  if(playerWorldX - X < -5) {
    keys[1]=true;
    keys[0]=false;
  }else{
    keys[1]=false;
  }
  if(playerWorldX - X > 5) {
    keys[0]=true;
    keys[1]=false;
  }else{
    keys[0]=false;
  }
  if(playerWorldY - Y < -5) {
    keys[3]=true;
    keys[2]=false;
  }else{
    keys[3]=false;
  }
  if(playerWorldY - Y > 5) {
    keys[2]=true;
    keys[3]=false;
  }else{
    keys[2]=false;
  }
}

long lastStep;
int stepNum;
boolean stepBack = false;
int characterScale = 2;
int stepSpeed = 200;
void drawPlayer() {
  if(playerDir == 0) {
    if(playerMov) {
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,stepNum*32*texResScale,0,(stepNum+1)*32*texResScale,32*texResScale);
      if(stepNum==2 && stepBack==false){
        stepBack = true;
      }
      if(millis()-lastStep>stepSpeed && stepBack==false){
        stepNum++;
        lastStep=millis();
      }
      if(stepNum==0 && stepBack){
        stepBack = false;
      }
      if(millis()-lastStep>stepSpeed && stepBack){
        stepNum--;
        lastStep=millis();
      }
    }
    else{
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,32*texResScale,0*texResScale,64*texResScale,32*texResScale);
    }
  }
  if(playerDir == 1) {
    if(playerMov) {
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,stepNum*32*texResScale,96*texResScale,(stepNum+1)*32*texResScale,128*texResScale);
      if(stepNum==2 && stepBack==false){
        stepBack = true;
      }
      if(millis()-lastStep>stepSpeed && stepBack==false){
        stepNum++;
        lastStep=millis();
      }
      if(stepNum==0 && stepBack){
        stepBack = false;
      }
      if(millis()-lastStep>stepSpeed && stepBack){
        stepNum--;
        lastStep=millis();
      }
    }
    else{
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,32*texResScale,96*texResScale,64*texResScale,129*texResScale);
    }
  }
  if(playerDir == 2) {
    if(playerMov) {
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,stepNum*32*texResScale,32*texResScale,(stepNum+1)*32*texResScale,64*texResScale);
      if(stepNum==2 && stepBack==false){
        stepBack = true;
      }
      if(millis()-lastStep>stepSpeed && stepBack==false){
        stepNum++;
        lastStep=millis();
      }
      if(stepNum==0 && stepBack){
        stepBack = false;
      }
      if(millis()-lastStep>stepSpeed && stepBack){
        stepNum--;
        lastStep=millis();
      }
    }
    else{
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,32*texResScale,32*texResScale,64*texResScale,64*texResScale);
    }
  }
  if(playerDir == 3) {
    if(playerMov) {
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,stepNum*32*texResScale,64*texResScale,(stepNum+1)*32*texResScale,96*texResScale);
      if(stepNum==2 && stepBack==false){
        stepBack = true;
      }
      if(millis()-lastStep>stepSpeed && stepBack==false){
        stepNum++;
        lastStep=millis();
      }
      if(stepNum==0 && stepBack){
        stepBack = false;
      }
      if(millis()-lastStep>stepSpeed && stepBack){
        stepNum--;
        lastStep=millis();
      }
    }
    else{
      image(player,(width/2)-(tiSi/2*characterScale)+playerX,(height/2)-(tiSi/2*characterScale)+playerY,tiSi*characterScale,tiSi*characterScale,32*texResScale,64*texResScale,64*texResScale,96*texResScale);
    }
  }
}

boolean talkTo;
boolean interact;

void keyPressed()
{
  if(disableKeys==false){
    if(key=='W'||key=='w')
      keys[2]=true;
    if(key=='S'||key=='s')
      keys[3]=true;
    if(key=='A'||key=='a')
      keys[0]=true;
    if(key=='D'||key=='d')
      keys[1]=true;
  }
  if(key=='E'||key=='e')
    interact=true;
  if(key=='C'||key=='c') {
    if(collisionOff){
      collisionOff=false;
    }else{
      collisionOff=true;
    }
  }
}

void keyReleased()
{
  if(disableKeys==false){
    if(key=='W'||key=='w')
      keys[2]=false;
    if(key=='S'||key=='s')
      keys[3]=false;
    if(key=='A'||key=='a')
      keys[0]=false;
    if(key=='D'||key=='d')
      keys[1]=false;
  }
    if(key=='E'||key=='e')
      interact=false;
  playerMov = false;
}