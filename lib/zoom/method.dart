// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_sdk/zoom_options.dart';
// import 'package:flutter_zoom_sdk/zoom_view.dart';
// import 'package:widgets/zoom/jwt_token.dart';
//
// // joinMeeting(BuildContext context, TextEditingController meetingIdController) async {
// //   var timer;
// //   bool _isMeetingEnded(String status) {
// //     var result = false;
// //
// //     if (Platform.isAndroid)
// //       result = status == "MEETING_STATUS_DISCONNECTING" ||
// //           status == "MEETING_STATUS_FAILED";
// //     else
// //       result = status == "MEETING_STATUS_IDLE";
// //
// //     return result;
// //   }
// //
// //   if (meetingIdController.text.isNotEmpty) {
// //     ZoomOptions zoomOptions = ZoomOptions(
// //       domain: "zoom.us",
// //
// //
// //       // appKey: "vMy9vQzQ7ucwVsUAxpndQ", //API KEY FROM ZOOM - Sdk API Key
// //       // appSecret:
// //       //     "tr_MwZ1LQcmDrAUOWdNMyA", //API SECRET FROM ZOOM - Sdk API Secret
// //     );
// //     var meetingOptions = ZoomMeetingOptions(
// //         userId: 'Youssef',
// //         //pass username for join meeting only --- Any name eg:- EVILRATT.
// //         meetingId: meetingIdController.text,
// //         //pass meeting id for join meeting only
// //
// //         //pass meeting password for join meeting only
// //         disableDialIn: "true",
// //         disableDrive: "true",
// //         disableInvite: "true",
// //         disableShare: "true",
// //         disableTitlebar: "false",
// //         viewOptions: "true",
// //         noAudio: "false",
// //         noDisconnectAudio: "false");
// //
// //     var zoom = ZoomView();
// //     zoom.initZoom(zoomOptions).then((results) {
// //       if (results[0] == 0) {
// //         zoom.onMeetingStatus().listen((status) {
// //           print("${"[Meeting Status Stream] : " + status[0]} - " + status[1]);
// //           if (_isMeetingEnded(status[0])) {
// //             print("[Meeting Status] :- Ended");
// //             timer.cancel();
// //           }
// //         });
// //         print("listen on event channel");
// //         zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
// //           timer = Timer.periodic( Duration(seconds: 2), (timer) {
// //             zoom.meetingStatus(meetingOptions.meetingId!).then((status) {
// //               if (kDebugMode) {
// //                 print("${"[Meeting Status Polling] : " +
// //                   status[0]} - " +
// //                   status[1]);
// //               }
// //             });
// //           });
// //         });
// //       }
// //     }).catchError((error) {
// //       print(' error.runtimeType.toString()');
// //       print( error.runtimeType.toString());
// //       print( error);
// //     });
// //   } else {
// //     if (meetingIdController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //         content: Text("Enter a valid meeting id to continue."),
// //       ));
// //     }
// //     // } else if (meetingPasswordController.text.isEmpty) {
// //     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //     //     content: Text("Enter a meeting password to start."),
// //     //   ));
// //     }
// //   }
//
// joinMeeting(BuildContext context, TextEditingController meetingIdController) {
//   bool _isMeetingEnded(String status) {
//     var result = false;
//     var timer;
//     if (Platform.isAndroid)
//       result = status == "MEETING_STATUS_DISCONNECTING" || status == "MEETING_STATUS_FAILED";
//     else
//       result = status == "MEETING_STATUS_IDLE";
//
//     return result;
//   }
//   if(meetingIdController.text.isNotEmpty ){
//     ZoomOptions zoomOptions =  ZoomOptions(
//       domain: "zoom.us",
// jwtToken: generateJwtToken()
//
//       // appKey: "uz4z70kAGMVFBvcxCeWeymz5YKr4wK0B", //API KEY FROM ZOOM
//       // appSecret: "tr_MwZ1LQcmDrAUOWdNMyA", //API SECRET FROM ZOOM
//     );
//     var meetingOptions =  ZoomMeetingOptions(
//         userId: 'username', //pass username for join meeting only --- Any name eg:- EVILRATT.
//         meetingId: "",
//         disableDialIn: "true",
//         disableDrive: "true",
//         disableInvite: "true",
//         disableShare: "true",
//         disableTitlebar: "false",
//         viewOptions: "true",
//         noAudio: "false",
//         noDisconnectAudio: "false"
//     );
//
//     var zoom = ZoomView();
//     zoom.initZoom(zoomOptions).then((results) {
//       if(results[0] == 0) {
//         zoom.onMeetingStatus().listen((status) {
//           print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
//           if (_isMeetingEnded(status[0])) {
//             print("[Meeting Status] :- Ended");
//
//             var timer;
//             timer.cancel();
//           }
//         });
//         print("listen on event channel");
//         zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
//           var timer = Timer.periodic( Duration(seconds: 2), (timer) {
//             zoom.meetingStatus(meetingOptions.meetingId!)
//                 .then((status) {
//               print("[Meeting Status Polling] : " + status[0] + " - " + status[1]);
//             });
//           });
//         });
//       }
//     }).catchError((error) {
//       print("[Error Generated] : " + error);
//     });
//   }else{
//     if(meetingIdController.text.isEmpty){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Enter a valid meeting id to continue."),
//       ));
//     }
//
//   }
//
// }
//
// // startMeeting(BuildContext context) {
// //   bool _isMeetingEnded(String status) {
// //     var result = false;
// //
// //     if (Platform.isAndroid)
// //       result = status == "MEETING_STATUS_DISCONNECTING" || status == "MEETING_STATUS_FAILED";
// //     else
// //       result = status == "MEETING_STATUS_IDLE";
// //
// //     return result;
// //   }
// //   ZoomMeetingOptions meetingOptions = ZoomMeetingOptions(
// //       userEmail:  "elmatdor.yosef@gmail.com",
// //       userId:  "youssef",
// //       meetingId: '86822843538',
// //       disableMinimizeMeeting: "true",
// //       disableDialIn: "true",
// //       disableDrive: "true",
// //       disableInvite: "true",
// //       disableShare: "false",
// //       disableTitlebar: "false",
// //       viewOptions: "false",
// //       noAudio: "false",
// //       noDisconnectAudio: "true");
// //   ZoomOptions zoomOptions =  ZoomOptions(
// //     domain: "zoom.us",
// //
// //   );
// //
// //   var zoom = ZoomView();
// //   zoom.initZoom(zoomOptions).then((results) {
// //     if(results[0] == 0) {
// //       zoom.onMeetingStatus().listen((status) {
// //         print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
// //         if (_isMeetingEnded(status[0])) {
// //           print("[Meeting Status] :- Ended");
// //           var timer;
// //           timer.cancel();
// //         }
// //         if(status[0] == "MEETING_STATUS_INMEETING"){
// //           zoom.meetinDetails().then((meetingDetailsResult) {
// //             print("[MeetingDetailsResult] :- " + meetingDetailsResult.toString());
// //           });
// //         }
// //       });
// //       zoom.startMeeting(meetingOptions).then((loginResult) {
// //         print("[LoginResult] :- " + loginResult[0] + " - " + loginResult[1]);
// //         if(loginResult[0] == "SDK ERROR"){
// //           //SDK INIT FAILED
// //           print((loginResult[1]).toString());
// //         }else if(loginResult[0] == "LOGIN ERROR"){
// //           //LOGIN FAILED - WITH ERROR CODES
// //           print((loginResult[1]).toString());
// //         }else{
// //           //LOGIN SUCCESS & MEETING STARTED - WITH SUCCESS CODE 200
// //           print((loginResult[0]).toString());
// //         }
// //       });
// //     }
// //   }).catchError((error) {
// //     print("[Error Generated] : " + error);
// //   });
// // }