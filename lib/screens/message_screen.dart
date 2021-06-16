import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/profile_photo.dart';
import 'package:flutter_chatbot_coora/models/button_action_model.dart';
import 'package:flutter_chatbot_coora/screens/profile_and_settings.dart';
import 'package:flutter_chatbot_coora/screens/to_do.dart';
import 'package:flutter_chatbot_coora/widgets/message_screen/custom_action_button_list.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/widgets/message_screen/chat.dart';
import '../constants.dart';


class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: messageScreen(),
    );
  }
}

class messageScreen extends StatefulWidget {
  @override
  _messageScreenState createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  FocusNode _focusNode = FocusNode();

  final messageController = new TextEditingController();
  bool showEmojiPicker = false;
  bool isWritting = false;
  List<Map> messages = [];
  String intentName;

  void response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/services/coora-hrna-0436bc93c51d.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString(),
      });
      intentName = aiResponse.queryResult.intent.displayName.toString();
    });
    intentOpenMessage();
    print(intentName);
  }

  void intentOpenMessage() {
    switch (intentName) {
      case "Message Screen":
        launchApp("sms:");
        break;
      case "Call Screen":
        launchApp("tel://");
        break;
      case "YouTube":
        launchApp("https://www.youtube.com/");
        break;
      case "YouTube Music":
        launchApp("https://music.youtube.com/");
        break;
      case "Telegram":
        launchApp("https://telegram.me/");
        break;
      case "Instagram":
        launchApp("https://www.instagram.com/");
        break;
      case "Twitter":
        launchApp("https://www.twitter.com/");
        break;
      case "Google Drive":
        launchApp("https://drive.google.com/drive/u/0/my-drive");
        break;
      case "List":
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ToDoScreen()));
        break;
      default:
        print('Undefined operation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OpenSettings(),
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) => chat(
                      messages[index]["message"].toString(),
                      messages[index]["data"])),
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: apps.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomActionButton(context, index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TypeMessageField(context),
            showEmojiPicker
                ? Container(
                    child: emojiContainer(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Row TypeMessageField(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            width: context.dynamicWidth(1),
            color: secondaryColor,
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.emoji_emotions,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    if (!showEmojiPicker) {
                      hideKeyboard();
                      showEmojiContainer();
                    } else {
                      showKeyboard();
                      hideEmojiContainer();
                    }
                  },
                ),
                Positioned(
                  left: 50,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: TextField(
                    controller: messageController,
                    focusNode: _focusNode,
                    onTap: () => hideEmojiContainer(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Mesaj",
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            if (messageController.text.isEmpty) {
                              print("Empty Message");
                            } else {
                              setState(() {
                                messages.insert(0, {
                                  "data": 1,
                                  "message": messageController.text
                                });
                              });
                              response(messageController.text);
                              messageController.clear();
                            }
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                        )),
                    style: context.smRegularBodyText
                        .copyWith(color: black26, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding OpenSettings() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: openSettingsScreen,
        child: ProfilePhoto(
          height: 70,
          width: 70,
          type: 'circle',
        ),
      ),
    );
  }

  showKeyboard() => _focusNode.requestFocus();
  hideKeyboard() => _focusNode.unfocus();
  hideEmojiContainer() {
    setState(() {
      showEmojiPicker = false;
    });
  }

  showEmojiContainer() {
    setState(() {
      showEmojiPicker = true;
    });
  }

  emojiContainer() {
    return EmojiPicker(
      bgColor: Colors.white,
      indicatorColor: primaryColor,
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          isWritting = true;
        });
        messageController.text = messageController.text + emoji.emoji;
      },
      recommendKeywords: ["face", "happy", "cool", "sad"],
      numRecommended: 50,
    );
  }

  openSettingsScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileSettings()));
  }
}
