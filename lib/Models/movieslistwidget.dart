import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/Models/Mainpagedata.dart';
import 'package:movieapp/Models/Movie.dart';
import 'package:movieapp/Models/moviewidget.dart';

Widget movieslistmodel(MainPageData mainpagedata) {
  final List<Movie> _movies = mainpagedata.movies!;

  if (_movies.length != 0) {
    print(7);
    return ListView.builder(
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 20, right: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => moviewidget(_movies[index].backdropURL(), _movies[index].posterURL(), _movies[index].name!, _movies[index].rating!, _movies[index].releaseDate!, _movies[index].description!, _movies[index].language!, _movies[index].isAdult!)));
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 130.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            image: NetworkImage(_movies[index].posterURL()),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 150.w,
                              child: Text(
                                _movies[index].name!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              _movies[index].rating.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          "${_movies[index].language} | R: ${_movies[index].isAdult} | ${_movies[index].releaseDate!}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          _movies[index].description!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          maxLines: 9,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  } else {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.white,
    ));
  }
}
