// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:flutter_task/logic/blocs/internet/internet_bloc.dart';
import 'package:flutter_task/repository/public_api_repository.dart';

import '../../../models/public_api.dart';

part 'public_api_event.dart';
part 'public_api_state.dart';

class PublicApiBloc extends Bloc<PublicApiEvent, PublicApiState> {
  PublicApiRepository publicApiRepository;
  InternetBloc internetBloc;
  late StreamSubscription<InternetState> internetStreamSubscription;
  PublicApiBloc(
    this.publicApiRepository,
    this.internetBloc,
  ) : super(PublicApiInitial()) {
    internetStreamSubscription = internetBloc.stream.listen((internetState) {
      if (internetState is InternetConnected) {
        add(PublicApiStart());
      }
      if (internetState is InternetDisconnected) {
        add(PublicApiLoadingError(msg: internetState.msg));
      }
    });
    on<PublicApiLoading>((event, emit) async {
      emit(PublicApiLoadingState());
      var result = await publicApiRepository.getApiData();
      add(PublicApiLoaded(data: result));
    });
    on<PublicApiLoaded>((event, emit) {
      emit(PublicApiLoadedState(data: event.data));
    });
    on<PublicApiLoadingError>((event, emit) {
      emit(PublicApiLoadingErrorState(msg: event.msg));
    });
    on<PublicApiStart>((event, emit) {
      emit(PublicApiInitial());
    });
  }
  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
