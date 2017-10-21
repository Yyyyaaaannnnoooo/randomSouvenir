import processing.video.*;
Capture video;
PWindow win;
Blob[] blobs = new Blob[10];
PImage img;
color c;
boolean changeMode = false;
void settings() {
  size(640, 480);
  pixelDensity(2);
}
void setup() {
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
  video = new Capture(this, width, height, "USB2.0 PC CAMERA");
  video.start();
  img = createImage(width, height, RGB);
  win = new PWindow();
  frameRate(30);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  //fill(random(255),random(255),random(255));


  if (video.available()) {
    video.read();
    //image(video, 0, 0);
  }
  if (changeMode) {
    pixelPortrait();
  } else {
    blobbyPortrait();
  }
}

void pixelPortrait() {  
  for (int i = 0; i < 30; i++) {
    int groesse=floor(random(5))*10;
    int x = floor(random(width / 10))*10;
    int y=floor(random(height / 10))*10;
    int nx=floor(map(x, 0, width, 0, video.width));
    int ny=floor(map(y, 0, height, 0, video.height));
    c = video.get(nx, ny);
    fill(c);
    rect(x, y, groesse, groesse);
  }
}

void blobbyPortrait() {  
  img.loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      int index = x + y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 10 * b.r / d;
        if (sum > 125)img.pixels[index] = video.pixels[index];//color(sum, 255, 255);
        else img.pixels[index] = color(0);
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  for (Blob b : blobs) {
    b.update();
  }
}


void keyPressed() {
  if (key==' ')changeMode=!changeMode;
  if (key=='s')saveFrame("output.jpg");
  if(key == 'c')win.imgWin = get(0, 0, width * 2, height * 2);
}