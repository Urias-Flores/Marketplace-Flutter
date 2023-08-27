import 'package:Marketplace/constants.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/models/User.dart';
import 'package:flutter_svg/svg.dart';

class UserDetails extends StatelessWidget{
  const UserDetails({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context){
    return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: Text(user.contact.firstName[0]),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Text('${user.contact.firstName} ${user.contact.lastName}', style: const TextStyle( fontSize: 16, color: Colors.black ), ),
                ]
            ),
          ),
          getInformationElement(user.contact.phone, 'assets/icons/Phone-2.svg'),
          getInformationElement(user.email, 'assets/icons/Mail.svg'),
          getInformationElement(user.contact.address, 'assets/icons/Pin.svg'),
        ]
    );
  }

  Widget getInformationElement(text, icon){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}