import 'package:contact/view/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 24.h,
          ),
          child: ListView.separated(
            itemBuilder: (
              BuildContext context,
              index,
            ) {
              return GestureDetector(
                onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (
                        context,
                      ) =>
                          Details(),
                    ),
                  )),
                child: SizedBox(
                  child: Row(children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const AssetImage(
                        "assets/demo.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abcd",
                          style: TextStyle(
                            fontSize: 23.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Text(
                          "Plumber",
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    const Icon(
                      Icons.message,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ]),
                ),
              );
            },
            separatorBuilder: (
              BuildContext context,
              index,
            ) =>
                SizedBox(
              height: 40.h,
            ),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
