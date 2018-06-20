import 'package:flutter_sandbox/Models/SlideDirection.dart';
import 'package:flutter_sandbox/Models/UpdateType.dart';

class SlideUpdate {
  final UpdateType updateType ;

  final  SlideDirection direction;
  final  double slidePercent;

  SlideUpdate(this.updateType, this.direction, this.slidePercent);

}
