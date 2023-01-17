import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.brown,
          contentTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController search = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: const Text('Searchbar Animation',style: TextStyle(color: Colors.white,fontSize: 15)),
      backgroundColor: Colors.green,
      centerTitle: true,
    ),
    body:Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.redAccent,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                'Searchbar Animation',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 85.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: Container(
                height: 660.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SearchBarAnimation(
                        textEditingController: search,
                        isOriginalAnimation: true,
                        enableKeyboardFocus: true,
                        cursorColour: Colors.green,
                        onExpansionComplete: () {
                          debugPrint('do something just after searchbox is opened.');
                        },
                        onCollapseComplete: () {
                          debugPrint('do something just after searchbox is closed.');
                        },
                        onPressButton: (isSearchBarOpens) {
                          debugPrint('do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                        },
                        trailingWidget: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.green,
                        ),
                        secondaryButtonWidget: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black,
                        ),
                        buttonWidget: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }
}