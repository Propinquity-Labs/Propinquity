import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:propinquity/presentation/widgets/default_appbar.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return const Scaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: Text("Testa"),
      ),
    );
  }
}
