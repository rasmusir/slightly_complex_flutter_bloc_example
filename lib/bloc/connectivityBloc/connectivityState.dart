class ConnectivityState {
  ConnectivityState({this.connected});
  factory ConnectivityState.initial() => ConnectivityState(connected: false);
  final bool connected;
}