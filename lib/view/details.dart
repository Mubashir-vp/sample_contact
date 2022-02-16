import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
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
          padding: EdgeInsets.symmetric(vertical: 12.0.w, horizontal: 20.h),
          child: Column(children: [
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
              "Alma",
              style: TextStyle(
                fontSize: 23.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            tile(
              title: "UserID",
              subtitle: "adhf",
              iconData: Icons.person,
            ),
            SizedBox(
              height: 20.h,
            ),
            tile(
              title: "Role",
              subtitle: "Plumber",
              iconData: FontAwesomeIcons.suitcase,
            ),
            SizedBox(
              height: 20.h,
            ),
            tile(
              title: "Mobile",
              subtitle: "123456789",
              iconData: Icons.phone,
            ),
            SizedBox(
              height: 20.h,
            ),
            tile(
              title: "Email",
              subtitle: "Alma@gamil.com",
              iconData: Icons.message,
            ),
          ]),
        ),
      ),
    );
  }
}
