import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled6/Product%20Resuorces.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> profileData = {};
  Map<String, dynamic> summaryData = {};

  void fetchProfileData() {
    ProductResourcess profile = ProductResourcess();
    Map<String, dynamic> jsonData = jsonDecode(profile.userdatas);
    profileData = jsonData['BARB0KIMXXX'][0]['decrypted_data']['Account']['Profile']['Holders']['Holder'];
    summaryData= jsonData['BARB0KIMXXX'][0]['decrypted_data']['Account']['Summary'];

  }

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var size=const SizedBox(height: 5,);
    var sized=const SizedBox(height: 15,);
    var style=const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20);
    var styles=TextStyle(fontWeight: FontWeight.bold,color: Colors.teal.shade700,fontSize: 18);
    var container=Container(width: double.infinity,color: Colors.black,height: 2,);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registered-Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name".toUpperCase(),style: style,),
              size,
              Text(
                profileData["name"] ?? "",
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Date Of Birth".toUpperCase(),style: style),
              size,
              Text(
                profileData["dob"] ?? "",
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Mobile No".toUpperCase(),style: style),
              size,
              Text(
                profileData["mobile"] ?? "",
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Address".toUpperCase(),style: style),
              size,
              Text(
                profileData["address"] ?? "",
                style: styles,
              ),
              sized,
              container,
              size,
              Text("E-mail".toUpperCase(),style: style),
              size,
              Text(
                profileData["email"] ?? "",
                style: styles,
              ),
              sized,
              container,
              size,
              Text("PAN Card".toUpperCase(),style: style),
              size,
              Text(
                profileData["pan"] ?? "",
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Current Balance".toUpperCase(),style: style),
              size,
              Text(
                'INR ${summaryData["currentBalance"]}',
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Bank".toUpperCase(),style: style),
              size,
              Text(
                '${summaryData["branch"]}',
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Account Type".toUpperCase(),style: style),
              size,
              Text(
                '${summaryData["type"]}',
                style: styles,
              ),
              sized,
              container,
              size,
              Text("Current Balance".toUpperCase(),style: style),
              size,
              Text(
                'INR ${summaryData["currentBalance"]}',
                style: styles,
              ),
              sized,
              container,
            ],
          ),
        ),
      ),
    );
  }
}
