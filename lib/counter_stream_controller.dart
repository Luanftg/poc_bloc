import 'dart:async';

enum CounterEvent { increment, decrement }

class CounterStreamController {
  final StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();
  final StreamController<int> _stateController = StreamController<int>();

  int _state = 0;
  int get initialData => _state;
  Stream<int> get stream => _stateController.stream;

  void addEvent(CounterEvent event) {
    _eventController.sink.add(event);
  }

  CounterStreamController() {
    _eventController.stream.listen((event) {
      _handleEvent(event);
    });
  }

  _handleEvent(CounterEvent event) {
    switch (event) {
      case CounterEvent.increment:
        _state++;

      case CounterEvent.decrement:
        _state--;
    }

    _stateController.add(_state);
  }
}
