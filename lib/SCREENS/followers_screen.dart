import 'package:ct_v1/SERIALIZERS/models/follow_account.dart';

import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  final String appbarTitle;
  const FollowersScreen({
    super.key,
    required this.appbarTitle,
  });

  @override
  Widget build(BuildContext context) {
    FollowAccount dummyFollowAccount = FollowAccount(
      id: 1,
      my_profile_fk: 123,
      other_profile_fk: 456,
      username: "dummy_follow_account",
      imageUrl: "empty",
    );
    return Scaffold(
      //@
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 106, 116, 250),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          appbarTitle, //give here appBar title
          style: const TextStyle(
            // color: Colors.black,
            color: Color.fromARGB(255, 106, 116, 250),

            // fontWeight: FontWeight.bold
            // fontSize: 15,
          ),
        ),
      ),

      //@

      body: Column(children: [
        const SizedBox(height: 20),
        FollowersListTile(singleObj: dummyFollowAccount),
        FollowersListTile(singleObj: dummyFollowAccount),
        FollowersListTile(singleObj: dummyFollowAccount),
      ]),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                // @ Tiles                                  */
/* -------------------------------------------------------------------------- */

class FollowersListTile extends StatelessWidget {
  final singleObj;
  const FollowersListTile({
    super.key,
    required this.singleObj,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 245, 245, 245),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 223, 226, 255),
              // spreadRadius: 1,
              // blurRadius: 1,
              // offset: Offset(0, 0),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              singleObj.imageUrl == 'empty'
                  ? 'https://i.pravatar.cc/400'
                  : singleObj.imageUrl,
            ),
          ),
          title: Text(
            singleObj.username,
            style: const TextStyle(
              color: Color.fromARGB(255, 106, 116, 250),
              // fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: const Color.fromARGB(255, 106, 116, 250).withOpacity(0.6),
            size: 18,
          ),
          onTap: () {
            // do something when the list tile is tapped
          },
        ),
      ),
    );
  }
}
