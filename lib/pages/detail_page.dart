import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roxellytavaresp1/cubit/app_cubit_states.dart';
import 'package:roxellytavaresp1/cubit/app_cubits.dart';
import 'package:roxellytavaresp1/widgets/app_buttons.dart';
import 'package:roxellytavaresp1/widgets/app_large.dart';
import 'package:roxellytavaresp1/widgets/app_text.dart';
import 'package:roxellytavaresp1/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/" +
                                detail.place.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 70,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$" + detail.place.price.toString(),
                              color: Colors.blueGrey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.location,
                              size: 18,
                              color: Colors.blueGrey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < detail.place.stars
                                      ? Colors.deepOrangeAccent
                                      : Colors.grey,
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(5.0)",
                              size: 18,
                              color: Colors.blueGrey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: "Pessoas",
                          color: Colors.black54.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Número de pessoas",
                          size: 20,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                            children: List.generate(5, (index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 45,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  text: (index + 1).toString(),
                                ),
                              ));
                        })),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Descrição",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: Colors.blueGrey,
                          size: 16,
                        )
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: Colors.blueGrey,
                        backgroundColor: Colors.white,
                        borderColor: Colors.blueGrey,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
