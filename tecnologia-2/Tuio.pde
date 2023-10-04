class Tuio {

  int estadoPj=0;
  PImage cursor;
  Tuio() {

    //inicializamos la libreria

    cursor=loadImage("cursor.png");
  }

  void ejecutarTuio() {

    //creamos un arraylit de objetos Tuio y con el método .getTuioObjectList()
    // le cargamos los objetos que esté mandando reactivision 
    ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
    //recorremos el arreglo a traves de un for, cuyo tamaño depende del 
    //largo del arreglo empleando tuioObjectList.size()
    for (int i=0; i<tuioObjectList.size (); i++) {
      //en cada ciclo del for creamos un objeto auxiliar de tipo TuioObject y 
      //con get(i) el cargamos el objeto del arreglo
      TuioObject patron = tuioObjectList.get(i);
      stroke(0);
      fill(255);
      pushMatrix();
      //hacemos un translate segun la ubicacion el objeto
      translate(patron.getScreenX(width), patron.getScreenY(height));


      image(cursor, 0, 0, 50, 50);

      popMatrix();
      fill(255, 0, 0);
      //dibujamos el texto segun las coordenadas del patron
      //text(""+patron.getSymbolID(), patron.getScreenX(width), patron.getScreenY(height));



      //SALTO
      if (patron.getScreenY(height)<200) {
        estadoPj=1;
        PosJoystickX=100;
        PosJoystickY=42;
      } 
      //Cubrirse
      if (patron.getScreenY(height)>500) {
        estadoPj=2;
         PosJoystickX=100;
        PosJoystickY=102;
      }

      //Normal
      if ((patron.getScreenY(height)<500) && (patron.getScreenY(height)>200)) {
        estadoPj=0;
         PosJoystickX=100;
        PosJoystickY=72;
      }
      //Disparo
      if ((patron.getScreenX(width)<200)) {
        estadoPj=3;
         PosJoystickX=38;
        PosJoystickY=72;
        
      }



//Inicio
      if (pantalla==0) {
        if ((patron.getScreenX(width)>250)&&(patron.getScreenX(width)<400)&&(patron.getScreenY(height)>350)&& (patron.getScreenY(height)<500)) {
          pantalla=1;
        }
      }
//Perder
      if (pantalla==2) {
        if ((patron.getScreenX(width)>175)&&(patron.getScreenX(width)<275)&&(patron.getScreenY(height)>410)&& (patron.getScreenY(height)<485)) {
          pantalla=0;
        }
      }
//GANAR   
      if (pantalla==3) {
        if ((patron.getScreenX(width)>70)&&(patron.getScreenX(width)<270)&&(patron.getScreenY(height)>400)&& (patron.getScreenY(height)<500)) {
          pantalla=0;
        }
      }
    }
  }
}
