import processing.sound.SoundFile;

// Parametros bolas
int cx, cy, incx, incy, rad, defaultIncX, defaultIncY, maxIncX, maxIncY, ballIncVelY;

// Sonidos
SoundFile reboundSound;
SoundFile loseSound;

void setupBall() {
  reboundSound = new SoundFile(this,"rebote.mp3");
  loseSound = new SoundFile(this,"lose.mp3");
  
  // Maximos valores de incremeto
  maxIncX = 6;
  maxIncY = 10;
  
  // Caracteristicas bola
  ballIncVelY=3;
  rad = 15*5;
  initBall();
}

void initBall() {
  // Inicializar bola
  cx=width/2;
  cy=height/2;

  calculateDefaultInc();
  incx = defaultIncX;
  incy = defaultIncY;
}

void calculateDefaultInc() {
  // Cambiamos el sentido con el 50% de probabilidad
  if (random(1) <0.5f) {
    defaultIncX = 3 + (int) random(maxIncX);
  } else
    defaultIncX = -3 -(int) random(maxIncX);

  defaultIncY = maxIncY;
 
  
}

void drawBall() {  
  fill(0,255,255);
  stroke(0);
  checkBounds();
  cx=cx+incx;
  cy=cy+incy;
  circle(cx,cy,rad);  
}

void checkBounds() {

  if (cy+rad>height) {
    loseSound.play();
    win = false;
    finish = true;
  }
  else if (cy<rad) {
    reboundSound.play();
    incy *=-1;
    readFaceBound = true;
  }
  else if (cx<rad) {
    reboundSound.play();
    incx *=-1;
  }
  else if (cx+rad>width) {
    reboundSound.play();
    incx*=-1;
  }
}
