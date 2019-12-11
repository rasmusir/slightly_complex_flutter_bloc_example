import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/connectivityBloc/connectivityState.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityBloc extends Bloc<ConnectivityResult, ConnectivityState> {

  ConnectivityBloc() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(add);
  }

  StreamSubscription _connectivitySubscription;

  @override
  ConnectivityState get initialState => ConnectivityState.initial();

  @override
  Stream<ConnectivityState> mapEventToState(ConnectivityResult event) async* {
    switch (event) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        yield ConnectivityState(connected: true);
        break;
      default:
        yield ConnectivityState(connected: false);
    }
  }

  @override
  Future<void> close() async {
    await _connectivitySubscription?.cancel();
    return super.close();
  }
}