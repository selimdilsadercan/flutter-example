import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'range_selector_page.dart';
import 'notifier.dart';

void main() => runApp(const App());

final randomizerProvider = StateNotifierProvider<RandomizerStateNotifier, RandomizerState>((ref) => RandomizerStateNotifier());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: "Randomizer",
        home: RangeSelectorPage(),
      ),
    );
  }
}
