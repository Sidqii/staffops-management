import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BaseUrlController extends GetxController {
  final textInputController = TextEditingController();

  String get url => textInputController.text;

  String get normalize => normalizeUrl(url);

  @override
  void onInit() {
    super.onInit();
  }

  bool validate() {
    final value = url.trim().toLowerCase();

    final uri = Uri.tryParse(value);

    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  String normalizeUrl(String input) {
    var value = input.trim();

    if (value.endsWith('/')) {
      value = value.substring(0, value.length - 1);
    }

    if (value.endsWith('/api')) {
      value = value.substring(0, value.length - 4);
    }

    return value;
  }
}
