import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

class EnjoyOnYourTV extends StatefulWidget {
  @override
  _EnjoyOnYourTVState createState() => _EnjoyOnYourTVState();
}

class _EnjoyOnYourTVState extends State<EnjoyOnYourTV> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/video/nj.m4v",
    )..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return CenterView(
      child: ScreenTypeLayout(
        mobile: Column(
          children: [
            _content(isMobile: true),
            _animation(),
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(child: _content()), _animation()],
        ),
      ),
    );
  }

  Widget _content({bool isMobile = false}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            "Enjoy on your TV.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Watch on Smart TVs, Playstation, Xbox, Chromecast, Apple TV, Blu-ray players, and more.",
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _animation() {
    return Container(
        width: 600,
        height: 450,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _controller.value.isInitialized
                ? Container(
                    width: 438,
                    height: 245,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
            Image.asset(
              "assets/images/tv.png",
              fit: BoxFit.cover,
            ),
          ],
        ));
  }
}
