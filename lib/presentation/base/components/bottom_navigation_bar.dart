import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends ConsumerWidget {
  const CustomNavigationBar(
      {super.key,
      required this.currentIndex,
      required this.onDestinationSelected});

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  Future<void> _onDestinationSelected(
      BuildContext context, int index, WidgetRef ref) async {
    ///DO SOMETHING WHEN TAB SELECTED
    onDestinationSelected(index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: NavigationBar(
        height: 62,
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
                currentIndex == 0
                    ? 'assets/icons/home_on.svg'
                    : 'assets/icons/home_off.svg',
                width: 24,
                height: 24),
            label: "홈",
          ),
          NavigationDestination(
              icon: (currentIndex == 1)
                  ? const Icon(Icons.person_search, color: Color(0xFF2A2A2A))
                  : const Icon(Icons.person_search_outlined, color: Color(0xFFDEDAD3)),
              label: "성격유형"),
          NavigationDestination(
              icon: (currentIndex == 2)
                  ? const Icon(Icons.wechat, color: Color(0xFF2A2A2A))
                  : const Icon(Icons.wechat_outlined, color: Color(0xFFDEDAD3)),
              label: "논쟁"),
          NavigationDestination(
              icon: SvgPicture.asset(
                  currentIndex == 3
                      ? 'assets/icons/more_on.svg'
                      : 'assets/icons/more_off.svg',
                  width: 24,
                  height: 24),
              label: "더보기")
        ],
        onDestinationSelected: (index) =>
            _onDestinationSelected(context, index, ref),
      ),
    );
  }
}
