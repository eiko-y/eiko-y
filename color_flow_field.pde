float speed = 200; 
float constant = 0.003;

ArrayList<Particle> particles = new ArrayList(0);

void setup()
{ 
  colorMode(HSB);
  size(720, 720);
  background(0);
  
}

void mouseClicked()
{
  particles.add(new Particle(random(width), random(height)));
}

void draw() {
 // translate(width/2, height/2);
  for (Particle p : particles)
  {
    p.update();
    p.display();
  }
  if (keyPressed)
  {
    for (int w = 0; w< 10; w++) {
    particles.add(new Particle(random(width),random(height)));
    
  }}
    
}
  

class Particle
{ 
  PVector position;
  PVector velocity;
  float noiseValue;
 
  
  Particle(float X, float Y)
  {
    position = new PVector(X,Y);
    velocity = new PVector(0,0);
  }
  
  void update() 
  {
    if (position.x > 0 & position.x< width & position.y > 0 & position.y < height) {
    noiseValue = noise(position.x * constant, position.y * constant);
    velocity = PVector.fromAngle(noiseValue * 2 * PI);
    velocity.setMag(100);
    position.add(PVector.div(velocity, frameRate));
    display();
  }}
  void display() 
  {
    fill(( 1.5 * noiseValue * 255-50) % 255, 255, 255);
    noStroke();
    circle(position.x, position.y, 0.5);
  }
}
