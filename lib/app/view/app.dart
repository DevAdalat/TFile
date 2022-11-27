// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:t_file/app/screens/home/home.dart';
import 'package:t_file/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return MaterialApp(
        title: 'TFile',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
      );
    } else {
      return DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) {
          if (lightDynamic == null && darkDynamic == null) {
            return MaterialApp(
              title: 'TFile',
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const HomePage(),
            );
          } else {
            return MaterialApp(
              title: 'TFile',
              theme: ThemeData.from(
                colorScheme: lightDynamic!,
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const HomePage(),
            );
          }
        },
      );
    }
  }
}
