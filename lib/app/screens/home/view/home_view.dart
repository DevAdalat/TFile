import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            elevation: 10,
            title: const Text('Files'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
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
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
