import 'package:app_library/constant/colors.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
               Container(
                 width: size.width,
                  height: size.height * 0.2 - 27,
                  decoration: const BoxDecoration(
                  color: kDefaultBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)
                  )
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kDefaultBackgroundColor.withOpacity(0.23)
                    )
                  ]
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: TextStyle(
                            color: kDefaultBackgroundColor.withOpacity(0.5),
                           ),
                           enabledBorder: InputBorder.none,
                           focusedBorder: InputBorder.none
                        ),
                    ),
                    ),
                    const Icon(Icons.search,
                    color: kDefaultBackgroundColor,)
                  ],
                ),
              )
              )
            ],
          ),
          color: kDefaultBackgroundColor,
        )
      ],
    );
  }
}
