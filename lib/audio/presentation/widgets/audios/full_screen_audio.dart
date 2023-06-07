// import 'package:flutter/material.dart';
// // import 'package:toktik_clean/audio/presentation/widgets/audios/audio_background.dart';
// // import 'package:video_player/video_player.dart';
// import 'package:audioplayers/audioplayers.dart';

// class FullScreenPlayer extends StatefulWidget {

//   final String audioUrl;
//   final String caption;

//   const FullScreenPlayer({
//     super.key,
//     required
//     this.audioUrl,
//     required this.caption
//   });

//   @override
//   State<FullScreenPlayer> createState() => _FullScreenPlayerState();
// }

// class _FullScreenPlayerState extends State<FullScreenPlayer> {

 


//   @override
//   void initState() {
//     super.initState();


//   }

//   @override
//   void dispose() {
//     // controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             final player = AudioCache();
//             player.play(audioUrl);

//             },
//           child: Text('Holaaa') ,),));

//   // @override
//   // Widget build(BuildContext context) {

//   //   return FutureBuilder(
//     //   future: controller.initialize(),
//     //   builder: (context, snapshot) {
//     //     if ( snapshot.connectionState != ConnectionState.done ){
//     //       return const Center( child: CircularProgressIndicator( strokeWidth: 2 ));
//     //     }

//         // return GestureDetector(
//         //   onTap: () {
//         //     if ( controller.value.isPlaying ) {
//         //       controller.pause();
//         //       return;
//         //     }
//         //     controller.play();
            
//         //   },
//         //   child: AspectRatio(
//         //     // aspectRatio: controller.value.aspectRatio,
//         //     child: Stack(
//         //       children: [
        
//         //         // VideoPlayer(controller),
        
//         //         // Gradiente
//         //         AudioBackground(
//         //           stops: const [0.8,1.0],
//         //         ),
        
//         //         // Texto
//         //         Positioned(
//         //           bottom: 50,
//         //           left: 20,
//         //           child: _VideoCaption( caption: widget.caption )
//         //         ),
        
        
//         //       ],
//         //     ),
//         //   ),
//         // );

//   //     },
// //     );
// //   }
// }


// // class _VideoCaption extends StatelessWidget {

// //   final String caption;


// //   const _VideoCaption({super.key, required this.caption });

// //   @override
// //   Widget build(BuildContext context) {

// //     final size = MediaQuery.of(context).size;
// //     final titleStyle = Theme.of(context).textTheme.titleLarge;

// //     return SizedBox(
// //       width: size.width * 0.6,
// //       child: Text( caption, maxLines: 2, style: titleStyle ),
// //     );
// //   }
// // }

// }

// // import 'package:flutter/material.dart';
// // import 'package:toktik_clean/video/presentation/widgets/videos/video_background.dart';
// // import 'package:audioplayers/audioplayers.dart';

// // class FullScreenPlayer extends StatefulWidget {
// //   final String audioUrl;
// //   final String caption;

// //   const FullScreenPlayer({
// //     Key? key,
// //     required this.audioUrl,
// //     required this.caption,
// //   }) : super(key: key);

// //   @override
// //   State<FullScreenPlayer> createState() => _FullScreenPlayerState();
// // }

// // class _FullScreenPlayerState extends State<FullScreenPlayer> {
// //   late AudioPlayer audioPlayer;
// //   PlayerState playerState = PlayerState.stopped;

// //   @override
// //   void initState() {
// //     super.initState();
// //     audioPlayer = AudioPlayer();

// //     audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
// //       setState(() {
// //         playerState = state;
// //       });
// //     });

// //     playAudio();
// //   }

// //   @override
// //   void dispose() {
// //     audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   Future<void> playAudio() async {
// //     await audioPlayer.play(widget.audioUrl as Source);
// //   }

// //   Future<void> pauseAudio() async {
// //     await audioPlayer.pause();
// //   }

// //   Future<void> stopAudio() async {
// //     await audioPlayer.stop();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<void>(
// //       future: audioPlayer.setSourceUrl(widget.audioUrl),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState != ConnectionState.done) {
// //           return const Center(child: CircularProgressIndicator(strokeWidth: 2));
// //         }

// //         return GestureDetector(
// //           onTap: () {
// //             if (playerState == PlayerState.playing) {
// //               pauseAudio();
// //             } else {
// //               playAudio();
// //             }
// //           },
// //           child: AspectRatio(
// //             aspectRatio: 16 / 9, // Use the desired aspect ratio here
// //             child: Stack(
// //               children: [
// //                 Container(), // Replace with your desired background widget
// //                 // Gradiente
// //                 VideoBackground(
// //                   stops: const [0.8, 1.0],
// //                 ),
// //                 // Texto
// //                 Positioned(
// //                   bottom: 50,
// //                   left: 20,
// //                   child: _VideoCaption(caption: widget.caption),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class _VideoCaption extends StatelessWidget {
// //   final String caption;

// //   const _VideoCaption({Key? key, required this.caption}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     final titleStyle = Theme.of(context).textTheme.headline6;

// //     return SizedBox(
// //       width: size.width * 0.6,
// //       child: Text(
// //         caption,
// //         maxLines: 2,
// //         style: titleStyle,
// //       ),
// //     );
// //   }
// // }


import 'package:flutter/material.dart';
import 'package:toktik_clean/video/presentation/widgets/videos/video_background.dart';
import 'package:just_audio/just_audio.dart';

class FullScreenPlayer extends StatefulWidget {
  final String audioUrl;
  final String caption;

  const FullScreenPlayer({
    Key? key,
    required this.audioUrl,
    required this.caption,
  }) : super(key: key);

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer.setAsset(widget.audioUrl).then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> togglePlayback() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: audioPlayer.load(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }

        return GestureDetector(
          onTap: togglePlayback,
          child: AspectRatio(
            aspectRatio: 16 / 9, // Use the desired aspect ratio here
            child: Stack(
              children: [
                Container(), // Replace with your desired background widget
                // Gradiente
                VideoBackground(
                  stops: const [0.8, 1.0],
                ),
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.headline6;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
