# poc_bloc

A new Flutter project for testing [bloc package](https://pub.dev/packages/flutter_bloc)

This is an exercise from the tutorial [Flutterly - Bloc from zero to hero](https://www.youtube.com/watch?v=toPtm6eyyeE&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o&index=3)

## Concepts

### Cubit

```dart
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```
