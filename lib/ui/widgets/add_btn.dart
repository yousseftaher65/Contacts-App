import 'package:contacts_pojo/ui/screens/bottom_nav_bar.dart';
import 'package:contacts_pojo/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class AddBtn extends StatelessWidget {
  final Function(Map<String, String>) onContactAdded;
 const AddBtn({
    super.key,
    required this.onContactAdded,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final newContact = await showModalBottomSheet<Map<String, String>>(
            backgroundColor: MyColors.primaryColor,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return const BottomNavBar();
            });
            
        if (newContact != null) {
          onContactAdded(newContact);
        }
      },
      backgroundColor: MyColors.goldColor,
      child: MyIcon.addIcon,
    );
    
  }
}
