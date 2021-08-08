library shared_utils;

import 'package:bloc/bloc.dart';

import 'bloc_state.dart';

/// base class for all blocs -> provides logging events
abstract class BaseBloc<E> extends Bloc<E, BlocState> {
  BaseBloc() : super(BlocState.initialState());
}
