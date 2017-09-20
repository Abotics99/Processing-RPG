class TRIG {
  
  int trigArea;
  TRIG(int trigger_Area) {
    trigArea = trigger_Area;
  }
  
  boolean triggerPt(int pointX,int pointY) {
    if(dist(pointX,pointY,playerWorldX,playerWorldY)<30 && trigArea==areaNumber){
      return true;
    }
    if(dist(pointX,pointY,playerWorldX,playerWorldY)<40 && changingArea){
      return true;
    }
    else{
      return false;
    }
  }
  
  boolean triggerRect(int pointX1,int pointY1, int pointX2, int pointY2){
    if(playerWorldX>pointX1-5&&playerWorldX<pointX2+5&&playerWorldY>pointY1-5&&playerWorldY<pointY2+5 && trigArea==areaNumber){
      return true;
    }else{
      return false;
    }
  }
  
}