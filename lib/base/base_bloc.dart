import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends dynamic> {
  BaseBloc({T? state}) {
    _controller = BehaviorSubject<T>();
    if (state != null) {
      _controller.add(state);
    }
  }

  late BehaviorSubject<T> _controller;
  final BehaviorSubject<bool> _loadingController = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _waitingController = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingStream => _loadingController.stream;

  Stream<bool> get waitingStream => _waitingController.stream;

  Stream<T> get stateStream => _controller.stream;

  T? get state {
    if (_controller.hasValue) {
      return _controller.value;
    }
    return null;
  }

  @mustCallSuper
  void dispose() async {
    await _controller.drain();
    await _loadingController.drain();
    await _waitingController.drain();
    _controller.close();
    _loadingController.close();
    _waitingController.close();
  }

  @mustCallSuper
  void onResume() {}

  @mustCallSuper
  void onPause() {}

  @mustCallSuper
  void onDetach() {}

  @mustCallSuper
  void onInactive() {}

  void emit(T state) {
    if (_controller.isClosed) return;
    _controller.sink.add(state);
  }

  void emitError(Object error, [StackTrace? stackTrace]) {
    if (_controller.isClosed) return;
    _controller.sink.addError(error, stackTrace);
  }

  void emitLoading(bool loading) {
    if (_loadingController.isClosed) return;
    _loadingController.sink.add(loading);
  }

  void emitWaiting(bool waiting) {
    if (_waitingController.isClosed) return;
    _waitingController.sink.add(waiting);
  }
}
