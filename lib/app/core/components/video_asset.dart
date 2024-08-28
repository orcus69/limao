import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoAsset extends StatefulWidget {
  final String videoPath;
  final double? videoW;
  final double? videoH;
  final BoxFit? fit;
  final bool loop;
  final bool autoplay;

  const AppVideoAsset({
    Key? key,
    required this.videoPath,
    this.videoW,
    this.videoH,
    this.fit,
    this.loop = false,
    this.autoplay = false,
  }) : super(key: key);

  @override
  _AppVideoAssetState createState() => _AppVideoAssetState();
}

class _AppVideoAssetState extends State<AppVideoAsset> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..setLooping(widget.loop)
      ..initialize().then((_) {
        setState(() {});
        if (widget.autoplay) {
          _controller.play();
          setState(() {
            _isPlaying = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: widget.videoW ?? MediaQuery.of(context).size.width,
                height: widget.videoH ?? MediaQuery.of(context).size.height / 3,
                child: FittedBox(
                  fit: widget.fit ?? BoxFit.contain,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
                onPressed: _togglePlayPause,
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
