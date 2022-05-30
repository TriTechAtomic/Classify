import 'package:classify/assets/asset_register.dart';
import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/colors.dart';
import 'package:classify/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'adminSideDrawer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);
  static const String routeName = '/adminHome';

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool searchIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: MediaQuery.of(context).size.width <= 1100
            ? const AdminSideDrawer()
            : null,
        backgroundColor: adminBackground,
        body: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: AdminSideDrawer(),
              ),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!Responsive.isDesktop(context))
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                icon: const Icon(Icons.menu)),
                          if (!searchIcon)
                            Image.asset(
                              AssetRegister.logoImg,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                          if (Responsive.isDesktop(context) || searchIcon)
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Search Here",
                                  suffixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: adminBackground)),
                                ),
                              ),
                            ),
                          if (searchIcon)
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    searchIcon = false;
                                  });
                                },
                                icon: const Icon(Icons.close)),
                          if (!Responsive.isDesktop(context) && !searchIcon)
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    searchIcon = true;
                                  });
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          if (!searchIcon)
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        adminBackground),
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
              ),
            ),
          ],
        ));
  }
}
