import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:select_range_app/main.dart';

typedef IntValueSetter = void Function(int value);
////

class FormWidget extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const FormWidget({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ////
            RangeInput(
              label: "Minumum",
              intValueSetter: (value) => ref.read(randomizerProvider.notifier).setMin(value),
            ),
            ////
            const SizedBox(
              height: 12,
            ),
            ////
            RangeInput(
              label: "Maximum",
              intValueSetter: (value) => ref.read(randomizerProvider.notifier).setMax(value),
            ),
            /////
          ],
        ),
      ),
    );
  }
}

////

class RangeInput extends StatelessWidget {
  final String label;
  final IntValueSetter intValueSetter;
  //setter fieldı: field olarak bir fonksyion kullanmamızı sağlıyor

  const RangeInput({
    super.key,
    required this.label,
    required this.intValueSetter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      ////
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      ////
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      ////
      validator: (value) {
        //eğer bu arkadaş null dönderirse sıkınıt yok demek, eğer bir string dönderirse bu string
        //fieldın altına hata kodu olarak yazdırılıyor
        if (value == null || int.tryParse(value) == null) {
          return "Geçerli Bir Sayı Giriniz";
        } ////
        else {
          return null;
        }
      },
      ////
      onSaved: (value) => intValueSetter(int.parse(value ?? "")),
      //text field değeri değiştiriğinde gelen değerin objenin intValueSetter fonksiyonu tarafından kullanılabilmesini sağladık
      //buna value filling de deniyor
      ////
    );
  }
}
