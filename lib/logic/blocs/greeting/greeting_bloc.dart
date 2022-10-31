import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'greeting_event.dart';
part 'greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  GreetingBloc() : super(GreetingInitial()) {
    on<GreetingStart>((event, emit) {
      Timer.periodic(const Duration(seconds: 0), (timer) {
        var hour = DateTime.now().hour;
        if (hour < 12) {
          add(MorningEvent());
        }
        if (hour < 17) {
          add(AfternoonEvent());
        } else {
          add(EveningEvent());
        }
        Future.delayed(
          const Duration(seconds: 30),
        );
      });
    });
    on<MorningEvent>((event, emit) {
      emit(GoodMorning());
    });
    on<AfternoonEvent>((event, emit) {
      emit(GoodAfternoon());
    });
    on<EveningEvent>((event, emit) {
      emit(GoodEvening());
    });
  }
}
