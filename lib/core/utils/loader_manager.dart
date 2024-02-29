import 'package:flutter/material.dart';

class LoaderManager {
  static final LoaderManager _instance = LoaderManager._internal();

  factory LoaderManager() => _instance;

  LoaderManager._internal();

  OverlayEntry? _overlayEntry;

  void showLoader(BuildContext context) {
    if (_overlayEntry != null) return; // Loader already shown

    _overlayEntry = OverlayEntry(
      builder: (context) => const LoaderOverlay(),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void dismissLoader() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class LoaderOverlay extends StatelessWidget {
  const LoaderOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black.withOpacity(0.5), // Semi-transparent background
      child: const CircularProgressIndicator(
        color: Colors.deepPurple,
      ),
    );
  }
}
