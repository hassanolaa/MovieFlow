import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/Models/SearchCategory.dart';
import 'package:movieapp/Models/Movie.dart';

import '../Models/Controller.dart';
import '../Models/Mainpagedata.dart';
import '../Models/movieslistwidget.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, MainPageData>((ref) {
  return MainPageDataController();
});

final selectedMoviePosterURLProvider = StateProvider<String?>((ref) {
  final _movies = ref.watch(mainPageDataControllerProvider).movies!;
  return _movies.length != 0 ? _movies[0].posterURL() : null;
});

class Main extends ConsumerWidget {
  late var _selectedMoviePosterURL;

  late MainPageDataController _mainPageDataController;
  late MainPageData _mainPageData;

  TextEditingController? _searchTextFieldController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _mainPageDataController =
        ref.watch(mainPageDataControllerProvider.notifier);
    _mainPageData = ref.watch(mainPageDataControllerProvider);
    _selectedMoviePosterURL = ref.watch(selectedMoviePosterURLProvider);

    _searchTextFieldController = TextEditingController();

    _searchTextFieldController!.text = _mainPageData.searchText!;

    return mainScreen(
      mainpagedata: _mainPageData,
      mainPageDataController: _mainPageDataController,
    );
  }
}

class mainScreen extends StatefulWidget {
  mainScreen({
    super.key,
    required this.mainpagedata,
    required this.mainPageDataController,
  });
  MainPageData? mainpagedata;
  MainPageDataController? mainPageDataController;

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  TextEditingController? _searchTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(alignment: Alignment(0, -0.85), children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              )),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 65.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 24, 43, 50),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.white, width: 1.w)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchTextFieldController,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          print(value);
                          widget.mainPageDataController?.updateTextSearch(value);
                        },
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 120.w,
                    ),
                    Expanded(
                      child: DropdownButton(
                        icon: Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                        ),
                        dropdownColor: Color.fromRGBO(16, 24, 43, 50),
                        value: widget.mainpagedata?.searchCategory,
                        onChanged: (dynamic _value) =>
                            _value.toString().isNotEmpty
                                ? widget.mainPageDataController
                                    ?.updateSearchCategory(_value)
                                : null,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              SearchCategory.popular,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: SearchCategory.popular,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              SearchCategory.upcoming,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: SearchCategory.upcoming,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              SearchCategory.none,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: SearchCategory.none,
                          ),
                        ],
                      ),
                    )
                    // IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,))
                  ],
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.83,
                child: movieslistmodel( widget.mainpagedata!),
              )
            ],
          ),
        ]));
  }
}
