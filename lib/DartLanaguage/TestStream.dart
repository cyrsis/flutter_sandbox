import 'dart:async';

main() {
  //-------- "Single -Subscription" -------
  final StreamController streamController = new StreamController();

  final StreamSubscription subscription =
      streamController.stream.listen((data) => print(data));

  streamController.sink.add('victor victor u are good'); //Sink add is going in

  streamController.sink.add(123);

  streamController.sink
      .add({'a': 'elementA', 'b': 'elementB'}); // works really well

  streamController.sink.add(123.456);

  //-------- "Multiple -Subscription BoastCast  -------

  final StreamController streamMultiple = new StreamController.broadcast();

  final StreamSubscription subscriptionBroadcast = streamMultiple.stream
      .where((value) => (value % 2 == 0))
      .listen((value) => print(value));

  for(int i=1; i<11; i++){
    streamMultiple.sink.add(i);
  }

  streamMultiple.close();

  //-------- Works really well -------
  
}
