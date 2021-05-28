import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/button.dart';
import 'package:flutter_chatbot_coora/components/custom_text_input.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

enum DialogAction { yes, no, ok }
class Dialogs {
  static Future<DialogAction> dialogAction(
      BuildContext context, String title, String content, String type) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: Text(title),
            content: Text(content),
            actions: [
              (type == "action")
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => pressedNoButton(context),
                          child: Text(
                            "Hayır",
                            style: context.smRegularBodyText.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextButton(
                          onPressed: () => pressedYesButton(context),
                          child: Text(
                            "Evet",
                            style: context.smRegularBodyText.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )
                  : Row(),
              (type == "message")
                  ? Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => pressedOKButton(context),
                            child: Text(
                              "Tamam",
                              style: context.smRegularBodyText.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(),
            ],
          );
        });
    return (action != null) ? action : DialogAction.no;
  }

  static Future<DialogAction> addItem(context, TextEditingController addItemController) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Öğe ekle",
                  style: context.mdSmallHeadlineText.copyWith(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: () {
                    pressedNoButton(context);
                  },
                  color: primaryColor,
                )
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20.0, right: 20.0),
                child: Column(
                  children: [
                    Container(
                      child: CustomTextInput(
                        hintText: "Öğe ekle",
                        color: primaryColor,
                        textColor: primaryColor,
                        fontSize: 16,
                        borderWidth: 2,
                        controller: addItemController,
                      ),
                    ),
                    SizedBox(height: context.mediumValue,),
                    CustomButton(text: "Kaydet", color: primaryColor, textColor: Colors.white,fontSize: 16, function: (){
                      pressedYesButton(context);
                    },)
                  ],
                ),
              ),
            ],
          );
        });
    return (action != null) ? action : DialogAction.no;
  }
}

pressedOKButton(BuildContext context) {
  Navigator.of(context).pop(DialogAction.ok);
}

pressedNoButton(BuildContext context) {
  Navigator.of(context).pop(DialogAction.no);
}

pressedYesButton(BuildContext context) {
  Navigator.of(context).pop(DialogAction.yes);
}
