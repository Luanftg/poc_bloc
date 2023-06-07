import 'dart:async';

enum CounterEvent { increment, decrement }

class CounterStreamController {
  CounterStreamController() {
    _eventController.stream.listen((event) {
      _handleEvent(event);
    });
  }

  final StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();
  final StreamController<int> _stateController = StreamController<int>();

  int _state = 0;

  int get initialData => _state;
  Stream<int> get stream => _stateController.stream;

  void addEvent(CounterEvent event) {
    _eventController.add(event);
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
    _stateController.add(_state);
  }
}
