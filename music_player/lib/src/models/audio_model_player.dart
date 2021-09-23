import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _playing = false;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);
  late AnimationController _controller;

  AnimationController get controller => this._controller;
  bool get isPlaying => this._playing;
  Duration get songDuration => this._songDuration;
  Duration get current => this._current;
  String get sonTotalDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._current);
  double get percentage => (_songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  set controller(AnimationController value) {
    this._controller = value;
  }

  set isPlaying(bool value) {
    this._playing = value;
    notifyListeners();
  }

  set songDuration(Duration value) {
    this._songDuration = value;
    notifyListeners();
  }

  set current(Duration value) {
    this._current = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitsMinutes:$twoDigitsSeconds';
  }
}
