int numEnemigos=10;
int puntaje = 0;
bichos[] enemigos = new bichos[numEnemigos];
int puntajeMax;
int savedTime;
int totalTime=10000;
boolean jugar = true;
//img
PImage enemigo;
PImage arma;
PImage fondo;
PImage inicio;


void setup(){

size(1000,900);
enemigo = loadImage("araña.png");
arma = loadImage("espatula.png");
fondo= loadImage("fondoMadera.png");
inicio = loadImage("pantallaInicio.png");
savedTime =millis();
for (int i=0; i< enemigos.length;i++){
enemigos [i] = new bichos();
}


}

void draw(){
  
 if (mousePressed == true){ 
   
   jugar = false;
   
 
 }
  if (jugar==true){
 image(inicio,0,0);
 fill(#000000);
 textSize(60);
text ("Haz clic para comenzar a jugar",50,630);
 text ("MAX:"+puntajeMax,380.8,575.8);
 
 }
 
 else{
  image(fondo,0,0);
for (int i=0; i< enemigos.length;i++){
   
  fill (155,50);
  
  enemigos [i].vel();
  enemigos [i].colision();
  enemigos [i].puntaje();
  enemigos[i].gameOver();
 image(arma,mouseX,mouseY);
 }
  
  

}

}
class bichos {
float tw = 117;
float th = 131;
float x=random(1,1000);
float y = random(-100,250);

void vel (){
y=y+8;


image(enemigo,x,y,tw,th);
}

void colision(){
float distancia = dist(mouseX,mouseY,x,y);
if (mousePressed){

if(distancia<tw){
x=random(1000);
y=random(-400,-500);
puntaje++;
puntajeMax = max(puntaje,puntajeMax);

}
}

}
void puntaje (){

fill (#FF4E00);
textSize(40);
text ("Aplastadas= "+puntaje,300,50);
}



void gameOver(){
int tiempoTrans = millis()- savedTime;
if (tiempoTrans>totalTime){
  jugar=true;
puntaje=0;
savedTime=millis();

for(int i=0;i<enemigos.length;i++){
enemigos[i] = new bichos();
}
}
}









}
