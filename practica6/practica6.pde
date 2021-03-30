import processing.sound.SoundFile;

boolean finish = false, win = false;

boolean intro = true;
PFont f;

// Sonidos
SoundFile winSound;

void setup() {
  size(640,960); 
  winSound = new SoundFile(this,"victory.mp3");
  background(0,0,255);
  
  
  setupFace();
  setupBall();
  setupRects();
  intro();
}

void draw() {
  if (!intro && !finish){
    if (cam.available()) {
      background(0);
      drawPlayer();
      if (readFaceBound && lastFace!= null) checkFaceWithBall();
      drawBall();
      checkRectBounds();
      drawRects();
    }
  }else if (!intro) {
    fill(255);
    stroke(255);
    background(0);
    textAlign(CENTER);
    f = createFont("Arial",40,true); 
    textFont(f);
    if (win) {
      text("Has ganado!",width/2,height/2); 
    }else
      text("Has perdido!",width/2,height/2); 
    
    
    f = createFont("Arial",16,true); 
    textFont(f);
    text("Pulsa r para resetear",width/2,height/1.8); 
  }
}

void intro() {
  background(0);
  textAlign(CENTER);
  f = createFont("Arial",40,true); 
  textFont(f);
  text("Elimina todos los rectángulos!",width/2,height/8); 
  
  textAlign(CENTER);
  f = createFont("Arial",28,true); 
  textFont(f);
  text("Controles",width/2,height/3.8); 
  textAlign(LEFT);
  f = createFont("Arial",20, true); 
  textFont(f);
  text("r:                   Resetear",width/20,height/2.4);  
  text("Cabeza:        Mover al jugador (cuadrado)",width/20,height/2.2);  
  text("UP/DOWN:   Cambiar el difuminado de la cámara",width/20,height/2.05);  

  
  textAlign(CENTER);
  f = createFont("Arial",18,true); 
  textFont(f);
  text("Pulsa enter para continuar",width/2,height/1.25); 

  
  textAlign(LEFT);
  f = createFont("Arial",14,true); 
  textFont(f);
  text("Hecho por: José Juan Reyes Cabrera",0,height/1.02); 
}
void keyPressed() {
  if (key=='r' || key=='R') {
    //Reset
    fill(255);
    stroke(255);
    setupBall();
    setupRects();
    finish = false;
    intro = true;
    blur = 30;
    readFaceBound = true;
    intro();
  }
  if (keyCode == UP) blur = (min(blur + 4, 50));
  if (keyCode == DOWN) blur = max(blur-4,1);
  if (keyCode == ENTER) intro = false;
}

public void stop(){
  cam.stop();
  reboundSound.stop();
  pointSound.stop();
  winSound.stop();
  super.stop();
}
