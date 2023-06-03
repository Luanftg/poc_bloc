import 'dart:async';

enum CounterEvent { increment, decrement }

class CounterStreamController {
  StreamController<CounterEvent> eventController =
      StreamController<CounterEvent>();
  StreamController<int> stateController = StreamController<int>();

  int _state = 0;
  int get initialData => _state;
  Stream<int> get stream => stateController.stream;

  CounterStreamController() {
    eventController.stream.listen((event) {
      _handleEvent(event);
    });
  }

  _handleEvent(CounterEvent event) {
    switch (event) {
      case CounterEvent.increment:
        _state++;
        break;
      case CounterEvent.decrement:
        _state--;
        break;
    }
  }
}
