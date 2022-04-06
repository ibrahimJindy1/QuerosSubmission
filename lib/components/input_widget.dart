import 'package:flutter/material.dart';

import '../utilis/dimensions.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController password;
  final bool isPassword;
  final String hintText;
  const InputWidget(
      {Key? key,
      required this.password,
      required this.isPassword,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions().widthFactor(10)),
      child: Container(
        color: Color(0xFFf7f7f7),
        width: Dimensions().widthFactor(300),
        height: Dimensions().heightFactor(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: Dimensions().heightFactor(60),
                child: const DecoratedBox(
                  decoration: const BoxDecoration(color: Color(0xff0a7ef5)),
                ),
              ),
            ),
            SizedBox(
              width: Dimensions().widthFactor(2),
            ),
            Expanded(
              flex: 80,
              child: Center(
                child: TextField(
                  controller: password,
                  maxLines: 1,
                  obscureText: isPassword,
                  style: TextStyle(
                    color: Color(0xff9e9e9e),
                    fontSize: Dimensions().heightFactor(18),
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Color(0xff9e9e9e),
                      fontSize: Dimensions().heightFactor(18),
                      fontWeight: FontWeight.bold,
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
}
