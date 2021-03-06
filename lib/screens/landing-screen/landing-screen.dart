import 'package:flutter/material.dart';
import 'components/components.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Divider(thickness: 9),
            SizedBox(height: 60),
            EnjoyOnYourTV(),
            Divider(thickness: 9),
            OfflineDownload(),
            SizedBox(height: 30),
            Divider(thickness: 9),
            SizedBox(height: 30),
            WatchEveryWare(),
            SizedBox(height: 30),
            Divider(thickness: 9),
            SizedBox(height: 30),
            ForKid(),
            Divider(thickness: 9),
            SizedBox(height: 30),
            FrequentlyAskedQuestions(),
            SizedBox(height: 30),
            Divider(thickness: 9),
            Container(height: 400),
          ],
        ),
      ),
    );
  }
}
