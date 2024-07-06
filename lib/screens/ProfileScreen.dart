import 'dart:convert';
import 'package:flutter/material.dart';

import '../resources/product resuorces.dart';

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
    profileData = jsonData['BARB0KIMXXX'][0]['decrypted_data']['Account']
        ['Profile']['Holders']['Holder'];
    summaryData =
        jsonData['BARB0KIMXXX'][0]['decrypted_data']['Account']['Summary'];
  }

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var size = const SizedBox(
      height: 5,
    );
    var sized = const SizedBox(
      height: 15,
    );
    var style = const TextStyle(
        fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18);
    var styles = TextStyle(
        fontWeight: FontWeight.w400, color: Colors.grey.shade700, fontSize: 16);
    var container = Container(
      width: double.infinity,
      color: Colors.black,
      height: 2,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
              ListTile(
                title: Text(
                  "Name".toUpperCase(),
                  style: style,
                ),
                subtitle: Text(
                  profileData["name"] ?? "",
                  style: styles,
                ),
                leading: Icon(
                  Icons.person,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title: Text("Date Of Birth".toUpperCase(), style: style),
                subtitle: Text(
                  profileData["dob"] ?? "",
                  style: styles,
                ),
                leading: Icon(
                  Icons.date_range_rounded,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title:Text("Mobile No".toUpperCase(), style: style),
                subtitle: Text(
                  profileData["mobile"] ?? "",
                  style: styles,
                ),
                leading: Icon(
                  Icons.phone,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title: Text("Address".toUpperCase(), style: style),
                subtitle: Text(
                  profileData["address"] ?? "",
                  style: styles,
                ),
                leading: Icon(
                  Icons.location_city,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title:   Text("E-mail".toUpperCase(), style: style),
                subtitle: Text(
                  profileData["email"] ?? "",
                  style: styles,
                ),
                leading: Icon(
                  Icons.email,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title: Text("PAN Card".toUpperCase(), style: style),
                subtitle: Text(
                  profileData["pan"] ?? "",
                  style: styles,
                ),
                leading: Icon(
                  Icons.pan_tool,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title:  Text("Account Type".toUpperCase(), style: style),
                subtitle: Text(
                  '${summaryData["type"]}',
                  style: styles,
                ),
                leading: Icon(
                  Icons.switch_account,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),

              sized,
              // container,
              size,
              ListTile(
                title:  Text("Bank".toUpperCase(), style: style),
                subtitle: Text(
                  '${summaryData["branch"]}',
                  style: styles,
                ),
                leading: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized,
              // container,
              size,
              ListTile(
                title:  Text("Current Balance".toUpperCase(), style: style),
                subtitle:Text(
                  'INR ${summaryData["currentBalance"]}',
                  style: styles,
                ),
                leading: Icon(
                  Icons.account_balance,
                  size: 28,
                  color: Colors.teal.shade700,
                ),
              ),
              sized
              //  container,
            ],
          ),
        ),
      ),
    );
  }
}
