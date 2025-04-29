import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Circular Progress Indicator'),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          const SizedBox(height: 20),

          const Text('Circular Progress Indicator Controlled'),
          const SizedBox(height: 20),
          _ControrlledProgressIndicator(),
          const SizedBox(height: 20),

          const Text('Linear Progress Indicator'),
          const SizedBox(height: 20),
          const LinearProgressIndicator(
            minHeight: 10,
            backgroundColor: Colors.black45,
          ),
        ],
      ),
    );
  }
}

class _ControrlledProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (i) => (i * 2) / 100,
      ).takeWhile((i) => i <= 1),

      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: progressValue,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
            ],
          ),
        );
      },
    );
  }
}
