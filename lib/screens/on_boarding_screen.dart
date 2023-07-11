import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/model/on_boarding_page_view.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import '../widget/on_boarding_content.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  List<OnBoardingPageViewModel> pageViewContent = [
    OnBoardingPageViewModel(
        title: "title", subTitle: "subTitle", img: "on_boarding_2"),
    OnBoardingPageViewModel(
        title: "title", subTitle: "subTitle", img: "on_boarding_2"),
    OnBoardingPageViewModel(
        title: "title", subTitle: "subTitle", img: "on_boarding_2"),
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _currentPage = 0;

  double indicatorValue = 1 / 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() => _pageController.nextPage(duration: const Duration(milliseconds: 20), curve: Curves.easeInOutBack,);

  void nextScreen() => Navigator.pushReplacementNamed(context, AppScreens.loginOrRegisterScreen,);

  void setIndicatorValue() {
    switch (_currentPage) {
      case 0:
        indicatorValue = 1 / 3;
        break;
      case 1:
        indicatorValue = 2 / 3;
        break;
      case 2:
        indicatorValue = 3 / 3;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                // physics: ClampingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                    setIndicatorValue();
                  });
                },
                children: const [
                  OnBoardingContent(
                    image: 'on_boarding_1',
                    title: 'Welcome!',
                  ),
                  OnBoardingContent(
                    image: 'on_boarding_2',
                    title: 'Add to cart',
                  ),
                  OnBoardingContent(
                    image: 'on_boarding_3',
                    title: 'Enjoy Purchase!',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 90.h,
              width: 90.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: AppColors.lightGrey,
                    value: indicatorValue,
                    strokeWidth: 10,
                    color: AppColors.primary,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 66.h,
                      width: 66.w,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary,
                              offset: Offset(0, 2),
                              blurRadius: 10,
                            )
                          ]),
                      child: IconButton(
                        onPressed: () => setState(() {
                          indicatorValue += 1 / 3;
                          _currentPage == 2 ? nextScreen() : nextPage();
                        }),
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
