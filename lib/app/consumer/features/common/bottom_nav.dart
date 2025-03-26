import 'dart:io';

import 'package:know_go/app/consumer/features/common/coming_soon.dart';
import 'package:know_go/app/consumer/features/home/ui/home.dart';
import 'package:know_go/app/consumer/features/service_info/ui/info_page.dart';
import 'package:know_go/app/utils/alert.dart';
import 'package:know_go/imports/app_imports.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  DateTime? currentBackPressTime;

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return false;
    }
    alert(
      context: context,
      subTitle: 'Are you sure you want to exit?',
      onPressed: () {
        exit(0);
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (currentIndex == 0) {
            onWillPop();
          } else {
            setState(() {
              currentIndex = 0;
            });
            _pageController.jumpToPage(currentIndex);
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                  _pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              children: const [ServicesInfo(), LocalHome(), ComingSoon()],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.appColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: BottomNavigationBar(
                      showUnselectedLabels: false,
                      showSelectedLabels: false,
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.transparent,
                      currentIndex: currentIndex,
                      items: _bottomNavigationBarItem(),
                      selectedItemColor: AppColors.appWhite,
                      unselectedItemColor: AppColors.appDarkGray,
                      onTap: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                        _pageController.jumpToPage(currentIndex);
                      },
                      selectedFontSize: 12,
                      unselectedFontSize: 10,
                      iconSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: AppText(
          title: Texts.info,
          color: AppColors.appWhite,
          fontWeight: FontWeight.w600,
        ),
        icon: Row(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(title: Texts.info, color: AppColors.appGray),
            Image.asset(
              'assets/images/info.png',
              color: AppColors.appGray,
              height: 14,
              width: 14,
            ),
          ],
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: AppText(
          title: Texts.home,
          color: AppColors.appWhite,
          fontWeight: FontWeight.w600,
        ),
        icon: AppText(title: Texts.home, color: AppColors.appGray),
        label: '',
      ),
      BottomNavigationBarItem(
        activeIcon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 2,
          // children: [
          //   AppText(
          //     title: Texts.explore,
          //     color: AppColors.appWhite,
          //     fontWeight: FontWeight.w600,
          //   ),
          //   SvgPicture.asset('assets/images/compass.svg')
          // ],
        ),
        icon: Row(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(title: Texts.explore, color: AppColors.appGray),
            SvgPicture.asset(
              'assets/images/compass.svg',
              color: AppColors.appGray,
              height: 14,
              width: 14,
            ),
          ],
        ),
        label: '',
      ),
    ];
  }
}
