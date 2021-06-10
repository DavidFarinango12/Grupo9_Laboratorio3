/*
*LABORATORIO 3: JUEGO EN PROCESSING
 *NOMBRES: FARINANGO RAFAEL, RUIZ GALO
 *JUEGO: SNAKE
 */

import processing.serial.*;

Serial MiPuerto;

int filas = 30;
int columnas = 30;
int bs = 20;

ArrayList<Integer>posX = new ArrayList<Integer>();
ArrayList<Integer>posY = new ArrayList<Integer>();

int dir = 1;
int dx[] = {0, 0, -1, 1};
int dy[] = {-1, 1, 0, 0};

int applex;
int appley;

boolean gameOver = false;

PFont fuente;

void setup() {
  MiPuerto = new Serial(this, "COM4", 9600);

  size(600, 600);
  posX.add(10);
  posY.add(10);

  frameRate(6);

  applex = (int)random(0, 30);
  appley = (int)random(0, 30);

  fuente = createFont("Pixelmania.ttf", 30);
}

void draw() {
  background(25);
  if (gameOver == true) {
    fill(155);
    textAlign(CENTER);
    //textSize(30);
    textFont(fuente);
    text("GAME OVER", width/2, height/2);
    //text("PRESIONE UNA TECLA \n PARA CONTINUAR", width/2, height/2 +50);
    applex = -1;
    appley = -1;
    posX.clear();
    posY.clear();
    posX.add(-10);
    posY.add(-10);
  } else {
    stroke(50);
    for (int i=0; i<filas; i++) {
      line(0, i*bs, width, i*bs);
    }
    for (int j=0; j<columnas; j++) {
      line(j*bs, 0, j*bs, height);
    }
  }
  drawApple();
  drawSnake();
  mover();
  eat();
  bordes();
  choque();
}

void drawApple() {
  fill(215, 0, 75);
  rect(applex*20, appley*20, bs, bs);
}

void drawSnake() {
  fill(40, 50, 230);
  for (int i=0; i<posX.size(); i++) {
    rect(posX.get(i)*bs, posY.get(i)*bs, bs, bs);
  }
}

void mover() {
  posX.add(0, posX.get(0)+dx[dir]);
  posY.add(0, posY.get(0)+dy[dir]);
  posX.remove(posX.size()-1);
  posY.remove(posY.size()-1);
}

void serialEvent(Serial p) {
  while (MiPuerto.available() == 1) {
    char letra = MiPuerto.readChar();
    print(letra);
    if (letra == 'A') dir = 0;
    if (letra == 'B') dir = 1;
    if (letra == 'I') dir = 2;
    if (letra == 'D') dir = 3;
    if (letra == 'R') {
      restart();
    }
  }
}

//void keyPressed() {
//  if (key == 'w' || keyCode == UP) dir = 0;
//  if (key == 's' || keyCode == DOWN) dir = 1;
//  if (key == 'a' || keyCode == LEFT) dir = 2;
//  if (key == 'd' || keyCode == RIGHT) dir = 3;
//  if (key == ' ') {
//    restart();
//  }
//}

void eat() {
  if ((posX.get(0) == applex) && (posY.get(0)== appley)) {
    applex = (int)random(0, 30);
    appley = (int)random(0, 30);
    posX.add(posX.get(posX.size()-1));
    posY.add(posY.get(posY.size()-1));
  }
}

void bordes() {
  if ((posX.get(0) < 0) || (posX.get(0) > columnas - 1) || (posY.get(0) < 0) || (posY.get(0) > filas - 1)) {
    gameOver = true;
  }
}

void restart() {
  gameOver = false;
  posX.clear();
  posY.clear();
  posX.add(10);
  posY.add(10);
  applex = (int)random(0, 30);
  appley = (int)random(0, 30);
}

void choque() {
  for (int i=2; i<posX.size(); i++) {
    for (int j =2; j<posY.size(); j++) {
      if ((posX.get(0)) == (posX.get(i)) && (posY.get(0) == posY.get(i))) {
        gameOver = true;
      }
    }
  }
}
