// Command for RUN
// var p1 = Point(2, 3);
// print('Point p1: (${p1.x}, ${p1.y})');

// var c1 = Credit(4, 5);
// print('Credit c1: (${c1.x}, ${c1.y})');
// var c2 = Credit.origin();
// print('Credit c2: (${c2.x}, ${c2.y})');

// var ip = ImmutablePoint.origin;
// print('ImmutablePoint ip: (${ip.x}, ${ip.y})');

// var ip1 = const ImmutablePoint(6, 7);
// print('ImmutablePoint ip1: (${ip1.x}, ${ip1.y})');

// var ip2 = const ImmutablePoint(1, 7);
// print('ImmutablePoint ip2: (${ip2.x}, ${ip2.y})');

// assert(identical(ip1, ip2));

// var rp1 = RedirectPoint(8, 9);
// print('RedirectPoint rp1: (${rp1.x}, ${rp1.y})');
// var rp2 = RedirectPoint.alongXAxis(10);
// print('RedirectPoint rp2: (${rp2.x}, ${rp2.y})');

// Generative constructors
class Point {
  double x;
  double y;

  Point(this.x, this.y);
}

// Named constructors : Multiple constructors
const double xOrigin = 0;
const double yOrigin = 0;

class Credit {
  final double x;
  final double y;

  Credit(this.x, this.y);

  Credit.origin() : x = xOrigin, y = yOrigin;
}

// Constant constructors
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
  final double x;
  final double y;

  const ImmutablePoint(this.x, this.y);
}

// Redirecting constructors
class RedirectPoint {
  double x;
  double y;

  RedirectPoint(this.x, this.y);

  RedirectPoint.alongXAxis(double x) : this(x, 0); // -> d
}

// Factory constructors
class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}