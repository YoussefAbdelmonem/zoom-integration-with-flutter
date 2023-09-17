import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gr_zoom/gr_zoom.dart';

ZoomOptions zoomOptions = ZoomOptions(
  domain: "zoom.us",
  appKey: zoomApiKey, //API KEY FROM ZOOM
  appSecret: zoomSdkSecrt, //API SECRET FROM ZOOM
);

const zoomApiKey = "";
const zoomSdkSecrt = "";

class MeetingWidget extends StatefulWidget {
  const MeetingWidget({Key? key}) : super(key: key);

  @override
  _MeetingWidgetState createState() => _MeetingWidgetState();
}

class _MeetingWidgetState extends State<MeetingWidget> {
  TextEditingController meetingIdController =
  TextEditingController(text: "77243656504");
  TextEditingController meetingPasswordController =
  TextEditingController(text: "S31DvS");
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: meetingIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Meeting ID',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: meetingPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  // The basic Material Design action button.
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () => {
                      {joinMeeting(context)}
                    },
                    child: const Text('Join'),
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }

  //API KEY & SECRET is required for below methods to work
  //Join Meeting With Meeting ID & Password
  joinMeeting(BuildContext context) {
    bool _isMeetingEnded(String status) {
      var result = false;

      if (Platform.isAndroid) {
        result = status == "MEETING_STATUS_DISCONNECTING" ||
            status == "MEETING_STATUS_FAILED";
      } else {
        result = status == "MEETING_STATUS_IDLE";
      }

      return result;
    }

    if (meetingIdController.text.isNotEmpty &&
        meetingPasswordController.text.isNotEmpty) {
      var meetingOptions = ZoomMeetingOptions(
          userId: 'Youssef',

          /// pass username for join meeting only --- Any name eg:- EVILRATT.
          meetingId: meetingIdController.text,

          /// pass meeting id for join meeting only
          meetingPassword: meetingPasswordController.text,

          /// pass meeting password for join meeting only
          disableDialIn: "true",
          disableDrive: "true",
          disableInvite: "true",
          disableShare: "true",
          // disableTitlebar: "false",
          // viewOptions: "true",
          noAudio: "false",
          noDisconnectAudio: "false");

      var zoom = Zoom();
      zoom.init(zoomOptions).then((results) {
        if (results[0] == 0) {
          // zoom.onMeetingStatus().listen((status) {
          //   if (kDebugMode) {
          //     print(
          //         "[Meeting Status Stream] : " + status[0] + " - " + status[1]);
          //   }
          //   if (_isMeetingEnded(status[0])) {
          //     if (kDebugMode) {
          //       print("[Meeting Status] :- Ended");
          //     }
          //     timer.cancel();
          //   }
          // });
          if (kDebugMode) {
            print("listen on event channel");
          }
          zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {
            timer = Timer.periodic(const Duration(seconds: 2), (timer) {
              zoom.meetingStatus(meetingOptions.meetingId).then((status) {
                if (kDebugMode) {
                  print("${"[Meeting Status Polling] : " + status[0]} - " +
                      status[1]);
                }
              });
            });
          });
        }
      }).catchError((error) {
        if (kDebugMode) {
          print("[Error Generated] : " + error);
        }
      });
    } else {
      if (meetingIdController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter a valid meeting id to continue."),
        ));
      } else if (meetingPasswordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter a meeting password to start."),
        ));
      }
    }
  }

  //Start Meeting With Random Meeting ID ----- Emila & Password For Zoom is required.


}
