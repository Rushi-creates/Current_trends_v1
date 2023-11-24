import '../SCREENS/sell_screen.dart';
import '../WIDGETS/common_widgets.dart';
import '../WIDGETS/generic_buttons.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Edit your profile :",
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 102, 92),
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: DisplayProfileWidget(
                          gradient1: Color.fromARGB(183, 0, 92, 83),
                          gradient2: Colors.teal,
                          radiusScale: 0.18,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Your loation displayed here  ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            GreenButton3(
                              onTap: null,
                              text: 'Get location',
                              height: 45,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //
                MyTextField(label: 'Your name'),
                MyTextField(label: 'Email'),
                MyTextField(label: 'Phone Number'),
                MyTextField(label: 'Your Username'),
                MyTextField(label: 'Your Bio'),
                SizedBox(height: 20),
                GreenButton(
                  onTap: null,
                  text: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
