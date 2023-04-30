import 'package:flutter/material.dart';
import 'package:wordpress_api/wordpress_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Of Love',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'test',),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  bool isPassword= true;

  void wordpress_posts() async {
    //print('Clickeed2222');

    final api = WordPressAPI('copticchurch.online');
    print(api.site);

    final res = await api.posts.fetch();
    print(res.toString());//data.toString());
    for (final post in res.data as List<Post>) {
      print(WPUtils.parseHtml(post.title));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Expanded(
             flex: 3,
             child: Container(
               width: width,
               height: 300,
               child: Center(
                 child: Image.asset('assets/LoveHP.png'),
               ),
             ),
           ),
            Expanded(
              flex: 4,
              child: Container(
                width: width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight:Radius.circular(50)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign In ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800)),
                      const SizedBox(height: 25,),
                      Container(
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration.collapsed(hintText: 'Email Address'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isPassword,
                                    decoration: InputDecoration.collapsed(hintText: ' Password'),
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  if(isPassword){
                                    setState(() {
                                      isPassword= false;
                                    });
                                  }else{
                                    setState(() {
                                      isPassword = true;
                                    });
                                  }
                                  print(isPassword);

                                }, icon:const Icon(Icons.remove_red_eye))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Container(
                          child: Row(
                            children: [
                              Text('Forget Password?'),
                            ],
                          )
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        width: width,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red,
                        ),
                        child: MaterialButton(
                          onPressed: (){
                            print('Clickeed');
                            wordpress_posts();
                          },
                          child: Text('Sign In',style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

