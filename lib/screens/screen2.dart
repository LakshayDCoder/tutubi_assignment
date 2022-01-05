import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  static const routeName = "/screen-2";

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<String> imageList = [];
  var scrollController = ScrollController();
  var _isLoading = true;
  var _quotaExceeded = false;

  get30Images() async {
    setIsLoading(true);

    print("Getting images");
    const apiKey = "WpU3zZeQbqbti_Cfz8GHjWD3vxUmdVfkB9j8cghpU5I";
    const url =
        "https://api.unsplash.com/photos/random/?client_id=$apiKey&count=9";

    var res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8; Accept-Version: v1',
      },
    );

    if (res.statusCode == 200) {
      var jsonArray = jsonDecode(res.body);
      for (var img in jsonArray) {
        // print(img["urls"]["regular"]);
        imageList.add(img["urls"]["small"]);
      }
    } else {
      _quotaExceeded = true;
    }

    setIsLoading(false);
  }

  setIsLoading(bool val) {
    setState(() {
      _isLoading = val;
    });
  }

  Future getInitData() async {
    imageList.clear();
    await get30Images();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getInitData();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if (!_isLoading) {
            get30Images();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2")),
      body: SafeArea(
        child: _quotaExceeded
            ? const Center(child: Text("Images quota exceeded"))
            : GridView.builder(
                controller: scrollController,
                itemCount: imageList.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  if (index == imageList.length) {
                    return Container(
                      margin: const EdgeInsets.all(12),
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }

                  return imgCard(imageList[index]);
                },
              ),
      ),
    );
  }

  Widget imgCard(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}
