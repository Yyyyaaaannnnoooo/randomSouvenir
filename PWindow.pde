class PWindow extends PApplet {
  PImage imgWin;
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
    imgWin = createImage(img.width, img.height, RGB);
  }

  void settings() {
    size(2560, 2048);
  }

  void setup() {

  }

  void draw() {
    imageMode(CENTER);
    background(0);
    imgWin.resize(height, 0);
    image(imgWin, width / 2, height / 2);
  }
}