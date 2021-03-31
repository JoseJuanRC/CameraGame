import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

Capture cam;
OpenCV opencvFrontal;
Rectangle[] faces;
Rectangle face;
Rectangle lastFace;

float minPlayerSize = 120f;
float minDistanceBetweenFrames = 30f;
boolean readFaceBound= true;

int blur = 30;

void setupFace() {;
  setupCam();
  
  opencvFrontal = new OpenCV(this, cam);
  opencvFrontal.useColor(RGB);
  opencvFrontal.loadCascade(OpenCV.CASCADE_FRONTALFACE); 

}

void setupCam() {
  int numberOfAttempts = 30;
  int con = 0;
  // Camara
  while(con < numberOfAttempts) {
    con++;
    try { 
    cam = new Capture(this, width, height/2);
    cam.start();
    break;
    } catch(IllegalStateException e) {}
  }
  if (cam == null) {
    println("Error, no se ha podido leer la cámara");
    System.exit(1);
  }
}


void drawPlayer() {
  cam.read();
  
  
  noFill();
  stroke(#FF0080);
  strokeWeight(3);
  opencvFrontal.loadImage(cam);
  opencvFrontal.flip(1);
  faces = opencvFrontal.detect();
  opencvFrontal.blur(blur);

  image(opencvFrontal.getSnapshot(),0,height/2);
  if (faces.length>0) {
    face = faces[0];
    if (lastFace == null || (face.width>minPlayerSize && face.height>minPlayerSize) ) {
      rect(face.x, face.y+height/2, face.width, face.height);
      lastFace = face;
    }
    else if (lastFace != null) rect(lastFace.x, lastFace.y+height/2, lastFace.width, lastFace.height);
  
    
  }
  else if (lastFace!=null) rect(lastFace.x, lastFace.y+height/2, lastFace.width, lastFace.height);
  
  
}

float distance(float P1x, float P1y, float P2x, float P2y) {
  return sqrt(pow(P2x-P1x,2)+pow(P2y-P1y,2));
}

void checkFaceWithBall() {
  // Guardamos las posiciones para calcular si tocamos la bola
  float testX = cx;
  float testY = cy;
  int px1 = lastFace.x;
  int py1 = lastFace.y + height/2;
  
  // Calculamos que lado esta más cerca
  if (cx < px1)         testX = px1;     
  else if (cx > px1+lastFace.width) testX = px1+lastFace.width;
  if (cy < py1)         testY = py1; 
  else if (cy > py1+lastFace.height) testY= py1+lastFace.height;   
  

  
  // Si la distancia es menor al radio de la esfera es que estamos dentro
  if (distance(cx,cy, testX, testY)<rad){
    reboundSound.play();
    readFaceBound = false;
    // reboundSound.play();
    // Si la esfera se encuentra por debajo del jugador
    if (px1 + lastFace.width*0.35 > cx) // Si el centro del circulo se encuentra por encima del 20% de la paleta
      incx = -abs(defaultIncX); // Se moverá para arriba siempre
    
    // Si la esfera se encuentra a la derecha o izquierda del jugador
    else if (px1 + lastFace.width*0.65 > cx)
      incx = 0;
    else incx = abs(defaultIncX); // Siempre se moverá para abajo
    
    incy = -abs(incy) - ballIncVelY;

  }
  
}
