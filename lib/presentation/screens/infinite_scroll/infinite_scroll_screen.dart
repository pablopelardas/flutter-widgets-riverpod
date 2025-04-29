import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = List.generate(5, (index) => index);
  final scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void addFive() {
    debugPrint('Adding 5 more items');
    final lastId = imagesIds.last;
    imagesIds.addAll(List.generate(5, (index) => lastId + index + 1));
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> refreshList() async {
    await Future.delayed(Duration(seconds: 3));
    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFive();
    setState(() {});
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 3));
    if (!isMounted) return;
    addFive();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: refreshList,
          child: ListView.builder(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child:
            isLoading
                ? SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded),
                )
                : const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
