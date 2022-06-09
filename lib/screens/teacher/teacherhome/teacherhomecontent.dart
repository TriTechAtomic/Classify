import 'package:flutter/material.dart';
import 'teacherheader.dart';
import 'teacherhomebody.dart';
import '../../../utils/buttons.dart';
import '../../../utils/responsive.dart';
import 'bottomsheetmodalclass.dart';

class TeacherHomeContents extends StatelessWidget {
  const TeacherHomeContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          const TeacherHeader(
              name: "DummyTeacher",
              contact: "1234567890",
              email: "Dummyemail@gmail.com",
              keysubject: "Pehele seekh lu"),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtons(
                  text: "Join New Class",
                  height: Responsive.isMobile(context) ? 40 : 55,
                  width: Responsive.isMobile(context) ? 140 : 200,
                  color: const Color.fromARGB(255, 144, 145, 199),
                  textcolor: Colors.white,
                  callback: () {
                    joinWithLinkBottomModalSheet(context, mq);
                  },
                ),
              ],
            ),
          ),
          Column(
            children: [
              for (int i = 1; i < 4; i++)
                TeacherHomeBody(
                  className: i.toString(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> joinWithLinkBottomModalSheet(BuildContext context, Size mq) {
    return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxWidth: mq.width * 0.99),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) {
        return Responsive(
          mobile: ShowModalContainer(
            height: mq.height * 0.25,
            width: mq.width * 0.83,
          ),
          tablet: ShowModalContainer(
            height: mq.height * 0.25,
            width: mq.width * 0.63,
          ),
          desktop: Padding(
            padding: EdgeInsets.only(
                bottom: (mq.height / 2) - ((mq.height * 0.27) / 2)),
            child: ShowModalContainer(
              height: mq.height * 0.27,
              width: mq.width * 0.39,
            ),
          ),
        );
      },
    );
  }
}
