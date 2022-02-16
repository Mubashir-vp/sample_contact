import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/usersListModel.dart';
import '../services/apiGetServices.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.index}) : super(key: key);
  tile({
    required var title,
    required var subtitle,
    required IconData iconData,
  }) {
    return ListTile(
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
            ),
            child: Text(title,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                )),
          ),
          Text(
            subtitle,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      trailing: Icon(
        iconData,
        size: 26,
        color: Colors.blue,
      ),
    );
  }

  int index;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left_outlined,
                color: Colors.blue,
                size: 26,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Contacts",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.0.w,
            horizontal: 20.h,
          ),
          child: FutureBuilder(
              future: ApiGetServices().userList(),
              builder: (
                BuildContext context,
                AsyncSnapshot<UsersList?> snapshot,
              ) {
                if (snapshot.hasData) {
                  var user = snapshot.data!.data![index];

                  return Column(children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          50.r,
                        ),
                        child: Image.asset(
                          "assets/demo.jpg",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      user.name!,
                      style: TextStyle(
                        fontSize: 23.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      children: [
                        tile(
                          title: "UserID",
                          subtitle: user.id,
                          iconData: Icons.person,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        tile(
                          title: "Role",
                          subtitle: user.work,
                          iconData: FontAwesomeIcons.suitcase,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        tile(
                          title: "Mobile",
                          subtitle: user.mobNum,
                          iconData: Icons.phone,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        tile(
                          title: "Email",
                          subtitle: user.email,
                          iconData: Icons.message,
                        ),
                      ],
                    ),
                  ]);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
