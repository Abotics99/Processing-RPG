class NPC {
  int id;
  PImage characterTexture;
  NPC(int _id, int charNum) {
    id = _id;
    if(charNum==0){
      characterTexture = NPC1;
    }
    if(charNum==1){
      characterTexture = NPC2;
    }
  }
  
  int NPCcolRad = 80;
int NPCDir = 0;
long turnTimer = 0;
int yOffset = 0;
int jumpVel = 0;

boolean isWalking() {
  if(walkDone) {
    return false;
  }else{
    return true;
  }
}

int NPC_X(){
  return NPC_X;
}

int NPC_Y(){
  return NPC_Y;
}

void drawNPCAnim(int X, int Y, int layer, int direction, int anim) { //Animations: 1= look(0:down1:right2:up3:left),2=jump,3=goTo
  if(anim!=3) {
    NPC_X=X;
    NPC_Y=Y;
    NPCDir = direction;
  }
  if(anim==3){
    if(abs(NPC_X - X)<5 && abs(NPC_Y - Y)<5) {
      walkDone = true;
      stepNumber=1;
    }else{
      walkDone = false;
    }
    if(walkDone == false && dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)>NPCcolRad && talking == false) {
    if(NPC_X - X < 0) {
      NPC_X+=playerSpeed;
      NPCDir = 1;
    }
    if(NPC_X - X > 0) {
      NPC_X-=playerSpeed;
      NPCDir = 3;
    }
    if(NPC_Y - Y < 0) {
      NPC_Y+=playerSpeed;
      NPCDir = 0;
    }
    if(NPC_Y - Y > 0) {
      NPC_Y-=playerSpeed;
      NPCDir = 2;
    }
    if(dist(lastPoint_X,lastPoint_Y,NPC_X,NPC_Y) > 30) {
      lastPoint_X = NPC_X;
      lastPoint_Y = NPC_Y;
      if(stepNumber > 1) {
        stepNumber = -1;
      }
      else{
        stepNumber++;
      }
    }
    }
  }
  if(dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)<NPCcolRad && collisionOff==false){
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-45){
      collU=false;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<135){
      collL=false;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>135||atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-135){
      collD=false;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-135){
      collR=false;
    }
  }
  if(dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)<NPCcolRad+3){
    talkable=true;
  }
  else{
    talkable=false;
  }
  if(dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)<NPCcolRad+1&&(key=='E'||key=='e')) {
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-45){
      NPCDir=0;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<135){
      NPCDir=1;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>135||atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-135){
      NPCDir=2;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-135){
      NPCDir=3;
      NPCDialog = id;
    }
  }
  if((layer==1&&NPC_Y>playerWorldY)||layer==0) {
    if(NPCDir==0){
      image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y+yOffset,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),0,(32*texResScale)+(128*abs(stepNumber)),32*texResScale);
    }
    if(NPCDir==1){
      image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y+yOffset,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),64*texResScale,(32*texResScale)+(128*abs(stepNumber)),96*texResScale);
    }
    if(NPCDir==2){
      image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y+yOffset,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),96*texResScale,(32*texResScale)+(128*abs(stepNumber)),128*texResScale);
    }
    if(NPCDir==3){
      image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y+yOffset,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),32*texResScale,(32*texResScale)+(128*abs(stepNumber)),64*texResScale);
    }
    if(talkTo&&talkable) {
      TBup=true;
    }
  }
  if(anim==2){
    yOffset+=jumpVel;
    jumpVel+=1;
    if(yOffset>=0){
      jumpVel=0;
    }
    if(millis()-turnTimer>200 && random(100)<10) {
      turnTimer=millis();
      jumpVel=-4;
    }
  }
}

void drawNPC(int X,int Y, int layer) {
  if(dist(X,Y,playerWorldX,playerWorldY)<NPCcolRad && collisionOff==false){
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<45&&atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>-45){
      collU=false;
    }
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>45&&atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<135){
      collL=false;
    }
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>135||atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<-135){
      collD=false;
    }
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<-45&&atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>-135){
      collR=false;
    }
  }
  if(dist(X,Y,playerWorldX,playerWorldY)<NPCcolRad+3){
    talkable=true;
  }
  else{
    talkable=false;
  }
  if(dist(X,Y,playerWorldX,playerWorldY)<NPCcolRad+1&&(key=='E'||key=='e')) {
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<45&&atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>-45){
      NPCDir=0;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>45&&atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<135){
      NPCDir=1;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>135||atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<-135){
      NPCDir=2;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)<-45&&atan2(playerWorldX-X,playerWorldY-Y)*(180/PI)>-135){
      NPCDir=3;
      NPCDialog = id;
    }
  }
  if((layer==1&&Y>playerWorldY)||layer==0) {
  if(NPCDir==0){
    image(characterTexture,camY-(tiSi*characterScale/4)+X, camX-(tiSi*characterScale/4)+Y,tiSi*characterScale,tiSi*characterScale,32*texResScale,0,64*texResScale,32*texResScale);
  }
  if(NPCDir==1){
    image(characterTexture,camY-(tiSi*characterScale/4)+X, camX-(tiSi*characterScale/4)+Y,tiSi*characterScale,tiSi*characterScale,32*texResScale,64*texResScale,64*texResScale,96*texResScale);
  }
  if(NPCDir==2){
    image(characterTexture,camY-(tiSi*characterScale/4)+X, camX-(tiSi*characterScale/4)+Y,tiSi*characterScale,tiSi*characterScale,32*texResScale,96*texResScale,64*texResScale,128*texResScale);
  }
  if(NPCDir==3){
    image(characterTexture,camY-(tiSi*characterScale/4)+X, camX-(tiSi*characterScale/4)+Y,tiSi*characterScale,tiSi*characterScale,32*texResScale,32*texResScale,64*texResScale,64*texResScale);
  }
  if(talkTo&&talkable) {
    TBup=true;
  }
  }
  if(random(0,1)<0.01 && millis() - turnTimer > 1000 && talking == false) {
    NPCDir = round(random(0,3));
    turnTimer = millis();
  }
}

int stepNumber = 0;
int lastPoint_X;
int lastPoint_Y;
long walkTimer = 0;
boolean walkDone = false;
int targetPointX;
int targetPointY;
int NPC_X;
int NPC_Y;

void drawNPCW(int X,int Y, int X2, int Y2, int layer) {
  if(dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)<NPCcolRad && collisionOff==false){
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-45){
      collU=false;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<135){
      collL=false;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>135||atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-135){
      collD=false;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-135){
      collR=false;
    }
  }
  if(dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)<NPCcolRad+3){
    talkable=true;
  }
  else{
    talkable=false;
  }
  if(dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)<NPCcolRad+1&&(key=='E'||key=='e')) {
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-45){
      NPCDir=0;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<135){
      NPCDir=1;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>135||atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-135){
      NPCDir=2;
      NPCDialog = id;
    }
    if(atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)<-45&&atan2(playerWorldX-NPC_X,playerWorldY-NPC_Y)*(180/PI)>-135){
      NPCDir=3;
      NPCDialog = id;
    }
  }
  if((layer==1&&NPC_Y>playerWorldY)||layer==0) {
  if(NPCDir==0){
    image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),0,(32*texResScale)+(128*abs(stepNumber)),32*texResScale);
  }
  if(NPCDir==1){
    image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),64*texResScale,(32*texResScale)+(128*abs(stepNumber)),96*texResScale);
  }
  if(NPCDir==2){
    image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),96*texResScale,(32*texResScale)+(128*abs(stepNumber)),128*texResScale);
  }
  if(NPCDir==3){
    image(characterTexture,camY-(tiSi/4*characterScale)+NPC_X, camX-(tiSi/4*characterScale)+NPC_Y,tiSi*characterScale,tiSi*characterScale,(texResScale)+(128*abs(stepNumber)),32*texResScale,(32*texResScale)+(128*abs(stepNumber)),64*texResScale);
  }
  if(talkTo&&talkable) {
    TBup=true;
  }
  }
  if(random(0,1)<0.01 && millis() - walkTimer > 1000 && walkDone) {
    targetPointX = round(random(X,X2));
    targetPointY = round(random(Y,Y2));
    lastPoint_X = NPC_X;
    lastPoint_Y = NPC_Y;
    walkDone = false;
    walkTimer = millis();
  }
  if(dist(NPC_X,NPC_Y,targetPointX,targetPointY)>dist(X,Y,X2,Y2)){
    NPC_X=(X+X2)/2;
    NPC_Y=(Y+Y2)/2;
  }
  if(walkDone) {
    stepNumber=1;
  }
  if(walkDone == false && dist(NPC_X,NPC_Y,playerWorldX,playerWorldY)>NPCcolRad && talking == false) {
    if(NPC_X - targetPointX < 0) {
      NPC_X+=1;
      NPCDir = 1;
    }
    if(NPC_X - targetPointX > 0) {
      NPC_X-=1;
      NPCDir = 3;
    }
    if(NPC_Y - targetPointY < 0) {
      NPC_Y+=1;
      NPCDir = 0;
    }
    if(NPC_Y - targetPointY > 0) {
      NPC_Y-=1;
      NPCDir = 2;
    }
    if(NPC_X == targetPointX && NPC_Y == targetPointY) {
      walkDone = true;
    }
    if(dist(lastPoint_X,lastPoint_Y,NPC_X,NPC_Y) > 30) {
      lastPoint_X = NPC_X;
      lastPoint_Y = NPC_Y;
      if(stepNumber > 1) {
        stepNumber = -1;
      }
      else{
        stepNumber++;
      }
    }
  }
}
  
}