import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme/colors.dart';
import 'ui/home/screen.dart';

void main() => runApp(const MyApp());

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    log('[${provider.name ?? provider.runtimeType}] value: $newValue');
    super.didUpdateProvider(provider, newValue);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [ProviderLogger()],
      child: MaterialApp(
        title: 'Dash Punk',
        theme: ThemeData(
          primaryColor: FlutterColors.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
