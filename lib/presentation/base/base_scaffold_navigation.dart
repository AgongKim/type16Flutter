

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:type16_project/presentation/base/components/bottom_navigation_bar.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() => _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState extends State<ScaffoldWithNestedNavigation> {

  @override
  void initState() {
    super.initState();
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: widget.navigationShell,
      currentIndex: widget.navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: body,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

