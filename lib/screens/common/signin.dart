import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/admin/admin_home.dart';
import 'package:classify/screens/common/role_selection.dart';
import 'package:classify/screens/parent/parent_home.dart';
import 'package:classify/screens/student/student_home.dart';
import 'package:classify/screens/teacher/teacher_home.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/screens/widgets/tf_flow.dart';
import 'package:classify/utils/auth/classify_auth.dart';
import 'package:classify/utils/auth/models/user.dart';
import 'package:classify/utils/colors.dart';
import 'package:classify/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Signin extends StatefulWidget {
  static const routename = '/signin';

  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final List<TFmeta> controllers = [
    TFmeta("Enter User Name / Email"),
    TFmeta("Enter password", ispass: true)
  ];

  Role SelectedRole = Role.admin;

  ClassifyAuth getInstanceWithRole(Role e) {
    if (e == Role.admin) {
      return ClassifyAuth<Institute>();
    } else if (e == Role.student) {
      return ClassifyAuth<Student>();
    } else if (e == Role.parent) {
      return ClassifyAuth<Parent>();
    } else {
      return ClassifyAuth<Teacher>();
    }
  }

  String getEndpointWithRole(Role e) {
    if (e == Role.admin) {
      return "signinInstitute";
    } else if (e == Role.student) {
      return "signinStudent";
    } else if (e == Role.parent) {
      return "signinParent";
    } else {
      return "signinTeacher";
    }
  }

  String GetHomeRouteNameWithRole(Role e) {
    if (e == Role.admin) {
      return AdminHome.routeName;
    } else if (e == Role.student) {
      return StudentHome.routeName;
    } else if (e == Role.parent) {
      return ParentHome.routeName;
    } else {
      return TeacherHome.routeName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FormHeading(name: "Signin"),
              Column(),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 250,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              style: const TextStyle(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                              focusColor: accentColor,
                              dropdownColor: accentColor,
                              hint: const Text("Select your role"),
                              value: SelectedRole,
                              items: const [
                                DropdownMenuItem(
                                    child: Text('Admin'), value: Role.admin),
                                DropdownMenuItem(
                                    child: Text('Student'),
                                    value: Role.student),
                                // DropdownMenuItem(
                                //     child: Text('Parent'), value: Role.parent),
                                DropdownMenuItem(
                                    child: Text('Teacher'),
                                    value: Role.teacher),
                              ],
                              onChanged: (Role? e) {
                                setState(() {
                                  SelectedRole = e!;
                                });
                              }),
                        ),
                      ),
                    ),
                    for (var ele in controllers)
                      TFrow(data: ele, ss: MediaQuery.of(context).size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProceedButton(
                        ss: MediaQuery.of(context).size,
                        text: "Sign in",
                        onPressed: () async {
                          try {
                            Response res =
                                await getInstanceWithRole(SelectedRole).signIn(
                              controllers[0].controller.text,
                              controllers[1].controller.text,
                              getEndpointWithRole(SelectedRole),
                            );

                            Navigator.pushNamed(
                              context,
                              GetHomeRouteNameWithRole(SelectedRole),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Invalid Credentials",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                            //Login Karo
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "New Here?",
                              style: TextDecor.titleTextDecoration
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                          TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, RoleSelection.routeName),
                              child: Text("Signup ?",
                                  style: TextDecor.titleTextDecoration.copyWith(
                                      fontSize: 20, color: Colors.deepPurple))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
