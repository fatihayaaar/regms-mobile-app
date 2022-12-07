import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../product/extensions/context_extension.dart';
import '../services/email_validate_service.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../product/network/base/base_service.dart';

class EmailValidateViewModel extends BaseViewModel<EmailValidateService> {
  late Timer _timer;
  late int _start = 120;
  late bool _timerStart = true;
  late bool _g;

  set timer(timer) {
    _timer = timer;
    notifyListeners();
  }

  get timer => _timer;

  set start(start) {
    _start = start;
    notifyListeners();
  }

  get start => _start;

  set timerStart(timerStart) {
    _timerStart = timerStart;
    notifyListeners();
  }

  get timerStart => _timerStart;

  set g(g) {
    _g = g;
    notifyListeners();
  }

  get g => _g;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  EmailValidateViewModel() {
    _g = false;
    startTimer();
  }

  void startTimer() {
    if (timerStart) {
      timerStart = false;
      const oneSec = Duration(seconds: 1);
      timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          if (_start == 0) {
            _g = true;
            _timerStart = true;
            timer.cancel();
          } else {
            _g = false;
            _start--;
          }
        },
      );
    }
  }

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = EmailValidateService(
      networkManager: context!.networkManager,
    );
  }
}
