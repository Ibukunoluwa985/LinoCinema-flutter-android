import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:linocinema/models/explore_api.dart';
import 'package:linocinema/models/movies_api.dart';
import 'package:linocinema/models/tvshows_api.dart';
import 'package:linocinema/services/ad_manager.dart';
import 'package:linocinema/services/network_connectivity.dart';
import 'package:linocinema/ui/screens/explores/explore_screen.dart';
import 'package:linocinema/ui/screens/home_screen.dart';
import 'package:linocinema/ui/screens/movies/movies_screen.dart';
import 'package:linocinema/ui/screens/settings/settings_screen.dart';
import 'package:linocinema/ui/screens/tvshows/tvshows_screen.dart';
import 'package:provider/provider.dart';
import 'package:linocinema/services/app_theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(testDeviceIds: ['${AdMobService().getAdMobAppId()}']);
  runApp(ChangeNotifierProvider<DarkThemeProvider>(
    create: (_) => new DarkThemeProvider(),
    child: Consumer<DarkThemeProvider>(
      builder: (context, theme, _) => Phoenix(
        child: MaterialApp(
          theme: theme.getTheme(),
          debugShowCheckedModeBanner: false,
          title: "LinoCinema",
          home: PageWrapperSlider(theme: theme),
        ),
      ),
    ),
  ));
}

class PageWrapperSlider extends StatefulWidget {
  final DarkThemeProvider theme;

  const PageWrapperSlider({Key key, this.theme}) : super(key: key);

  @override
  _PageWrapperSliderState createState() => _PageWrapperSliderState();
}

class _PageWrapperSliderState extends State<PageWrapperSlider> {
  PageController pageController;
  // page index
  int pageIndex = 0;
  // dark theme provider
  DarkThemeProvider _theme;
  // explore list
  List explores = [];
  // Movies list
  List movies = [];
  // tvshows list
  List tvshows = [];
  // loading state
  bool isLoading = true;

  // explores api setup
  Future<void> setupExploresApi() async {
    ExploresApi exploresInstance = ExploresApi();
    await exploresInstance.exploresApi(context);
    if (exploresInstance.explores == null) {
      explores = [];
    } else {
      setState(() {
        isLoading = false;
        explores = exploresInstance.explores;
      });
    }
  }

  // movies api setup
  Future<void> setupMoviesApi() async {
    MoviesApi moviesInstance = MoviesApi();
    await moviesInstance.moviesApi(context);
    if (moviesInstance.movies == null) {
      movies = [];
    } else {
      setState(() {
        isLoading = false;
        movies = moviesInstance.movies;
      });
    }
  }

  // tvshows api setup
  Future<void> setupTvshowApi() async {
    TvshowsApi tvshowsInstance = TvshowsApi();
    await tvshowsInstance.tvshowApi(context);
    if (tvshowsInstance.tvshows == null) {
      tvshows = [];
    } else {
      setState(() {
        isLoading = false;
        tvshows = tvshowsInstance.tvshows;
      });
    }
  }

  // explores refresh
  Future<void> _exploresRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      setupExploresApi();
    });
  }

  // movies refresh
  Future<void> _moviesRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      setupMoviesApi();
    });
  }

  // tvshows refresh
  Future<void> _tvshowsRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      setupMoviesApi();
    });
  }

  @override
  void initState() {
    super.initState();
    // check internet connectivity
    checkConnectivity(context);
    // init of states
    pageController = PageController();
    _theme = widget.theme;
    setupExploresApi();
    setupMoviesApi();
    setupTvshowApi();
  }

  @override
  void dispose() {
    super.dispose();
    // dispose of states
    pageController.dispose();
  }

  // no change of page
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  // on tap of page change
  onTap(int pageIndex) {
    int _pageMainIndex = pageIndex - 1;
    pageController.jumpToPage(_pageMainIndex);
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Home(explores, movies, tvshows, isLoading, _exploresRefresh),
          Movies(movies, tvshows, isLoading, _moviesRefresh),
          Tvshows(tvshows, movies, isLoading, _tvshowsRefresh),
          Explore(explores, movies, tvshows, isLoading, _exploresRefresh),
          Settings(theme: _theme),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              label: "Movies",
              icon: Icon(
                Icons.movie,
              )),
          BottomNavigationBarItem(
              label: "Tvshows",
              icon: Icon(
                Icons.tv,
              )),
          BottomNavigationBarItem(
              label: "Explore",
              icon: Icon(
                Icons.explore,
              )),
          BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(
                Icons.settings,
              )),
        ],
      ),
    );
  }
}
