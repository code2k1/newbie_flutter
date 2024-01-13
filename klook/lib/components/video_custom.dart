import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:klook/components/small_text.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _showControls = false;
  late AnimationController controller;
  late Animation<double> animation;
  late String formattedTotalDuration =
      formatDuration(_controller.value.position);
  late String formattedCurrentPosition =
      formatDuration(_controller.value.position);

  bool isButton1Visible = true;

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      String twoDigitHours = twoDigits(duration.inHours);
      return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://res.klook.com/video/upload/fl_lossy.progressive,q_85,f_auto/c_fill,,/c_scale,h_540,vc_auto/c_scale,g_north_west,h_20,l_Klook_water_br_trans_yhcmh3,o_30,x_70,y_480/c_scale,f_mp4,fl_splice,h_540,l_video:ending_video_esl1b1/v1667877567/activities/pi9ahhooi63them0abf1.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);
        });
      });

    _controller.addListener(() {
      setState(() {
        formattedTotalDuration = formatDuration(_controller.value.duration);
        formattedCurrentPosition = formatDuration(_controller.value.position);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });
        },
        child: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  color: Colors.black12,
                  child: Stack(
                    children: [
                      Positioned(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: _showControls
                              ? () {
                                  SystemChrome.setPreferredOrientations([
                                    DeviceOrientation.landscapeRight,
                                    DeviceOrientation.landscapeLeft,
                                    DeviceOrientation.portraitUp,
                                    DeviceOrientation.portraitDown,
                                  ]);
                                  Navigator.pop(context);
                                }
                              : null,
                        ),
                        top: 20,
                        left: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 60,
                              ),
                              color: Colors.white,
                              onPressed: _showControls
                                  ? () {
                                      setState(() {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      });
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        left: 40,
                        right: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(
                              text: formattedCurrentPosition,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            _controller.value.isInitialized
                                ?  Expanded(
                                child: FlutterSlider(
                              values: [
                                _controller.value.position.inMilliseconds
                                    .toDouble()
                              ],
                              max: _controller.value.duration != null &&
                                      _controller
                                              .value.duration.inMilliseconds >
                                          0
                                  ? _controller.value.duration.inMilliseconds
                                      .toDouble()
                                  : 0.0,
                              min: 0.0,
                              onDragging:
                                  (handlerIndex, lowerValue, upperValue) {
                                setState(() {
                                  _controller.seekTo(Duration(
                                      milliseconds: lowerValue.toInt()));
                                });
                              },
                              handler: FlutterSliderHandler(
                                decoration: BoxDecoration(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              trackBar: FlutterSliderTrackBar(
                                activeTrackBarHeight: 3,
                                inactiveTrackBarHeight: 3,
                                activeTrackBar: BoxDecoration(
                                  color: Colors.red,
                                ),
                                inactiveTrackBar: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            )) : const SizedBox(),
                            SizedBox(
                              width: 30,
                            ),
                            SmallText(
                              text: formattedTotalDuration,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            isButton1Visible
                                ? IconButton(
                                    icon: Icon(Icons.volume_up),
                                    color: Colors.white,
                                    onPressed: () async {
                                      _controller.setVolume(0.0);
                                      setState(() {
                                        isButton1Visible = false;
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(Icons.volume_off),
                                    color: Colors.white,
                                    onPressed: () async {
                                      _controller.setVolume(1.0);
                                      setState(() {
                                        isButton1Visible = true;
                                      });
                                    },
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
