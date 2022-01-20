import 'package:flutter/material.dart';
import 'package:suitmedia_test/core/config/ui_helper.dart';
import '../../core/config/api.dart';
import '../../core/config/styles.dart';
import '../../ui/widgets/def_app_bar.dart';
import 'package:dio/dio.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  Dio dio = Dio();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  int _page = 1;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List _users = [];

  late ScrollController _controller;

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      Response resp = await dio.get(Api.getUser + '1' + Api.perPage);
      _users = resp.data['data'];
    } catch (e) {
      throw Exception('error $e');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1;
      try {
        Response resp =
            await dio.get(Api.getUser + _page.toString() + Api.perPage);
        final List fetchedPosts = resp.data['data'];
        if (fetchedPosts.length > 0) {
          setState(() {
            _users.addAll(fetchedPosts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (e) {
        throw Exception('error $e');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  Widget allUser(BuildContext ctx) {
    return _isFirstLoadRunning
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: primaryColor,
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    controller: _controller,
                    itemCount: _users.length,
                    itemBuilder: (_, index) {
                      return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 0),
                          color: Colors.white,
                          elevation: 0.5,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            onTap: () => Navigator.pop(
                                context, _users[index]['first_name']),
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(_users[index]['avatar'])),
                            title: Text(_users[index]['first_name'],
                                style: Styles.bodyStyle),
                            subtitle: Text(_users[index]['email'],
                                style: Styles.smallStyle),
                          ));
                    }),
              ),
              if (_isLoadMoreRunning == true)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: greyColor,
                    ),
                  ),
                ),
              if (_hasNextPage == false)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  color: primaryColor,
                  child: const Center(
                    child: Text(
                      'Data telah diambil semua',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefAppBar(title: "Third Screen"),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async {
            _firstLoad();
            _controller = ScrollController()..addListener(_loadMore);
          },
          child: allUser(context)),
    );
  }
}


// by rafiknurf