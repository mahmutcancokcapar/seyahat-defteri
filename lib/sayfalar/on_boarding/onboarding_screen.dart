import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seydef/sayfalar/login_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: ((context, index) => OnBoardContent(
                        title: demo_data[index].title,
                        description: demo_data[index].description,
                      )),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          _pageIndex < 2
                              ? _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease)
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(147, 179, 117, 186),
                            shape: const CircleBorder()),
                        child: const Icon(Icons.arrow_right_alt_rounded)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 4,
      height: isActive ? 12 : 4,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(147, 179, 117, 186)
            : Colors.pink.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class OnBoard {
  final String title, description;

  OnBoard({
    required this.title,
    required this.description,
  });
}

// ignore: non_constant_identifier_names
final List<OnBoard> demo_data = [
  OnBoard(
    title: 'Seyahat Defterim',
    description: 'Gittiğiniz yerleri kolayca kaydedin',
  ),
  OnBoard(
    title: 'Seyahat Defterim',
    description: 'İstediğiniz zaman kaydettiğiniz yerlere tekrar ulaşin',
  ),
  OnBoard(
    title: 'Seyahat Defterim',
    description: 'Gittiğiniz yerleri arkadaşlarinizla paylaşin',
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.dancingScript(
            fontSize: 70,
          ),
        ),
        const Spacer(),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.laBelleAurore(
            fontSize: 35,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
