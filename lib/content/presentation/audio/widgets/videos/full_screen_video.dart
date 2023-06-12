import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FullScreenAudioPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenAudioPlayer({
    super.key,
    required
    this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenAudioPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenAudioPlayer> {
  bool _isPlaying = false;
  late final AudioPlayer _audioPlayer;

  @override
  void initState(){
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose(){
    super.dispose();
    _audioPlayer.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        if (_isPlaying){
          await _audioPlayer.pause();
          setState(() {
            _isPlaying = false;
          });
        }else{
          await _audioPlayer.play(UrlSource(widget.videoUrl));
          setState(() {
            _isPlaying = true;
          });
        }
        
      },
      child:  Stack(
  children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.black,
            ),
            const Text(
              'Reproducir audio',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),

    // Texto
    Positioned(
      bottom: 50,
      left: 20,
      child: _VideoCaption(caption: widget.caption),
    ),
  ],
),
    );
  }
}


class _VideoCaption extends StatelessWidget {

  final String caption;


  const _VideoCaption({required this.caption });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle ),
    );
  }
}