int x_max, y_max;
float xpos, ypos = 150;
float xwid = 32.0;
float ywid = 25.0;
float outerxwid = 2.5;
float outerywid = 1.25;
int r, g, b;

// Make array of colors. From http://www.creativecolorschemes.com/resources/free-color-schemes/light-blue-color-scheme.shtml
//teal blue = 168 255 255 | diamond blue = 23 236 236 | yellow = 255 173 47 | green = 169 255 47 | drk blue = 47,86,233 | lgt blue = 174,234,255
int[] colors = {168,255,255,23,236,236,255,173,47,169,255,47,47,86,233,174,234,255};
int color_inc = 0;
int COLOR_STEP = 3;  // rgb
float xoffset, yoffset;
float nextxpos, nextypos;
float t = 0;
float tinc = (2*PI)/375;
float xszdrift, yszdrift, xoutdrift, youtdrift, xwiddrift, ywiddrift = 0.0;
float drift_step = 2;
String xt = "x: ";
String yt = "y: ";

void setup(){
  size(800,800);
  textSize(14);
  x_max = width;
  y_max = height;
  background(255);
  xpos = random(0,x_max);
  ypos = random(0,y_max);
  r = colors[0];
  g = colors[1];
  b = colors[2];
}

void draw(){
  // make offsets on an elliptical arc
  t += tinc;
  if (t > 2*PI) {
    t = 0;
    // outer ellipse size 
    xszdrift = random(0.75,1.25);
    yszdrift = random(0.75,1.25);
    // outer ellipse placement
    xoutdrift = random(0,1.5);
    youtdrift = random(0,1.5);
    // ellipse size 
    xwiddrift = random(0.75,1.25);
    ywiddrift = random(0.75,1.25);
    xpos = width*xoutdrift*0.5;
    ypos = height*youtdrift*0.5;    
    color_inc += COLOR_STEP;
    if (color_inc >= colors.length){
      color_inc = 0;
    }
    r = colors[0+color_inc];
    g = colors[1+color_inc];
    b = colors[2+color_inc];
    
    xwid = xwid*xwiddrift;
    ywid = ywid*ywiddrift;    
  }
  
  // Erase old text
  fill(255);
  stroke(128+64);
  rect(0,0,width,50);
  
  // Create new point
  xoffset = (outerxwid+xszdrift)*cos(t);
  yoffset = (outerywid+yszdrift)*sin(t);
  nextxpos = xpos+xoffset;
  nextypos = ypos+yoffset;
  
  // Present ellipse
  stroke(r,g,b); 
  fill(r,g,b);
  ellipse(nextxpos,nextypos,xwid,ywid);
  xpos = nextxpos;
  ypos = nextypos;
    
  // Draw text labels
  fill(100);
  text(xt,1,15);
  text(yt,1,35);
  // Draw text values
  text(nextxpos,30,15);
  text(nextypos,30,35); 
}