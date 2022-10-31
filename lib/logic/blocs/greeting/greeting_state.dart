part of 'greeting_bloc.dart';

abstract class GreetingState extends Equatable {
  const GreetingState();

  @override
  List<Object> get props => [];
}

class GreetingInitial extends GreetingState {}

class GoodMorning extends GreetingState {}

class GoodAfternoon extends GreetingState {}

class GoodEvening extends GreetingState {}
