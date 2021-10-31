float mouseAngle;
float antalGren;
float tal;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  background(0);
  stroke(255);
  ellipseMode(CENTER);
  strokeWeight(2);
}

void draw() {
  clear();
  tal = 0;
  lavGren(width/2, height, 200, mouseAngle/20);
  mouseAngle = mouseX-400;
  if (frameCount % 3 == 0) {
    antalGren++;
  }
}

void lavGren(float x, float y, float h, float v) {
  PVector gren = new PVector(0, -h);
  gren.rotate(radians(v));
  line(x, y, x+gren.x, y+gren.y);
  if (h>15) {
    if (tal<=antalGren) {
      tal++;
      lavGren(x+gren.x, y+gren.y, h*0.7, v-25+(mouseAngle/10));
      if (tal<=antalGren) {
        tal++;
        lavGren(x+gren.x, y+gren.y, h*0.7, v+25+(mouseAngle/10));
      }
    }
  } else {
    leaf(x+gren.x, y+gren.y, gren);
  }
}

void leaf(float x, float y, PVector g) {
  push();
    translate(x, y);
    stroke(0);
    rotate(g.heading());
    fill(random(150,225), random(150,255), 0);
    ellipse(0, 0, 20, 10);
  pop();
}
