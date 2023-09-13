// // import 'package:flutter/material.dart';
// //
// // class VideoWidget extends StatelessWidget {
// //   const VideoWidget({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
//
// class ChewieWidget extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;
//
//   ChewieWidget({required this.videoPlayerController});
//
//   @override
//   _ChewieWidgetState createState() => _ChewieWidgetState();
// }
//
// class _ChewieWidgetState extends State<ChewieWidget> {
//   late ChewieController _chewieController;
//   late Future<void> _initializeVideoPlayerFuture;
//   @override
//   void initState() {
//     super.initState();
//     _chewieController = ChewieController(
//       videoPlayerController: widget.videoPlayerController,
//       aspectRatio: 16 / 9, // You can adjust the aspect ratio as needed
//       autoPlay: true, // Whether the video should automatically start playing
//       looping: false, // Whether the video should loop
//       autoInitialize: true,
//     );
//     _initializeVideoPlayerFuture = widget.videoPlayerController.initialize();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20.0))),
//
//       backgroundColor: Color(0xffF9F9F9) ,
//       child: SizedBox(
//         height: 400,
//         width: MediaQuery.of(context).size.width*0.9,
//         child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return AspectRatio(
//                 aspectRatio: widget.videoPlayerController.value.aspectRatio,
//                 child: Chewie(
//                   controller: _chewieController,
//                 ),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _chewieController.dispose();
//     widget.videoPlayerController.dispose();
//   }
// }
//
//
//
