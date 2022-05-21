import 'package:flutter/material.dart';

class Role extends StatefulWidget {
  const Role({Key? key}) : super(key: key);

  @override
  State<Role> createState() => _RoleState();
}

class _RoleState extends State<Role> {
  final roles = ['Admin', 'Teacher', 'Student', 'Parent'];
  String? selectedRole;
  String? image = "admin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
            body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('lib/resources/bginrole.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 200,
                  child: Image.asset("lib/resources/$image.png")),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFD8D9EF), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                child: DropdownButton<String>(
                  value: selectedRole,
                  hint: const Text("Select Your Role"),
                  items: roles
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() {
                    selectedRole = item;
                    if (selectedRole == "Teacher") {
                      image = "teacher";
                    } else if (selectedRole == "Student") {
                      image = "student";
                    } else if (selectedRole == "Parent") {
                      image = "parent";
                    } else if (selectedRole == "Admin") {
                      image = "admin";
                    }
                  }),
                ),
              ),
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print(image)},
        child: const Text("NEXT"),
        tooltip: "Save your Role",
      ),
    );
  }
}
