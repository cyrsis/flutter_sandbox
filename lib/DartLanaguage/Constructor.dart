main() {
  var point = new MyPoint.fact();
}

class MyPoint {

  final String name;
  int x;
  int y;

  MyPoint(this.x, this.y);

  factory MyPoint.fact() {

  }

  MyPoint.zero() :name = "zero " {

  }

  MyPoint.named(this.name, this.x, this.y);


}