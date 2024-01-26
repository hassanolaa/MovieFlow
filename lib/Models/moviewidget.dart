import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/Models/movieslistwidget.dart';

Widget moviewidget(String backImg, String posterImg, String title, num rating,
    String releaseDate, String description, String language, bool isAdult) {
  return Scaffold(
    body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.85,
            image: NetworkImage('$backImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: double.infinity,
                height: 350.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$posterImg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.r),
                    bottomRight: Radius.circular(100.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        IconButton(
                            onPressed: () {
                              
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 25.dg,
                            )),
                        SizedBox(
                          width: 210.w,
                        ),
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo2.png"),
                                fit: BoxFit.cover),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 170.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130.w,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_outlined,
                              color: Colors.white,
                              size: 80.dg,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '$title',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "$rating",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Language',
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        language.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Release Date',
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '$releaseDate',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Adult',
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      if (isAdult == false) ...{
                        Icon(
                          Icons.no_adult_content_outlined,
                          color: Colors.green,
                          size: 25.dg,
                        ),
                      } else ...{
                        Icon(
                          Icons.dangerous_outlined,
                          color: Colors.red,
                          size: 25.dg,
                        ),
                      }
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 310.w,
                child: Text(
                  '$description',
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        )),
  );
}
