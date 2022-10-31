// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'public_api_bloc.dart';

@immutable
abstract class PublicApiState extends Equatable {}

class PublicApiInitial extends PublicApiState {
  @override
  List<Object?> get props => [];
}

class PublicApiLoadingState extends PublicApiState {
  @override
  List<Object?> get props => [];
}

class PublicApiLoadedState extends PublicApiState {
  final PublicApi data;
  PublicApiLoadedState({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class PublicApiLoadingErrorState extends PublicApiState {
  final String msg;
  PublicApiLoadingErrorState({
    required this.msg,
  });
  @override
  List<Object?> get props => [msg];
}
