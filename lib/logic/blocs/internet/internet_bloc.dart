// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    on<CheckInternetEvent>(
      (event, emit) {
        InternetConnectionChecker().onStatusChange.listen((event) {
          if (event == InternetConnectionStatus.connected) {
            add(InternetConnectedEvent());
          }
          if (event == InternetConnectionStatus.disconnected) {
            add(InternetDisconnectedEvent());
          }
        });
      },
    );
    on<InternetConnectedEvent>((event, emit) {
      emit(const InternetConnected(msg: 'Internet Connected'));
    });
    on<InternetDisconnectedEvent>(
      (event, emit) {
        emit(const InternetDisconnected(msg: 'No Internet Connection!'));
      },
    );
  }
}
