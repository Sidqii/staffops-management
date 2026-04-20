import 'package:flutter/widgets.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: child,
    );
  }
}
