// Copyright 2011 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math' as math;

void main() {
  Sunflower();
}

class Color {
  var num;
  
  Color(this.num);
  
  colorString(){
    switch (num) {
      case "0":
        return 'red';
      case "1":
        return 'green';
    default:
      return 'orange';
    }
  }
}

class Sunflower {
  var orange = 'orange';
  static const seedRadius = 2;
  static const scaleFactor = 4;
  static const tau = math.pi * 2;
  static const maxD = 300;

  static final phi = (math.sqrt(5) + 1) / 2;
  static final center = maxD / 2;

  final context = (querySelector('#canvas') as CanvasElement).context2D;

  int d = 0;
  int n = 0;

  Sunflower() {
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

    context.clearRect(0, 0, maxD, maxD);

    for (var i = 0; i < 361; i++) {
      var k =  i * d;
      var r = 150 * math.sin(n*k*math.pi / 180);
      var x = center + r * math.cos(k*math.pi / 180);
      var y = center - r * math.sin(k*math.pi / 180);
      drawSeed(x, y);
    }
  }

  void drawSeed(num x, num y) {
    context
      ..beginPath()
      ..lineWidth = 2
      ..fillStyle = orange
      ..strokeStyle = orange
      ..arc(x, y, seedRadius, 0, tau, false)
      ..fill()
      ..closePath()
      ..stroke();
  }
}