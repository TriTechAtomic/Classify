import 'package:classify/assets/asset_register.dart';
import 'package:classify/screens/screens.dart';
import 'package:classify/screens/widgets/transperent_app_bar.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({Key? key}) : super(key: key);
  static const routeName = '/roleSelection';
  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

enum Role {
  student,
  teacher,
  parent,
  admin,
}

class _RoleSelectionState extends State<RoleSelection> {
  Role SelectedRole = Role.admin;

  String GetassetFromRole(Role e) {
    if (e == Role.admin) {
      return AssetRegister.adminImg;
    } else if (e == Role.student) {
      return AssetRegister.studentImg;
    } else if (e == Role.parent) {
      return AssetRegister.parentsImg;
    } else {
      return AssetRegister.teacherImg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transperentAppBar(context: context),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetRegister.pensilBackground),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Text(
                'Choose your role',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    GetassetFromRole(SelectedRole),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                ],
              ),
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
                              child: Text('Parent'), value: Role.parent),
                          DropdownMenuItem(
                              child: Text('Teacher'), value: Role.teacher),
                        ],
                        onChanged: (Role? e) {
                          setState(() {
                            SelectedRole = e!;
                          });
                        }),
                  ),
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var e = SelectedRole;
          String pagename;
          if (e == Role.admin) {
            pagename = AdminSignup.routename;
          } else if (e == Role.parent) {
            pagename = StudentHome.routeName;
          } else {
            pagename = TeacherSignup.routeName;
          }
          Navigator.pushNamed(context, pagename);
        },
        child: const Text("Done"),
        tooltip: "Save Your Role",
      ),
    );
  }
}
