import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifier.freezed.dart';

@freezed
class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? generatedNumber,
  }) = _RandomizerState;
}

class RandomizerStateNotifier extends StateNotifier<RandomizerState> {
  RandomizerStateNotifier() : super(const RandomizerState());

  final randomGenerator = Random();

  void generateRandomNumber() {
    state = state.copyWith(
      generatedNumber: randomGenerator.nextInt(state.max - state.min + 1) + state.min,
    );
  }

  void setMin(value) {
    state = state.copyWith(min: value);
  }

  void setMax(value) {
    state = state.copyWith(max: value);
  }
}


//Immutable State Managemeent yaparak bütün değişme duurmlarını tek bir dataclassına bağlamış olduk