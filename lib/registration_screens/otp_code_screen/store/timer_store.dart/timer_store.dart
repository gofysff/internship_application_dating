class TimerStateStore {
  TimerStateStore._privateConstructor();
  static final TimerStateStore instance = TimerStateStore._privateConstructor();
  static TimerStateStore get singletoneInstance => instance;
  bool isStarted = false;
}
