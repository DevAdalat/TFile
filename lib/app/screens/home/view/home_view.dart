import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_file/app/screens/home/bloc/home_bloc.dart';
import 'package:t_file/app/widgets/animated_fab.dart';
import 'package:t_file/app/widgets/custom_sliver_appbar.dart';
import 'package:t_file/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        controller: bloc.scrollController,
        slivers: [
          CustomSliverAppBar(
            title: Text(
              l10n.homePageTitle,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            isMainView: true,
          ),
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
                              Icons.folder_rounded,
                              size: 59,
                            ),
                          ),
                          Spacer(),
                          ListTile(
                            title: Text('Folder Name'),
                            subtitle: Text('Size 19MB'),
                          ),
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
          ),
        ],
      ),
      floatingActionButton: CustomFab(
        scrollController: bloc.scrollController,
        label: l10n.homePageUploadButton,
        onPressed: (() async {}),
      ),
    );
  }
}
