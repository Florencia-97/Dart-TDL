import 'dart:html';
import 'dart:math' as math;

void main() {
  Sunflower();
}

class Sunflower {
  var color = 'orange';
  static const seedRadius = 2;
  static const scaleFactor = 4;
  static const tau = math.pi * 2;
  static const maxX = 700;
  static const maxY = 500;

  static final phi = (math.sqrt(5) + 1) / 2;

  final context = (querySelector('#canvas') as CanvasElement).context2D;

  int d = 0;
  int n = 0;

  Sunflower(){
    InputElement _n = querySelector('#n');
    InputElement _d = querySelector('#d');

    void updateDFlower() {
      d = int.parse(_d.value);
      drawFrame();
    }

    void updateNFlower() {
      n = int.parse(_n.value);
      drawFrame();
    }

    _n.onChange.listen((_) => updateNFlower());
    _d.onChange.listen((_) => updateDFlower());
  }

  // Draw the complete figure for the current number of seeds.
  void drawFrame() {

    context.clearRect(0, 0, maxX, maxY);

    for (var i = 0; i < 361; i++) {
      var k =  i * d;
      var r = 150 * math.sin(n*k*math.pi / 180);
      var x = 350 + r * math.cos(k*math.pi / 180);
      var y = 250 - r * math.sin(k*math.pi / 180);
      drawSeed(x, y);
    }
  }

  void drawSeed(num x, num y) {
    //Withou cascaede notation
    // context.beginPath();
    // context.lineWidth = 2;
    // context.fillStyle = color; 
    context
      ..beginPath()
      ..lineWidth = 2
      ..fillStyle = color
      ..strokeStyle = color
      ..arc(x, y, seedRadius, 0, tau, false)
      ..fill()
      ..closePath()
      ..stroke();
  }
}