import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roxellytavaresp1/cubit/app_cubits.dart';
import 'package:roxellytavaresp1/widgets/app_large.dart';
import 'package:roxellytavaresp1/widgets/app_text.dart';
import 'package:roxellytavaresp1/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["venice.jpg", "8.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/' + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Vou de Excursão"),
                        AppText(
                          text: "Viaje por nosso app",
                          size: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Aqui você encontra várias opções de excursões de todos os gostos. Navegue por nosso aplicativo e conheça o melhor do mundo!",
                            size: 18,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(children: [
                              ResponsiveButton(
                                width: 120,
                              )
                            ]),
                          ),
                        ),
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(
                                bottom: 2,
                                left: 330,
                              ),
                              width: 6,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? Color(0xFF5d69b3)
                                      : Color(0xFF5d69b3).withOpacity(0.3)),
                            );
                          }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
