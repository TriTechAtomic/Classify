import 'package:classify/assets/asset_register.dart';
import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);
  static const String routeName = '/adminHome';

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: adminBackground,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetRegister.logoImg,
                      width: 200,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search Here",
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: adminBackground)),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(adminBackground),
                            elevation: MaterialStateProperty.all(0)),
                        onPressed: () {},
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.red,
                          size: 35,
                        ))
                  ],
                ),
                Wrap(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomButtons(
                        text: "Hello",
                        height: 90,
                        width: 150,
                        screen: '/ManageCourses',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// class Adminmenu extends StatefulWidget {
//   const Adminmenu({Key? key}) : super(key: key);

//   @override
//   State<Adminmenu> createState() => _AdminmenuState();
// }

// class _AdminmenuState extends State<Adminmenu> {
//   bool hovering = false;
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//         onTap: () {},
//         onHover: (e) {
//           setState(() {
//             hovering = e;
//           });
//         },
//         child: Container(
//           width: 0,
//           height: 0,
//           color: hovering ? primaryColor : accentColor,
//           child: const Text("Manage Courses"),
//         ),
//       ),
//     );
//   }
// }
