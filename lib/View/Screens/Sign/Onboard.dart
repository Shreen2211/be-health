import 'package:flutter/material.dart';

import '../../../ViewModel/utils/image.dart';
import 'Login.dart';

class onboaredingScreen extends StatefulWidget {
  const onboaredingScreen({super.key});

  @override
  State<onboaredingScreen> createState() => _onboaredingScreenState();
}

class _onboaredingScreenState extends State<onboaredingScreen> {
  PageController NewPage = PageController();
  int pageNum = 0;
  List<String> nameIamage = [
    AllImage.onboardingOne,
    AllImage.onboardingTwo,
    AllImage.onboardingThree
  ];

  List<String> Qoute = [
    'Take care of your body. It\'s the only place you have to live in.',
    'It is health that is real wealth and not pieces of gold and silver.',
    'It is health that is real wealth and not pieces of gold and silver.'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xea1a0625),
        body: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              pageNum = value;
            });
          },
          controller: NewPage,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Login();
                        },
                      ));
                    },
                        child: const Text('Skip',style: TextStyle(color: Colors.grey,fontSize: 20)),
                  ),),
                  Image.asset(nameIamage[pageNum]),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Qoute[pageNum],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: pageNum == 0 ? 10 : 5,
                        backgroundColor:
                            pageNum == 0 ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: pageNum == 1 ? 10 : 5,
                        backgroundColor:
                            pageNum == 1 ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: pageNum == 2 ? 10 : 5,
                        backgroundColor:
                            pageNum == 2 ? Colors.white : Colors.grey,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xFFE09C4A),
                    ),
                      onPressed: () {
                        if (pageNum != 2) {
                          NewPage.animateToPage(pageNum + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Login();
                            },
                          ));
                        }
                      },
                      child: pageNum == 2 ? const Text('Get Start') : const Text('Next'))
                ],
              ),
            );
          },
        ));
  }
}
