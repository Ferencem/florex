//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/yellow_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const textColors = [
  Colors.white,
  Colors.yellowAccent,
  //Colors.blueAccent,
  //Colors.green,
  //Colors.purple,
  //Colors.teal
];

const textStyle =
    TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Acme');

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/inapp/bgimage.jpg'),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Várjuk szeretettel!',
                    textStyle: textStyle,
                    colors: textColors,
                  ),
                  //ColorizeAnimatedText(
                    //'Várjuk szeretettel!',
                    //textStyle: textStyle,
                    //colors: textColors,
                  //)
                ],

                isRepeatingAnimation: true,
                repeatForever: false,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 180,
                width: 220,
                child: Image(image: AssetImage('images/inapp/logo.png')),
              ),
              SizedBox(
                height: 55,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Acme'),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Hét vezér u. 59.'),
                      RotateAnimatedText('Vértesi u. 1.'),
                      RotateAnimatedText('Debrecenben'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.all(Radius.circular(40),)),
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Text(
                            '  Beszállítók  ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: const BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.all(Radius.circular(40),)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //AnimatedLogo(controller: _controller),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: YellowButton(
                                      label: 'Belépés',
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/supplier_home');
                                      },
                                      width: 0.4),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: YellowButton(
                                      label: 'Regisztráció',
                                      onPressed: () {},
                                      width: 0.4),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,),
                    ],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(40),)),
                    child: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        '    Vásárlók    ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.all(Radius.circular(40)
                            )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: YellowButton(
                              label: 'Belépés',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                              },
                              width: 0.4),
                        ),
                        YellowButton(
                            label: 'Regisztráció', onPressed: () {}, width: 0.4),
                        //YellowButton(
                          //  label: 'Vásárló', onPressed: () {}, width: 0.27),
                        // AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white38.withOpacity(0.3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GoogleFacebookLogIn(
                        label: 'Google',
                        onPresssed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/google.jpg')),
                      ),
                      GoogleFacebookLogIn(
                        label: 'Facebook',
                        onPresssed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/facebook.jpg')),
                      ),
                      GoogleFacebookLogIn(
                          label: 'Vendég',
                          onPresssed: () {},
                          child: const Icon(
                            Icons.person,
                            size: 55,
                            color: Colors.lightBlueAccent,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0,
          child: child,
        );
      },
      child: const Image(image: AssetImage('images/inapp/logo.png')),
    );
  }
}

class GoogleFacebookLogIn extends StatelessWidget {
  final String label;
  final Function() onPresssed;
  final Widget child;
  const GoogleFacebookLogIn(
      {Key? key,
      required this.child,
      required this.label,
      required this.onPresssed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPresssed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
