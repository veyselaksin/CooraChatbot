import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/button.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/models/onboarding_models.dart';
import 'package:flutter_chatbot_coora/screens/signIn.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: onboarding(),
    );
  }
}

class onboarding extends StatefulWidget {

  @override
  _onboardingState createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  PageController _pageController =
      new PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:size.height*.6,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    OnBoard onboard = items[index];
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(onboard.imageURL),
                            height: size.height*.4,
                          ),
                          SizedBox(height: 20,),
                      
                            AutoSizeText(
                              onboard.description,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20, 
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                          ),
                        ],
                      ),
                    );
                  },
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) => getIndicator(index)),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height*.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/onboard_bottom_item.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(text: "Atla", textColor: black26, color: Colors.white, fontSize: 20, function: openLoginPage,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int page) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == page) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: (currentPage == page) ? primaryColor : secondaryColor,
      ),
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  void openLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
  }


}
