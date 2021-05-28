import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/profile_photo.dart';
import 'package:flutter_chatbot_coora/services/firebase/authentication_service.dart';
import 'package:flutter_chatbot_coora/widgets/alert_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class ProfileTab extends StatelessWidget {
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfilePhoto(height:60, width: 60,),
          SizedBox(
            width: context.lowValue,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _firebaseAuth.currentUser.displayName,
                style: context.mdSmallHeadlineText.copyWith(
                    color: black26, fontWeight: FontWeight.w500),
              ),
              Text(
                _firebaseAuth.currentUser.email,
                style: context.smRegularBodyText
                    .copyWith(color: black26.withOpacity(0.75)),
              ),
            ],
          ),
          Spacer(),
          signOutMethod(context),

        ],
      ),
    );
  }

  GestureDetector signOutMethod(BuildContext context) {
    return GestureDetector(
          onTap: () async{
            final action= await Dialogs.dialogAction(context, 'Çıkış Yap!', 'Çıkış yapmak istiyor musunuz?', "action");
            if(action==DialogAction.yes){
              context.read<AuthenticationService>().signOut();
            }

          },
          child: Icon(
            FontAwesomeIcons.signOutAlt,
            size: 30,
            color: primaryColor,
          ),
        );
  }

}

