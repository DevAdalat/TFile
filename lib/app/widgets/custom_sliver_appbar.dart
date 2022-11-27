import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.isMainView = false,
    this.onBackButtonPressed,
  });
  final Widget title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool isMainView;
  // ignore: inference_failure_on_function_return_type
  final Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 15,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      pinned: true,
      expandedHeight: 150,
      automaticallyImplyLeading: !isMainView,
      flexibleSpace: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withAlpha(50),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(
            bottom: bottom != null ? 16.0 : 14.0,
            left: isMainView ? 20.0 : 55.0,
          ),
          title: title,
        ),
      ),
      leading: isMainView
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
              onPressed:
                  onBackButtonPressed ?? () => Navigator.of(context).pop(),
            ),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.scrolledUnder)
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).canvasColor,
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
