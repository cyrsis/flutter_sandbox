import 'dart:async';

main() {
  final StreamController streamController = new StreamController();

  final StreamSubscription subscription =
      streamController.stream.listen((data) => print(data));

  streamController.sink.add('victor victor u are good'); //Sink add is going in

  streamController.sink.add(123);

  streamController.sink
      .add({'a': 'elementA', 'b': 'elementB'}); // works really well

  streamController.sink.add(123.456);
}
