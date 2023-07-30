import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("change to $change");
  }

  @override
  void onClose(BlocBase bloc) {
   debugPrint("close to $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
   debugPrint("create to $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {

  }

  @override
  void onEvent(Bloc bloc, Object? event) {

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
 
  }
}
