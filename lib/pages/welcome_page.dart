import 'package:flutter/material.dart';
import 'package:pacman/components/rounded_button.dart';
import 'package:pacman/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pacman/homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _firestore = FirebaseFirestore.instance;
  String? roomID;
  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to PacMan',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter room ID'),
                    onChanged: (value) {
                      roomID = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: RoundedButton(
                    title: 'Join the Room',
                    onPressed: () {},
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 5.0,
            ),
            child: Text(
              'OR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 5.0,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: kTextFieldDecoration.copyWith(
                        labelText: 'Enter your name'),
                    onChanged: (value) {
                      roomID = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: RoundedButton(
                    title: 'Create a Room',
                    onPressed: () {
                      if (roomID != '') {
                        _firestore.collection('room').add({
                          'roomID': '$roomID\'s_room',
                          'player1': roomID,
                          'player2': '',
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(
                              playerName: roomID!,
                            )));
                      }
                    },
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
