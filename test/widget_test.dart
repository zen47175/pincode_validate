// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:pincode_validate/controller/validatePinCode.dart';

void main() {
  group('validatePincode', () {
    test('Validates correct pincodes', () {
      expect(validatePincode('124578'), true);
      expect(validatePincode('111762'), true);
      expect(validatePincode('887712'), true);
    });

    test('Invalidates incorrect pincodes', () {
      expect(validatePincode('123743'), false);
      expect(validatePincode('112233'), false);
      expect(validatePincode('882211'), false);
      expect(validatePincode('118822'), false);
      expect(validatePincode('321895'), false);
    });

    test('Validates length requirement', () {
      expect(validatePincode('17283'), false);
      expect(validatePincode('172839'), true);
    });
  });
}
