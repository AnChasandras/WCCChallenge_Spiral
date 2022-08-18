float period = 100;
float r=100;
ArrayList<PVector> ps;

PGraphics pg;

public void setup() {
  size(1080,1080,P2D);
  
  pg = createGraphics(2160,2160,P2D);
  
  ps = new ArrayList<PVector>();
  for(int i = 0 ; i<50000 ; i++) {
    ps.add(new PVector(random(pg.width),random(pg.height)));
  }
}

public void draw() {
  
  float ang;
  float tx , ty;
  float d;
  
  pg.beginDraw();
  
  pg.background(0);
  pg.blendMode(ADD);
  pg.stroke(255,40);
  pg.strokeWeight(1);
  for(PVector p:ps) {
    d = dist(pg.width/2,pg.height/2,p.x,p.y);
    ang = (noise(p.x*.005,p.y*.005,frameCount*.01)*2*TWO_PI) + (TWO_PI*(d%period)/period) + (frameCount*.1);
    tx = p.x+r*cos(ang);
    ty = p.y+r*sin(ang);
    pg.line(p.x,p.y,tx,ty);
  }
  pg.endDraw();
  image(pg,0,0,width,height);
}
