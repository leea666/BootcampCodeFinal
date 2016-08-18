ArrayList<Star> stars ;
ArrayList<Star> copyOfStars ;
int counter = 0 ;
float colour = random(1) ;
int holder = 0 ;
boolean looping = false ;

void setup() {
  size(1000, 700, P3D) ;
  frameRate(40);
  smooth() ;
  stars = new ArrayList<Star>() ;
  copyOfStars = new ArrayList<Star>() ;
  background(0) ;
}

void draw() {
  if(looping == true) {
    background(0) ;
  }
  for (int i = 0; i < stars.size(); i++) {
    Star s1 = stars.get(i) ;
    if((counter == 1 || counter == 2) && mousePressed && mouseButton == LEFT) {
      //if(holder == 0) {
        //s1.translate(new Star()) ;
      //}else if(holder  == 1) {
        s1.gravitate(new Star()) ;
      //}
    } else {
      s1.deteriorate() ; 
    }
    s1. update() ;
    s1.display() ;
      if (i+1 < stars.size()) {
        Star s2 =  stars.get(i+1) ;
        if(holder == 0) {
          stroke(255, 125) ;
        }else if (holder == 1) {
          stroke(0, random(255), random(255), 225) ;
        }else if (holder == 2){
          stroke(random(255), 0, random(255), 225) ;
        }else if(holder == 3) {
          stroke(random(255), random(255), 0, 225) ; 
        }
        strokeWeight(1) ;
        line(s1.xpos, s1.ypos, s2.xpos, s2.ypos) ;
        if (counter == 1) {
          s1 = stars.get(0) ;
          s2 = stars.get(stars.size()-1) ;
          strokeWeight(1) ;
          line(s1.xpos, s1.ypos, 0, s2.xpos, s2.ypos, 0) ;
         } else if (counter == 2) {
           
         }
       }
    }

    for(int j = 0 ; j < copyOfStars.size() ; j++) {
      Star c1 = copyOfStars.get(j) ;
      c1.display() ;
      if (j+1 < copyOfStars.size()) {
        Star c2 =  copyOfStars.get(j+1) ;
        strokeWeight(1) ;
        stroke(255) ;
        line(c1.xpos, c1.ypos, c2.xpos, c2.ypos) ;
        if (counter == 1) {
          c1 = copyOfStars.get(0) ;
          c2 = copyOfStars.get(copyOfStars.size()-1) ;
          strokeWeight(1) ;
          stroke(255) ;
          line(c1.xpos, c1.ypos, 0, c2.xpos, c2.ypos, 0) ;
         } 
       }
   }
}

void mousePressed() {
  if (counter == 0) {
    stars.add(new Star()) ;
    copyOfStars.add(new Star()) ;
  }
}

void keyPressed() {
  if (key == '\n') {
    counter = 1 ;
  }

  if(key == '1') {
     looping = true ; 
  }
  if(key == '2') {
     looping = false ; 
  }
  if(key == '3') {
    background(0) ;
  }
  if(key == '4') {
      holder = 0 ;
  }
  if(key == '5') {
     holder = 1 ; 
  }
  if(key == '6') {
    holder = 2 ;
  }
  if(key == '7') {
    holder = 3 ; 
  }
  if(key == '0') {
     counter = 2 ; 
  }
}