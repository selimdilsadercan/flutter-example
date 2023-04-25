import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

////

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      ////
      appBar: AppBar(
        title: const Text("Randomizer"),
      ),
      ////
      body: Center(
        child: Text(
          randomizer.generatedNumber?.toString() ?? "Enter a Value (${randomizer.min} - ${randomizer.max})",
          style: const TextStyle(fontSize: 42),
        ),
      ),
      ////
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(randomizerProvider.notifier).generateRandomNumber();
        },
        ////
        label: const Text("Generate"),
      ),
      ////
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ////
    );
  }
}
