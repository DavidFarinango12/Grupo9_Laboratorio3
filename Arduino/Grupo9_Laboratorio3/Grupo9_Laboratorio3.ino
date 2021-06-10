/*
  LABORATORIO 3: JUEGO EN PROCESSING
  NOMBRES: FARINANGO RAFAEL, RUIZ GALO
  JUEGO: SNAKE
*/

int led = 7;

int botonArriba = 3;
int botonAbajo = 5;
int botonIzquierda = 2;
int botonDerecha = 4;
int botonReinicio = 6;

boolean bandera1 = false;
boolean bandera2 = false;
boolean bandera3 = false;
boolean bandera4 = false;
boolean bandera5 = false;

void setup() {
  Serial.begin(9600);

  pinMode(botonArriba, INPUT);
  pinMode(botonAbajo, INPUT);
  pinMode(botonIzquierda, INPUT);
  pinMode(botonDerecha, INPUT);
  pinMode(botonReinicio, INPUT);
}

void loop() {
  if (digitalRead(botonArriba) == 0 && bandera1 == false) {
    Serial.println('A');
    bandera1 = true;
  }
  else if (digitalRead(botonArriba) == 1 && bandera1 == true) {
    //Serial.println('a');
    bandera1 = false;
  }
  delay(5);


  if (digitalRead(botonAbajo) == 0 && bandera2 == false) {
    Serial.println('B');
    bandera2 = true;
  }
  else if (digitalRead(botonAbajo) == 1 && bandera2 == true) {
    //Serial.println('b');
    bandera2 = false;
  }
  delay(5);


  if (digitalRead(botonIzquierda) == 0 && bandera3 == false) {
    Serial.println('I');
    bandera3 = true;
  }
  else if (digitalRead(botonIzquierda) == 1 && bandera3 == true) {
    //Serial.println('i');
    bandera3 = false;
  }
  delay(5);


  if (digitalRead(botonDerecha) == 0 && bandera4 == false) {
    Serial.println('D');
    bandera4 = true;
  }
  else if (digitalRead(botonDerecha) == 1 && bandera4 == true) {
    //Serial.println('d');
    bandera4 = false;
  }
  delay(5);


  if (digitalRead(botonReinicio) == 0 && bandera5 == false) {
    Serial.println('R');
    bandera5 = true;
  }
  else if (digitalRead(botonReinicio) == 1 && bandera5 == true) {
    //Serial.println('r');
    bandera5 = false;
  }
  delay(5);


}
