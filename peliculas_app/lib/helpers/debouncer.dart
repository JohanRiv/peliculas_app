import 'dart:async';

class Debouncer<T> {
  Debouncer({required this.duration, this.onValue});

  // Tiempo que se desea esperar antes de emitir un valor
  final Duration duration;

  //  Metodo que se lanza una vez se tiene un valor
  void Function(T value)? onValue;

  // Valor enviado
  T? _value;
  // Funcion de control de Dart
  Timer? _timer;

  T get value => _value!;

  set value(T val) {
    _value = val;
    // Si se recibe un valor se cancela el timer
    _timer?.cancel();
    // Si el timer cumple la duración de tiempo especificada ejecuta la función
    _timer = Timer(duration, () => onValue!(_value!));
  }
}
