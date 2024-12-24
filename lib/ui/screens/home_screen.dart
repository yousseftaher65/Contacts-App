import 'package:contacts_pojo/ui/model/contact_model.dart';
import 'package:contacts_pojo/ui/theme/colors.dart';
import 'package:contacts_pojo/ui/widgets/add_btn.dart';
import 'package:contacts_pojo/ui/widgets/contact.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addContact(Map<String, String> newContact) {
    setState(() {
      contactDetails.add(newContact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          title: Image.asset(
            'assets/images/route_title.png',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: contactDetails.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 368,
                        height: 368,
                        child: Lottie.asset(
                          'assets/images/empty_list.json',
                          repeat: true,
                        ),
                      ),
                      const Text(
                        'There is No Contacts Added Here',
                        style: TxtStyle.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : SizedBox(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 2.6 / 4, 
                    ),
                    itemCount: contactDetails.length, // Number of items
                    itemBuilder: (context, index) {
                      return Contact(
                        contact: contactDetails[index],
                        onDelete: () {
                          setState(() {
                            contactDetails.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
              ),
        ),
        floatingActionButton: contactDetails.length > 5 ? const SizedBox():AddBtn(onContactAdded: _addContact),
      ),
    );
  }
}
