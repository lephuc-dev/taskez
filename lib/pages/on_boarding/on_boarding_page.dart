import 'package:flutter/material.dart';
import '../../router/router.dart';
import '../../resources/resources.dart';
import '../../base/base.dart';
import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';
import 'widgets/on_boarding_content.dart';
import 'widgets/on_boarding_nav_button.dart';

class OnBoardingPage extends StatefulWidget {
  final OnBoardingBloc bloc;

  const OnBoardingPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends BaseState<OnBoardingPage, OnBoardingBloc> {
  final PageController _pageController = PageController(initialPage: 0);

  List<Map<String, String>> onBoardingData = [
    {
      "title": "Welcome to taskez",
      "description": "Whats going to happen tomorrow?",
      "image": VectorImageAssets.img_on_boarding_1,
    },
    {
      "title": "Work happens",
      "description": "Get notified when work happens",
      "image": VectorImageAssets.img_on_boarding_2,
    },
    {
      "title": "Tasks and assign",
      "description": "Tasks and assign them to colleagues",
      "image": VectorImageAssets.img_on_boarding_3,
    },
  ];

  @override
  void initState() {
    super.initState();
    bloc.setIndexPage(0);
  }

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: bloc.state!.indexPage == index ? AppColors.mediumPersianBlue : const Color(0xFFD8D8D8),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: commonAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) => bloc.setIndexPage(value),
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                      title: onBoardingData[index]['title']!,
                      description: onBoardingData[index]['description']!,
                      image: onBoardingData[index]['image']!,
                    )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: StreamBuilder<int?>(
              stream: bloc.indexPageStream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: snapshot.data == onBoardingData.length - 1
                      ? CommonButton(
                          content: "Get Started",
                          onTap: () async => {
                            await bloc.setBoardViewed(),
                            Navigator.pushNamedAndRemoveUntil(context, Routes.signIn, (route) => false),
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OnBoardingNavButton(
                              name: "Skip",
                              onPressed: () async => {
                                await bloc.setBoardViewed(),
                                Navigator.pushNamedAndRemoveUntil(context, Routes.signIn, (route) => false),
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(onBoardingData.length, (index) => dotIndicator(index)),
                            ),
                            OnBoardingNavButton(
                              name: "Next",
                              onPressed: () => _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  OnBoardingBloc get bloc => widget.bloc;
}
