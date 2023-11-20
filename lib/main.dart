import 'package:flutter/material.dart';
import 'package:shree_cement/my_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isOpened = false;
  List<Map<String, dynamic>> recordLen = [
    {
      "rec": "10",
    },
    {
      "rec": "20",
    },
    {
      "rec": "30",
    },
    {
      "rec": "40",
    },
    {
      "rec": "50",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Row(
          children: [
            Image.asset(
              "assets/images/shreelogo.png",
              height: 50,
              width: 50,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Shree",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cement",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: appBody(),
    );
  }

  Widget navigationDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.red.shade900,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/shreelogo.png",
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Shree",
                          style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Cement",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                vSpace(15),
                const Text("Navigation Menu", style: TextStyle(color: Colors.white, fontSize: 21),),
              ],
            )
          ),
          vSpace(10),
          menuItem(Icons.dashboard, "Dashboard", null),
          InkWell(
              onTap: (){
                if(isOpened==false){
                  isOpened=true;
                  setState(() {

                  });
                }else{
                  isOpened=false;
                  setState(() {

                  });
                }
              },
              child: menuItem(Icons.account_box_outlined, "User Onboarding", Icons.keyboard_arrow_down)),
          Visibility(
              visible: isOpened,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                menuItem(Icons.subdirectory_arrow_right, "Add New User", null, icnClr: Colors.grey, textClr: Colors.red.shade900),
                menuItem(Icons.subdirectory_arrow_right, "Manage users", null, icnClr: Colors.grey, textClr: Colors.red.shade900),
          ],)),
          menuItem(Icons.bar_chart_sharp, "Master Data", Icons.keyboard_arrow_down),
          menuItem(Icons.sticky_note_2_sharp, "Pre-Bid Process", null),
          menuItem(Icons.handyman, "Bidding Process", Icons.keyboard_arrow_down),
          menuItem(Icons.map_outlined, "Token Mapping", null),
          menuItem(Icons.person, "Profile", null),
          menuItem(Icons.logout, "Logout", null),
        ],
      ),
    );
  }

  Widget appBody(){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Manage Users", style: TextStyle(color: Colors.black, fontSize: 21),),
            vSpace(10),
            Row(
              children: [
                Expanded(
                  child: Container(
                      color: Colors.red.shade700,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text("User List", style: TextStyle(color: Colors.white, fontSize: 17)),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [

                            Expanded(
                              flex: 7,
                              child: Row(
                                children: [
                                  const Text("Display", style: TextStyle(color: Colors.black, fontSize: 14)),
                                  hSpace(6),
                                  SizedBox(
                                    height: 50,
                                    width: 80,
                                    child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        hintText: '10',
                                        hintStyle: TextStyle(fontSize: 13),
                                        filled: true,
                                        fillColor: Colors.white,
                                        errorStyle: TextStyle(color: Colors.red),
                                      ),
                                      items: recordLen.map((map) {
                                        return DropdownMenuItem(
                                          value: map['rec'],
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(map['rec']),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {

                                      },
                                    ),
                                  ),
                                  hSpace(6),
                                  const Text("records", style: TextStyle(color: Colors.black, fontSize: 14)),
                                ],
                              ),
                            ),

                            const Text("Search", style: TextStyle(color: Colors.black, fontSize: 14)),
                            hSpace(10),
                            const SizedBox(
                              height: 20,
                              width: 100,
                              child: TextField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        borderSide: BorderSide(width: 1, color: Colors.grey)),
                                  )
                              ),
                            ),



                        ],
                            )

                        ),
                      )),

              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: columnHeading("Sr. No.")),
                Expanded(flex: 1, child: columnHeading("Name", dropdown: true)),
                Expanded(flex: 1, child: columnHeading("Role", dropdown: true)),
                Expanded(flex: 1, child: columnHeading("Organization", dropdown: true)),
                Expanded(flex: 1, child: columnHeading("Geography", dropdown: true)),
                Expanded(flex: 1, child: columnHeading("Status", dropdown: true)),
                Expanded(flex: 1, child: columnHeading("Actions")),
              ],
            ),
            allUsers(),
            Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: const Text("Showing 1 to 10 of 23 entries", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                          ),

                          Row(
                            children: [
                              navBox(boxWidth : 70, text: "Previous"),
                              navBox(boxWidth : 25, text: "1", txtClr: Colors.white, bgClr: Colors.red.shade900),
                              navBox(boxWidth : 25, text: "2", txtClr: Colors.red.shade900),
                              navBox(boxWidth : 25, text: "3", txtClr: Colors.red.shade900),
                              navBox(boxWidth : 50, text: "Next", txtClr: Colors.red.shade900),
                            ],
                          ),



                        ],
                      )

                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget allUsers(){
    return Column(
      children: [
        userRow(sno: "1", name: "Abhijeet Joshi", role: "Admin", org: "Organisation 1", geo: "Geography 1", status: "Active"),
        userRow(sno: "2", name: "User 2", role: "Logistics", org: "Organisation 1", geo: "Geography 1", status: "Active"),
        userRow(sno: "3", name: "User 3", role: "Transporter", org: "Organisation 1", geo: "Geography 2", status: "Active"),
        userRow(sno: "4", name: "User 4", role: "Admin", org: "Organisation 2", geo: "Geography 4", status: "In Active"),
        userRow(sno: "5", name: "User 5", role: "Admin", org: "Organisation 2", geo: "Geography 3", status: "Active"),
        userRow(sno: "6", name: "User 6", role: "Logistics", org: "Organisation 3", geo: "Geography 2", status: "Active"),
        userRow(sno: "7", name: "User 7", role: "Admin", org: "Organisation 1", geo: "Geography 1", status: "In Active"),
        userRow(sno: "7", name: "User 8", role: "Transporter", org: "Organisation 1", geo: "Geography 3", status: "Active"),
        userRow(sno: "7", name: "User 9", role: "Admin", org: "Organisation 3", geo: "Geography 4", status: "Active"),
        userRow(sno: "7", name: "User 10", role: "Admin", org: "Organisation 2", geo: "Geography 2", status: "Active"),
      ],
    );
  }

}
