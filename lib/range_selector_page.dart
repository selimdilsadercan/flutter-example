import 'package:flutter/material.dart';
import 'package:select_range_app/randomizer_page.dart';
import 'package:select_range_app/range_selector_form.dart';

////

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      ////
      body: FormWidget(
        formKey: formKey,
      ),
      ////
      floatingActionButton: FloatingActionButton(
        ////
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            ////
            formKey.currentState?.save();
            ////
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RandomizerPage()));
            ////
          }
        },
        ////
        child: const Icon(Icons.arrow_forward),
        ////
      ),
    );
  }
}
