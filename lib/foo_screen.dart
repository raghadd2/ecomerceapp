import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FooScreen extends ConsumerWidget {
  const FooScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foo Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("this is title", style: context.text.titleLarge),
          30.hGap,
          Text("this is body", style: context.text.bodyLarge),
          30.hGap,
          Text(
            'Current brightness: ${Theme.of(context).brightness == Brightness.dark ? "Dark" : "Light"}',
          ),
          30.hGap,
          ElevatedButton(
            onPressed: () {
              // Toggle the theme
              if (context.isDark) {
                ref.watch(themeProvider.notifier).changeTheme(ThemeMode.light);
              } else {
                ref.watch(themeProvider.notifier).changeTheme(ThemeMode.dark);
              }

              // Delay the brightness check until after the next frame
              WidgetsBinding.instance.addPostFrameCallback((_) {
                print(
                    "brightness after theme change = ${context.theme.brightness}");
              });
            },
            child: Text(
              "change theme",
              style: context.text.labelLarge,
            ),
          ),
        ],
      )),
    );
  }
}
