import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a snackbar!'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text(
              'Est labore consequat cupidatat adipisicing eiusmod eu sunt consequat commodo velit commodo nostrud veniam adipisicing. Lorem culpa pariatur elit esse cillum exercitation reprehenderit ad consectetur aliqua magna. Adipisicing consequat nulla nostrud occaecat dolore tempor amet cupidatat ipsum elit. Ut adipisicing voluptate amet duis labore minim duis est amet adipisicing laboris excepteur duis.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Accept'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Magna labore qui laborum do pariatur ut. Ea labore duis tempor cupidatat excepteur velit sit aliqua veniam. Deserunt incididunt sint sit consequat nostrud. Magna elit pariatur do excepteur labore consectetur pariatur consequat. Ad duis quis excepteur et quis et magna sint.',
                    ),
                  ],
                );
              },
              child: const Text('Licenses'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
