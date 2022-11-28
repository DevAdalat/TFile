import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  const CustomFab(
      {super.key, required this.scrollController, required this.label});
  final ScrollController scrollController;
  final String label;

  @override
  State<StatefulWidget> createState() {
    return _CustomFabState();
  }
}

class _CustomFabState extends State<CustomFab> {
  bool isFabExpanded = true;
  @override
  void initState() {
    widget.scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    if (widget.scrollController.position.pixels >
        (widget.scrollController.position.maxScrollExtent * 0.15)) {
      isFabExpanded = false;
    } else {
      isFabExpanded = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: isFabExpanded
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text(widget.label),
              icon: const Icon(Icons.upload_rounded),
            )
          : FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.upload_rounded),
            ),
    );
  }
}
