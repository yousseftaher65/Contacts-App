import 'dart:io';

import 'package:contacts_pojo/ui/theme/colors.dart';
import 'package:contacts_pojo/ui/widgets/enter_btn.dart';
import 'package:contacts_pojo/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BottomNavBar extends StatefulWidget {
  
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  
  final ImagePicker _imagePicker = ImagePicker();
  XFile? pickedImage;

  Future<void> _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = image != null ? XFile(image.path) : null;
    });
  }

  // Future<void> _captureImageFromCamera() async {
  //   final image = await _imagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _pickedImage = image != null ? XFile(image.path) : null;
  //   });
  // }

  String email = 'example@example.com';
  String phone = '+200000000000';
  String name = 'User Name';

  String? _validateEmail(email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (email.isEmpty) {
      return 'This Field is required';
    }
    if (!emailRegex.hasMatch(email)) {
      return 'Email is not valid';
    }
    return null;
  }

  String? _validatePhone(phone) {
    if (phone.isEmpty) {
      return 'This field is required';
    }
    final numberRegex = RegExp(r'^\d+$');

    if (!numberRegex.hasMatch(phone)) {
      return 'Phone number must contain digits only';
    }

    if (phone.length != 13) {
      return 'Phone number must be exactly 13 digits';
    }

    return null;
  }

  String? _validateName(name) {
    if (name.isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      setState(() {
         name;
         email;
         phone;
         pickedImage?.path ?? '';
      
      });

      final newContact = {
        'name': name,
        'email': email,
        'phone': phone,
        'image': pickedImage?.path ?? '',
      };

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context, newContact); 
         ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Contact Saved'),
            duration: Duration(seconds: 3), // Matches the delay
          ),
        );
      });

     
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(16.0),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _pickImageFromGallery();
                        },
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        child: Tooltip(
                          message: 'Tap to pick an image from the gallery',
                          child: Container(
                            width: 143,
                            height: 146,
                            decoration: ShapeDecoration(
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: const BorderSide(
                                    color: MyColors.goldColor, width: 1),
                              ),
                            ),
                            child: pickedImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(28),
                                    child: Image.file(
                                      File(
                                        pickedImage!.path,
                                      ),
                                      fit: BoxFit.cover,
                                    ))
                                : Lottie.asset(
                                    'assets/images/image_picker.json',
                                    repeat: true,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TxtStyle.titleMedium,
                            ),
                            const Divider(
                              color: MyColors.goldColor,
                              endIndent: 25,
                              thickness: 1.5,
                            ),
                            Text(
                              email,
                              style: TxtStyle.titleMedium,
                            ),
                            const Divider(
                              color: MyColors.goldColor,
                              endIndent: 25,
                              thickness: 1.5,
                            ),
                            Text(
                              phone,
                              style: TxtStyle.titleMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InputField(
                  txt: 'Enter User Name',
                  txtLimit: 25,
                  vali: _validateName,
                  save: (value) {
                    name = value ?? 'User name';
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  txt: ' Enter User Email ',
                  txtLimit: 30,
                  vali: _validateEmail,
                  save: (value) {
                    email = value ?? 'example@example.com';
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField(
                  txt: 'Enter User Phone',
                  txtLimit: 13,
                  save: (value) {
                    phone = value ?? '+200000000000';
                    return null;
                  },
                  vali: _validatePhone,
                ),
                const SizedBox(
                  height: 16,
                ),
                EnterBtn(check: _submitForm),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
