import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomTextBox.dart';
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool status = false;
  bool showPassword = true;
  bool? isDarkModeEnabled;
  var formKey = GlobalKey<FormState>();
  Map<String, String> updatedData = {};
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("تعديل البيانات"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () async {
                    var f = await ImagePicker.platform.getImageFromSource(
                      source: ImageSource.gallery,
                    );
                    if (f != null) {
                      setState(() {
                        file = f;
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.transparent,
                    backgroundImage: file != null
                        ? FileImage(File(file!.path)) as ImageProvider
                        : const AssetImage('assets/images/target.png'),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextBox(
                  hintText: "الاسم الاول",
                  onChanged: (e) {},
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextBox(
                  hintText: "الاسم الثاني",
                  onChanged: (e) {},
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextBox(
                  hintText: "الايميل",
                  onChanged: (e) {},
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextBox(
                  hintText: "الباسورد",
                  onChanged: (e) {},
                ),
                const SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "عدل",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
