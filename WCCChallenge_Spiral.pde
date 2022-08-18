float period = 50;
float r=50;
ArrayList<PVector> ps;

public void setup() {
  size(1080,1080,P2D);
  
  ps = new ArrayList<PVector>();
  for(int i = 0 ; i<50000 ; i++) {
    ps.add(new PVector(random(width),random(height)));
  }
}

public void draw() {
  background(0);
  
  float ang;
  float tx , ty;
  float d;
  blendMode(ADD);
  stroke(255,20);
  strokeWeight(1);
  for(PVector p:ps) {
    d = dist(width/2,height/2,p.x,p.y);
    ang = (noise(p.x*.005,p.y*.005,frameCount*.01)*2*TWO_PI) + (TWO_PI*(d%period)/period) + (frameCount*.1);
    tx = p.x+r*cos(ang);
    ty = p.y+r*sin(ang);
    line(p.x,p.y,tx,ty);
  }
}
