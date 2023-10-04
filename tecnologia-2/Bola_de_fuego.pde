class BolaDeFuego {

  FWorld mundo;
  Enemigo Enemigo;
  FBox rectangulo1;

  int ancho, alto;
  PImage bola1, bolaH;
  float posRect1X = 680;
  float posRect1Y = 450;
  int tiempo = 1350;
  int tiempoOcurrido;

  float PXC1= enemigo.enemigoCabeza1.getX();
  float PYC1= enemigo.enemigoCabeza1.getY();
  float PXC2= enemigo.enemigoCabeza2.getX();
  float PYC2= enemigo.enemigoCabeza2.getY();
  float PXC3= enemigo.enemigoCabeza3.getX();
  float PYC3= enemigo.enemigoCabeza3.getY();

  BolaDeFuego(int ancho_, int alto_, FWorld mundo, Enemigo Enemigo) {

    ancho=ancho_;
    alto=alto_;
    this.mundo=mundo;
    this.Enemigo=Enemigo;
  }



  void dibujarB1() {

    if (enemigo.estadoC1 == 1) {
      FCircle bola = new FCircle (50);
      bola.setName("bola1"); 
      bola.setPosition(PXC1, PYC1);
      bola1=loadImage("bola.png");
      bola.attachImage(bola1);  
      bola.setGrabbable(true);
      bola.setVelocity(-1000, -100);
      bola1=loadImage("bola.png");
      tiempoOcurrido = millis();
      bola.setGrabbable(false);
      bola.setGroupIndex(-1);
      mundo.add(bola);

      FlamaMusica.play();
    }
  }

  void dibujarB2() {
    if (enemigo.estadoC2 == 1) {
      FCircle bola2 = new FCircle (50);
      bola2.setName("bola2"); 
      bola2.setPosition(PXC2, PYC2 );
      bola2.attachImage(bola1);  //imagen de la flecha
      bola2.setGrabbable(true);
      bola2.setVelocity(-1000, -100);
      tiempoOcurrido = millis();
      bola2.setGrabbable(false);
      bola2.setGroupIndex(-1);
      mundo.add(bola2);
      FlamaMusica.play();
    }
  }

  void dibujarB3() {
    if (enemigo.estadoC3 == 1) {
      FCircle bola3 = new FCircle (50);
      bola3.setName("bola3"); 
      bola3.setPosition(PXC3, PYC3);
      bola3.attachImage(bola1);  //imagen de la flecha
      bola3.setGrabbable(true);
      bola3.setVelocity(-1000, random(50, 150));
      tiempoOcurrido = millis();
      bola3.setGrabbable(false);
      bola3.setGroupIndex(-1);
      mundo.add(bola3);
      FlamaMusica.play();
    }
  }

  void eliminarBola() {    
    ArrayList <FBody> cuerpos = mundo.getBodies();

    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {  
        if (nombre.equals("bola1")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
        if (nombre.equals("bola2")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
        if (nombre.equals("bola3")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
         if (nombre.equals("bolaH")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
      }
    }
  }


  void dividirCirculo(FCircle bola) { //aca voy a crear los hijos de los circulos

    float d = bola.getSize() / 2; //te toma el size del circulo y lo divide x 3
    float x = bola.getX();
    float y = bola.getY();

    mundo.remove(bola);

    for (int i = 0; i < 3; i ++) {
      FCircle hijo = new FCircle( d ); 
      hijo.setPosition( x + random(-d, d), y + random(-d, d));
      hijo.setFill(255, 0, 0);
      bolaH=loadImage("bolaH.png");
      hijo.attachImage(bolaH);
      
      hijo.setName("bolaH");
      mundo.add(hijo);
    }
  }

  //funcion conseguir nombre
  String conseguirNombre(FBody cuerpo) {

    String nombre = "nada";

    if (cuerpo != null) {
      nombre = cuerpo.getName();
    }

    if (nombre == null) {
      nombre = "nada";
    }

    return nombre;
  }
}
