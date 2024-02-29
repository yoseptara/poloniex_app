import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogManager {
  static final DialogManager _instance = DialogManager._internal();

  factory DialogManager() => _instance;

  DialogManager._internal();

  bool isShowing = false;

  Future<void> show(
    BuildContext context, {
    String? title,
    VoidCallback? onDismiss,
    required String message,
  }) async {
    if (isShowing == false) {
      isShowing = true;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => PopScope(
          canPop: false,
          child: AlertDialog(
            title: title != null ? Text(title) : null,
            content: Text(message),
            actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    onDismiss?.call();
                  },
                  child: const Text('OK'),
                ),
            ],
          ),
        ),
      );
      isShowing = false;
    }
  }
}
