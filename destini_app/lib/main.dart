// ignore_for_file: prefer_const_constructors

import 'package:destini_app/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//TODO: Step 9 d- Create a new storyBrain object from the StoryBrain class.

final StoryBrain _storyB = StoryBrain();


class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/background.png"))),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //TODO: Step 10 d- use the storyBrain to get the first story title and display it in this Text Widget.
                    _storyB.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    //TODO: Step 18 d- Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    setState(() {
                      _storyB.nextStory(1);
                    });
                  },
                  child: Text(
                    //TODO: Step 13 d- Use the storyBrain to get the text for choice 1.
                    _storyB.getChoice1(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ).color(Colors.red),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: _storyB.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      //TODO: Step 19 d- Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      setState(() {
                        _storyB.nextStory(2);
                      });
                    },
                    child: Text(
                      //TODO: Step 14 d- Use the storyBrain to get the text for choice 2.
                      _storyB.getCHoice2(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ).color(Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
