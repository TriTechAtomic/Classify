import 'package:classify/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'mobileinterface.dart';
import 'tabdesktopinterface.dart';
import '../../../utils/colors.dart';

class TeacherInstitutionPage extends StatelessWidget {
  const TeacherInstitutionPage({Key? key}) : super(key: key);
  static const String routeName = '/teacherintitutionpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institute Name'),
      ),
      backgroundColor: adminBackground,
      body: Responsive(
        mobile: MobileInterface(),
        tablet: const DesktopInterface(),
        desktop: const DesktopInterface(),
      ),
    );
  }
}
