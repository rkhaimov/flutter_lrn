import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddCity extends HookWidget {
  const AddCity({super.key});

  @override
  Widget build(BuildContext context) {
    var city = useTextEditingController();
    var confirmation = useTextEditingController();

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          TextFormField(
            controller: city,
            validator: (value) => value == null || value.isEmpty
                ? "Please, enter something"
                : null,
            decoration: InputDecoration(hintText: "Safe city"),
          ),
          TextFormField(
            controller: confirmation,
            validator: (confirmation) =>
                confirmation != city.text ? "Values must match" : null,
            decoration: InputDecoration(hintText: "City confirmation"),
          ),
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  var form = Form.of(context)!;

                  if (form.validate()) {
                    print("Submit ${city.text}");
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
