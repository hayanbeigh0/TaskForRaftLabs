part of 'greeting_bloc.dart';

abstract class GreetingEvent extends Equatable {
  const GreetingEvent();

  @override
  List<Object> get props => [];
}

class GreetingStart extends GreetingEvent {}

class GreetingDone extends GreetingEvent {}

class MorningEvent extends GreetingEvent {}

class AfternoonEvent extends GreetingEvent {}

class EveningEvent extends GreetingEvent {}
