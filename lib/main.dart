import 'package:flutter/material.dart';
import 'package:widgets/gr_zoom/zoom_meeting.dart';
import 'package:widgets/zoom/meeting_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MeetingWidget());
  }
}

// class Home extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GestureDetector(
//       child: Center(
//         child: GestureDetector(
//             onTap: ()=>
//               // showDialog(
//               //     context: context,
//               //     builder: (context) => ChewieWidget(
//               //       videoPlayerController: VideoPlayerController.network(
//               //           'https://siaah.neop.co/storage/uploads/1685355753-ts5r-eid.mp4'),
//               //     ),
//               //     useSafeArea: true
//               // joinSession()
//
//             child: Text('Hello World!')),
//       ),
//     ));
//   }
// }
