//import 'package:flutter/cupertino.dart';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:habit_app/app_styles.dart';
import 'package:habit_app/model/onboard_data.dart';
import 'package:habit_app/size_configs.dart';
import 'package:habit_app/widgets/my_text_button.dart';
import 'package:habit_app/widgets/onboard_nav_btn.dart';
import './pages.dart';

import 'sign_up_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(microseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Initialsize config
    SizeConfig().init(context);
    // double? sizeH = SizeConfig.blockSizeH;
    // double? sizeV = SizeConfig.blockSizeV;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: width * 0.2,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: width * 0.2,
                    ),
                    Container(
                      height: width * 0.6,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: kBodyText1,
                        children: [
                          TextSpan(text: 'WE CAN'),
                          TextSpan(
                              text: 'HElP YOU',
                              style: TextStyle(
                                color: kPrimaryColor,
                              )),
                          TextSpan(text: 'TO BE A BETTER'),
                          TextSpan(text: 'VERSION OF'),
                          TextSpan(
                              text: 'YOURSELF',
                              style: TextStyle(
                                color: kPrimaryColor,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: width * 0.1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? MyTextButton(
                          buttonName: 'Get Started',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                    ));
                          },
                          bigColor: kPrimaryColor,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OnBoardNavBtn(
                              name: 'Skip',
                              onPressed: () {},
                            ),
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                            OnBoardNavBtn(
                                name: 'Next',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(microseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }),
                          ],
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



// class OnBoardNavBtn extends StatelessWidget {
//   const OnBoardNavBtn({
//     Key? key,
//     required this.name,
//     required this.onPressed,
//   }) : super(key: key);

//   final String name;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       borderRadius: BorderRadius.circular(6),
//       splashColor: Colors.black12,
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: Text(
//           name,
//           style: kBodyText1,
//         ),
//       ),
//     );
//   }
// }
