import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Find your favorite food',
    caption:
        'Officia elit eu ex aliquip elit. Amet anim Lorem reprehenderit ex fugiat pariatur laborum voluptate. Ex minim et anim fugiat deserunt amet ex deserunt proident. Eiusmod in nulla velit velit.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Quickly delivery to your home',
    caption:
        'Officia elit eu ex aliquip elit. Amet anim Lorem reprehenderit ex fugiat pariatur laborum voluptate. Ex minim et anim fugiat deserunt amet ex deserunt proident. Eiusmod in nulla velit velit.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Enjoy your food',
    caption:
        'Officia elit eu ex aliquip elit. Amet anim Lorem reprehenderit ex fugiat pariatur laborum voluptate. Ex minim et anim fugiat deserunt amet ex deserunt proident. Eiusmod in nulla velit velit.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController(initialPage: 0);
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('App Tutorial')),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigate to the next screen or perform an action
                context.pop();
              },

              child: const Text('Skip'),
            ),
          ),

          endReached
              ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Start'),
                  ),
                ),
              )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
