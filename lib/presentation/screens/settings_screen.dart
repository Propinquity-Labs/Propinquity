import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

import "../../application/providers/theme_provider.dart";

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return MainLayout(title: "Settings", body: <Widget>[
      Center(
          child: ElevatedButton(
        onPressed: () {
          final mode = ref.read(themeModeProvider.notifier);
          mode.state = mode.state == AppThemeMode.light
              ? AppThemeMode.dark
              : AppThemeMode.light;
        },
        child: const Text("Toggle Theme"),
      ))
    ]);
  }
}
