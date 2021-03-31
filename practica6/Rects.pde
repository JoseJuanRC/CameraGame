import java.util.ArrayList;
import processing.sound.SoundFile;

ArrayList<Integer> pointX;
ArrayList<Integer> pointY;

int number= 2;
float squareSize = 80;

// Sonidos
SoundFile pointSound;

void setupRects() {
  pointSound= new SoundFile(this,"score.mp3");
  pointX = new ArrayList<Integer>();
  pointY = new ArrayList<Integer>();
  for (int i = 0; i<number; i++) {
    for (int j = 0; j< number; j++) {
      pointX.add((int) (width/number/2-squareSize/2+i*width/(number)));
      pointY.add(height/20 + j*height/(number*2));
    }
  }
  
}

void drawRects() {
  fill(255,0,255);
  stroke(255,0,255);

  for (int i = 0; i<pointX.size(); i++){
    rect(pointX.get(i), pointY.get(i), squareSize, squareSize/2);
  }
}

void checkRectBounds() {
  for (int i = pointX.size()-1; i>=0; i--) {
    // Guardamos las posiciones para calcular si tocamos la bola
    float testX = cx;
    float testY = cy;
    int px1 = pointX.get(i);
    int py1 = pointY.get(i);
    
    // Calculamos que lado esta más cerca
    if (cx < px1)         testX = px1;     
    else if (cx > px1+squareSize) testX = px1+squareSize;
    if (cy < py1)         testY = py1; 
    else if (cy > py1+squareSize/2) testY= py1+squareSize/2;   
    
  
    
    // Si la distancia es menor al radio de la esfera es que estamos dentro
    if (distance(cx,cy, testX, testY)<rad/2) {
      pointSound.play();
      pointX.remove(i);
      pointY.remove(i);
    }
      
  }
  
  if (pointX.size() == 0) {
    winSound.play();
    finish = true;
    win = true;
  }
}
