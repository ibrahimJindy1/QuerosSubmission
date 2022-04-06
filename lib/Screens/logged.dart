import 'package:flutter/material.dart';
import 'package:queros_submission/utilis/dimensions.dart';
import 'package:queros_submission/utilis/statics.dart';

class LoggedScreen extends StatefulWidget {
  final String username;
  const LoggedScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<LoggedScreen> createState() => _LoggedScreenState();
}

class _LoggedScreenState extends State<LoggedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome: ${widget.username}',
              style: TextStyle(
                fontSize: Dimensions().heightFactor(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
