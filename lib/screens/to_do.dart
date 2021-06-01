import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/helpers/database_service.dart';
import 'package:flutter_chatbot_coora/models/todo.dart';
import 'package:flutter_chatbot_coora/screens/profile_and_settings.dart';
import 'package:flutter_chatbot_coora/widgets/alert_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  bool isComplete=false;
  TextEditingController addItemController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () async {
          final action = await Dialogs.addItem(context, addItemController);
          if(action==DialogAction.yes){
            if(addItemController.text.isNotEmpty){
              await DatabaseService().createNewTodo(addItemController.text.trim());
            }
            addItemController.clear();
          }else if(action==DialogAction.no){
            addItemController.clear();
          }
        },
      ),
      body: StreamBuilder<List<Todo>>(
        stream: DatabaseService().listTodos(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          List<Todo> todos=snapshot.data;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(function:openSettingsScreen,),
                  SizedBox(
                    height: context.highValue,
                  ),
                  SettingTitles(
                    title: "Yapılacaklar Listesi",
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: primaryColor,
                                ),
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: primaryColor,
                                  value: todos[index].isComplete,
                                  onChanged: (bool value) {
                                    setState(() {
                                      todos[index].isComplete=value;
                                    });
                                   if(todos[index].isComplete==true){
                                     DatabaseService().completTask(todos[index].uid);
                                   }else{
                                     DatabaseService().nonCompleteTask(todos[index].uid);
                                   }
                                  },
                                ),
                              ),
                              Text(
                                todos[index].title,
                                style: context.smRegularBodyText
                                    .copyWith(fontSize: 16, color: primaryColor),
                              ),
                              Spacer(),
                              IconButton(onPressed: () async{
                                final action= await Dialogs.dialogAction(context, "Öğeyi sil!", "Öğeyi silmek istiyor musunuz?", "action");
                                if(action==DialogAction.yes){
                                  await DatabaseService().removeTodo(todos[index].uid);
                                }else{
                                  return print("sdafsa");
                                }
                              }, icon: Icon(Icons.delete), iconSize: 30, color: Colors.red,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  openSettingsScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileSettings()));
  }
}
