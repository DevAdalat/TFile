import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:t_file/app/screens/home/bloc/home_bloc.dart';
import 'package:t_file/app/screens/home/bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Scaffold(
      body: CustomScrollView(
        controller: bloc.scrollController,
        slivers: [
          const CustomSliverAppBar(
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            isMainView: true,
          ),
//        SliverAppBar.large(
//          flexibleSpace: DecoratedBox(
//            decoration: BoxDecoration(
//							color: Theme.of(context).primaryColor.withAlpha(60),
//              borderRadius: const BorderRadius.only(
//                bottomLeft: Radius.circular(27),
//                bottomRight: Radius.circular(27),
//              ),
//            ),
//						child: Container(),
//          ),
//          elevation: 10,
//          shape: const RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//              bottomLeft: Radius.circular(30),
//              bottomRight: Radius.circular(30),
//            ),
//          ),
//        ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    child: SizedBox(
                      child: Column(
                        children: const [
                          Spacer(),
                          Center(
                            child: Icon(
                              Icons.lan,
                              size: 59,
                            ),
                          ),
                          Spacer(),
                          ListTile(
                            title: Text('Folder Name'),
                            subtitle: Text('Size 19MB'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: 30,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )
        ],
      ),
      floatingActionButton: ScrollingFabAnimated(
        color: Theme.of(context).primaryColor,
        radius: 15,
        elevation: 10,
        scrollController: bloc.scrollController,
        text: const Text(
          'Upload',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(
          Icons.upload_rounded,
          color: Colors.white,
        ),
        onPress: () {},
      ),
    );
  }
}

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
  final Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 15,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      pinned: true,
      expandedHeight: 150,
      automaticallyImplyLeading: !isMainView,
      flexibleSpace: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withAlpha(60),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
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
