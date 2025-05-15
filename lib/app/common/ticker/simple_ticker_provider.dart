
import 'package:flutter/scheduler.dart';


class SimpleTickerProvider implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    if (_ticker != null) {
      return _ticker!;
    }
    _ticker = Ticker(
      onTick,
    );
    return _ticker!;
  }

  void dispose() {
    _ticker = null;
  }
}

mixin SimpleTickerProviderMixin implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    if (_ticker != null) {
      return _ticker!;
    }
    _ticker = Ticker(
      onTick,
    );
    return _ticker!;
  }

  void dispose() {
    _ticker = null;
  }
}