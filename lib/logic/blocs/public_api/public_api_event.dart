// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'public_api_bloc.dart';

@immutable
abstract class PublicApiEvent extends Equatable {}

class PublicApiLoading extends PublicApiEvent {
  @override
  List<Object?> get props => [];
}

class PublicApiLoaded extends PublicApiEvent {
  final PublicApi data;
  PublicApiLoaded({
    required this.data,
  });
  @override
  List<Object?> get props => [];
}

class PublicApiLoadingError extends PublicApiEvent {
  final String msg;
  PublicApiLoadingError({
    required this.msg,
  });
  @override
  List<Object?> get props => [msg];
}

class PublicApiStart extends PublicApiEvent {
  @override
  List<Object?> get props => [];
}
