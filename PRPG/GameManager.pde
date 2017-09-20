
long eventTimer;
boolean isFading;

void gameManager() {
  if(fadeVal>5){
    isFading=true;
  }else{
    isFading=false;
  }
  if(A1_Pt[1]){
    fadeVal = 255;
    fading = true;
    playerNextPtX = -324;
    playerNextPtY = -1211;
    areaNumber = 2;
    NPCDialog = 0;
    TBup=true;
    A1_Pt[1]=false;
    A1_Pt[2]=true;
  }
  if(A1_Pt[2]){
    if(TBup==false) {
      fading=false;
      fadeSpeed = 2;
    }
    if(fadeVal<=0){
      fadeSpeed = 15;
      A1_Pt[2]=false;
      A1_Pt[3] = true;
    }
  }
  if(A1_Pt[3]) {
    if(testTrigs()==5) {
      pause=true;
      NPCDialog = 1;
      TBup=true;
      A1_Pt[3]=false;
      A1_Pt[4]=true;
    }
    if(areaNumber==1){
      npc[0].drawNPCAnim(1797,959,NPC_Layer,3,2);
    }
  }
  if(A1_Pt[4]) {
    if(TBup==false) {
      eventTimer = millis();
      A1_Pt[4]=false;
      A1_Pt[5]=true;
    }
    if(areaNumber==1){
      npc[0].drawNPCAnim(1797,959,NPC_Layer,3,2);
    }
  }
  if(A1_Pt[5]){
    if(millis()-eventTimer>500){
      panDone=false;
      panScreen(-1279,-620);
      if(panDone) {
        A1_Pt[5]=false;
        NPCDialog = 2;
        TBup=true;
        A1_Pt[6]=true;
      }
    }
    if(areaNumber==1){
      npc[0].drawNPCAnim(1797,959,NPC_Layer,3,2);
    }
  }
  if(A1_Pt[6]) {
    if(TBup==false) {
      eventTimer = millis();
      A1_Pt[6]=false;
      A1_Pt[7]=true;
    }
    if(areaNumber==1){
      npc[0].drawNPCAnim(1797,959,NPC_Layer,3,2);
    }
  }
  if(A1_Pt[7]) {
    if(millis()-eventTimer>500){
      panDone=false;
      panScreen(camY-playerX,camX-playerY);
      if(panDone) {
        A1_Pt[7]=false;
        A1_Pt[8]=true;
        pause=false;
      }
    }
    if(areaNumber==1){
      npc[0].drawNPCAnim(1797,959,0,3,2);
    }
  }
  if(A1_Pt[8]) {
    if(testTrigs()==6) {
      pause=true;
      npc[0].drawNPCAnim(playerWorldX,playerWorldY-80,NPC_Layer,3,3);
      if(npc[0].isWalking()==false) {
        A1_Pt[8]=false;
        A1_Pt[9]=true;
      }
    }else{
      if(areaNumber==1){
        npc[0].drawNPCAnim(1797,959,0,3,2);
      }
    }
  }
  if(A1_Pt[9]){
    npc[0].drawNPCAnim(playerWorldX,playerWorldY-80,NPC_Layer,3,3);
    if(TBup==false){
      A1_Pt[9]=false;
      A1_Pt[10]=true;
      eventTimer=millis();
    }
    NPCDialog = 4;
    TBup=true;
  }
  if(A1_Pt[10]){
    if(millis()-eventTimer>500){
      npc[0].drawNPCAnim(1674,1067,NPC_Layer,3,3);
      disableKeys=true;
      pause=false;
      if(dist(npc[0].NPC_X,npc[0].NPC_Y,playerWorldX,playerWorldY)>100){
        playerGoTo(npc[0].NPC_X,npc[0].NPC_Y);
      }else{
        for(int i=0;i<4;i++)keys[i]=false;
      }
      if(npc[0].isWalking()==false){
        A1_Pt[10]=false;
        A1_Pt[11]=true;
      }
    }else{
      npc[0].drawNPCAnim(playerWorldX,playerWorldY-80,NPC_Layer,3,3);
    }
  }
  if(A1_Pt[11]){
    npc[0].drawNPCAnim(1722,755,NPC_Layer,3,3);
    if(dist(npc[0].NPC_X,npc[0].NPC_Y,playerWorldX,playerWorldY)>100){
      playerGoTo(npc[0].NPC_X,npc[0].NPC_Y);
    }else{
      for(int i=0;i<4;i++)keys[i]=false;
    }
    if(npc[0].isWalking()==false){
      A1_Pt[11]=false;
      A1_Pt[12]=true;
      for(int i=0;i<4;i++)keys[i]=false;playerMov = false;
      disableKeys=false;
    }
  }
  if(A1_Pt[12]){
    if(testTrigs()==4){
      pause=true;
      npc[0].drawNPCAnim(766,675,NPC_Layer,1,1);
      playerMov = false;
      eventTimer=millis();
      A1_Pt[12]=false;
      A1_Pt[13]=true;
    }
  }
  if(A1_Pt[13]){
    if(millis()-eventTimer>1000){
      npc[0].drawNPCAnim(860,609,NPC_Layer,3,1);
      A1_Pt[13]=false;
      A1_Pt[14]=true;
      NPCDialog = 5;
      TBup=true;
    }
    else{
      npc[0].drawNPCAnim(860,609,NPC_Layer,0,1);
    }
  }
  if(A1_Pt[14]){
    npc[0].drawNPCAnim(860,609,NPC_Layer,3,1);
    if(TBup==false){
      pause=false;
      disableKeys=true;
      playerSpeed=2;
      playerGoTo(766,675);
      if(dist(playerWorldX,playerWorldY,766,675)<10){
        for(int i=0;i<4;i++)keys[i]=false;playerMov = false;
        disableKeys=false;
        playerDir=3;
        playerSpeed=4;
        A1_Pt[14]=false;
        A1_Pt[15]=true;
      }
    }
  }
  if(A1_Pt[15]){
    npc[0].drawNPCAnim(860,609,NPC_Layer,0,1);
    NPCDialog = 6;
    TBup=true;
    A1_Pt[15]=false;
    A1_Pt[16]=true;
  }
  if(A1_Pt[16]){
    pause=false;
    npc[1].drawNPCAnim(860,609,NPC_Layer,0,1);
    if(testTrigs()==8&&interacting){
      NPCDialog = 8;
      TBup=true;
    }
    if(testTrigs()==9) {
      A1_Pt[16]=false;
      A1_Pt[17]=true;
    }
  }
  if(A1_Pt[17]){
    playerNextPtX = playerCoordX;
    playerNextPtY = playerCoordY;
    if(fadeVal<5){
      fadeVal=6;
    }
    //pause=true;
    //isFading = true;
    changingArea=true;
    fading = true;
    fadeSpeed=2;
    if(fadeVal>=255){
      eventTimer=millis();
      A1_Pt[17]=false;
      A1_Pt[18]=true;
    }
  }
  if(A1_Pt[18]){
    if(millis()-eventTimer>1000){
      NPCDialog = 9;
      TBup=true;
      A1_Pt[18]=false;
      A1_Pt[19]=true;
    }
  }
  if(A1_Pt[19]){
    if(TBup==false){
      exit();
    }
  }
  if(testTrigs()!=0){
    enterWorld(testTrigs());
  }
}

boolean changingArea = false;
boolean panDone = true;
int panSpeed = 5;

void panScreen(int targetX, int targetY) {
  if(panDone==false){
    if(targetX>playerCoordY) {
      playerCoordY+=panSpeed;
      playerX+=panSpeed;
    }
    if(targetX<playerCoordY) {
      playerCoordY-=panSpeed;
      playerX-=panSpeed;
    }
    if(targetY>playerCoordX) {
      playerCoordX+=panSpeed;
      playerY+=panSpeed;
    }
    if(targetY<playerCoordX) {
      playerCoordX-=panSpeed;
      playerY-=panSpeed;
    }
    if(abs(targetY-playerCoordX)<5&&abs(targetX-playerCoordY)<5){
      panDone = true;
    }
  }
}

int testTrigs() {
  if(trigger[0].triggerPt(2074,555)) {
    return(1);
  }
  if(trigger[1].triggerPt(1474,455)) {
    return(2);
  }
  if(trigger[1].triggerPt(1722,755)) {
    return(3);
  }
  if(trigger[0].triggerPt(622,455)) {
    return(4);
  }
  if(trigger[1].triggerRect(1346,655,1494,771)) {
    return(5);
  }
  if(trigger[1].triggerRect(1654,1363,1694,1411)) {
    return(6);
  }
  if(trigger[0].triggerRect(836,677,916,721)) {
    return(7);
  }
  if(trigger[1].triggerPt(3822,703)) {
    return(8);
  }
  if(trigger[1].triggerRect(4202,603,4446,871)) {
    return(9);
  }
  else{
    return(0);
  }
}

void enterWorld(int worldNum) {
  if(pause==false&&disableKeys==false){
  if(worldNum==1&&talking==false){
    if(interacting) changingArea = true;
    if(changingArea && fadeVal<255) fading = true;
    if(changingArea&&fadeVal>255){
      areaNumber=1;
      playerNextPtX = -160;
      playerNextPtY = -959;
      playerDir=0;
      changingArea=false;
    }
  }
  if(worldNum==2&&talking==false){
    if(interacting) changingArea = true;
    if(changingArea && fadeVal<255) fading = true;
    if(changingArea&&fadeVal>=255){
      areaNumber=2;
      playerNextPtX = -260;
      playerNextPtY = -1559;
      playerDir=0;
      changingArea=false;
    }
  }
  if(worldNum==3&&talking==false){
    if(interacting) changingArea = true;
    if(changingArea && fadeVal<255) fading = true;
    if(changingArea&&fadeVal>=255){
      areaNumber=2;
      playerNextPtX = -160;
      playerNextPtY = -107;
      playerDir=0;
      changingArea=false;
    }
  }
  if(worldNum==4&&talking==false){
    if(interacting) changingArea = true;
    if(changingArea && fadeVal<255) fading = true;
    if(changingArea&&fadeVal>=255){
      areaNumber=1;
      playerNextPtX = -460;
      playerNextPtY = -1207;
      playerDir=0;
      changingArea=false;
    }
  }
  if(worldNum==7&&talking==false){
    if(interacting) changingArea = true;
    if(changingArea && fadeVal<255) fading = true;
    if(changingArea&&fadeVal>=255){
      areaNumber=1;
      playerNextPtX = -408;
      playerNextPtY = -3303;
      playerDir=0;
      changingArea=false;
    }
  }
  }
  if(changingArea==false){
    fading=false;
  }
}