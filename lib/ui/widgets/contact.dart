import 'dart:io';

import 'package:contacts_pojo/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final Map<String, String> contact;
  final VoidCallback onDelete;

  const Contact({super.key , required this.onDelete , required this.contact});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Image.file(
                    File(
                      contact['image']!,
                    ),
                    fit: BoxFit.cover,
                    height: 177,
                    width: double.infinity,
                  ),),
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: MyColors.goldColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contact['name']!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primaryColor),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                end: 8,
                start: 8,
              ),
              decoration: const BoxDecoration(
                color: MyColors.goldColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.mail_rounded,
                        size: 20,
                        color: MyColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        contact['email']!,
                        style: TxtStyle.bodySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_in_talk_rounded,
                        size: 20,
                        color: MyColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        contact['phone']!,
                        style: TxtStyle.bodySmall,
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onDelete();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.redColor,
                      //fixedSize: Size(161, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_rounded,
                          size: 20,
                          color: MyColors.accentColor,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: MyColors.accentColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
