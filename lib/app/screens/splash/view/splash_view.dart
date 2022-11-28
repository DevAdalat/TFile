// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:t_file/app/screens/login/login.dart';
import 'package:t_file/app/screens/splash/bloc/splash_bloc.dart';
import 'package:t_file/app/utils/extention.dart';
import 'package:t_file/l10n/l10n.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Stack(
        children: [
          IntroductionScreen(
            pages: [
              PageViewModel(
                title: l10n.unlimitedCloudStorageTitle,
                body: l10n.unlimitedCloudStorageDesc,
                image: Center(
                  child: Lottie.asset(
                    'assets/lottie/cloud_upload.json',
                    height: 175,
                    animate: true,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PageViewModel(
                title: l10n.extraLayerEncryptionTitle,
                body: l10n.extraLayerEncryptionDesc,
                image: Center(
                  child: Lottie.asset('assets/lottie/secure.json'),
                ),
              ),
              PageViewModel(
                title: l10n.openSourceTitle,
                body: l10n.openSourceDesc,
                image: Center(
                  child: Lottie.asset('assets/lottie/github_logo.json'),
                ),
              ),
            ],
            done: BlocConsumer<SplashBloc, SplashState>(
              listener: (context, state) {
                if (state == SplashState.FinishState) {
                  pushReplacement(
                    context,
                    const LoginPage(
                      isEmailLogin: false,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state == SplashState.InitialState) {
                  return Text(l10n.doneButtonName);
                } else if (state == SplashState.LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Icon(Icons.check);
                }
              },
            ),
            next: Text(l10n.nextButtonTitle),
            onChange: (value) =>
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                context.read<SplashBloc>().emit(SplashState.InitialState),
            // ignore: avoid_returning_null_for_void
            onDone: () {
              context.read<SplashBloc>().startTDLibReceiver();
            },
            dotsDecorator: DotsDecorator(
              size: const Size.square(10),
              activeSize: const Size(20, 10),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ), // RoundedRectangleBorder
            ),
          ),
        ],
      ),
    );
  }
}
