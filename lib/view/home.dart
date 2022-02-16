import 'package:contact/model/usersListModel.dart';
import 'package:contact/services/apiGetServices.dart';
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
            child: FutureBuilder(
                future: ApiGetServices().userList(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<UsersList?> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemBuilder: (
                        BuildContext context,
                        index,
                      ) {
                        var users = snapshot.data!.data![index];
                        return GestureDetector(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (
                                    context,
                                  ) =>
                                      Details(index: index,),
                                ),
                              )),
                          child: SizedBox(
                            child: Row(children: [
                              CircleAvatar(
                                radius: 30.r,
                                backgroundImage:  const NetworkImage(
                               "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg",
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      users.name!,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 23.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                   Text(
                                    users.work!,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100.w,
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
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      ),
    );
  }
}
