import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_resend_timer_provider.g.dart';

@riverpod
class OtpResendTimer extends _$OtpResendTimer {
  Timer? _timer;
  static const int _duration = 30;

  @override
  int build() {
    // Start the timer immediately when the provider is initialized
    _startTimer();

    // Ensure timer is cancelled when provider is disposed
    ref.onDispose(() {
      _timer?.cancel();
    });

    return _duration;
  }

  void _startTimer() {
    state = _duration;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state = state - 1;
      } else {
        timer.cancel();
      }
    });
  }

  void restart() {
    _startTimer();
  }
}
