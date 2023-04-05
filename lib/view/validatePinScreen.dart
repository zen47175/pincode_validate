import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pincode_validate/controller/validatePinCode.dart';

class PincodeValidator extends StatefulWidget {
  const PincodeValidator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PincodeValidatorState createState() => _PincodeValidatorState();
}

class _PincodeValidatorState extends State<PincodeValidator> {
  TextEditingController pincodeController = TextEditingController();
  String validationResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pincode Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: pincodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Enter pincode',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  validationResult = validatePincode(pincodeController.text)
                      ? 'Valid pincode!'
                      : 'Invalid pincode.';
                });
              },
              child: const Text('Validate'),
            ),
            const SizedBox(height: 16),
            Text(validationResult),
          ],
        ),
      ),
    );
  }
}
