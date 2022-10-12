import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Safe city"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    var form = Form.of(context);
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ));
  }
}
