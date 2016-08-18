class Star {
  float xpos, ypos ;
  float xpos2, ypos2 ;
  float magnitude ;
  float angle ;
  float mass ;
  
  
  Star() {
    xpos = mouseX ;
    ypos = mouseY ;
    xpos2 = mouseX ;
    ypos2 = mouseY ;
    magnitude = 0 ;
    angle = 0 ;
    mass = 1 ;
  }
  
  //causes the points the gravitate toward the mouse positions
  //got this from this opensource project: http://openprocessing.org/sketch/2363
  //Changed it to work with the shape drawn and the shape gravitates toward the mouse
  void gravitate( Star Z ) {
    float mX, mY, A;
    if( sq( xpos - mouseX ) + sq( ypos - mouseY) != 0 ) {
      //F = mass * Z.mass;
      mX = (xpos+Z.xpos)/2;
      mY = (ypos+Z.ypos)/2;
      A = findAngle( mX - xpos, mY - ypos);
       
      mX =cos(A);
      mY =sin(A);
       
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
       
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = findAngle( mX, mY );
    }
  }
  
  void translate(Star Z) {
    line(xpos, ypos, Z.xpos, Z.ypos) ;
  }
  
  
  
  void update() {
     
    xpos += magnitude * cos(angle);
    ypos += magnitude * sin(angle);
     
  }
  
  //
  void deteriorate() {
    magnitude *= 0.9;
  }
  
  
  void display() {
     line(xpos, ypos, xpos2, ypos2) ;
     xpos2 = xpos ;
     ypos2 = ypos ;
     fill(225, 125) ;
     noStroke() ;
     ellipse(xpos, ypos, 8, 8) ;
  }
 
}

//got this from the same source: http://openprocessing.org/sketch/2363
//finds the angle between the mouse and the star
float findAngle( float x, float y ) {
  float theta;
  if(x == 0) {
    if(y > 0) {
      theta = HALF_PI;
    }
    else if(y < 0) {
      theta = 3*HALF_PI;
    }
    else {
      theta = 0;
    }
  }
  else {
    theta = atan( y / x );
    if(( x < 0 ) && ( y >= 0 )) { theta += PI; }
    if(( x < 0 ) && ( y < 0 )) { theta -= PI; }
  }
  return theta;
}