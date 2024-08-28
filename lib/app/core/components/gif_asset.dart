import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class AppGifAsset extends StatefulWidget {
  final String gifPath;
  final double? gifW;
  final double? gifH;
  final BoxFit? fit;
  final bool loop;
  final Duration? duration;

  const AppGifAsset({
    Key? key,
    required this.gifPath,
    this.gifW,
    this.gifH,
    this.fit,
    this.loop = true,
    this.duration,
  }) : super(key: key);

  @override
  _AppGifAssetState createState() => _AppGifAssetState();
}

class _AppGifAssetState extends State<AppGifAsset>
    with SingleTickerProviderStateMixin {
  late GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);

    _controller.repeat(
        min: 0, max: 1, period: widget.duration ?? const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: AssetImage(widget.gifPath),
      controller:
          _controller, // if duration and fps is null, original gif fps will be used.
      //fps: 30,
      //duration: const Duration(seconds: 3),
      autostart: Autostart.no,
      placeholder: (context) => const Text('Loading...'),
      onFetchCompleted: () {
        _controller.reset();
        _controller.forward();
      },
    );
  }
}
