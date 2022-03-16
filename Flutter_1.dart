import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //Ana sınıf yapısı burasıdır.
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Aslında bu yapılar darttaki bildiğimiz fonksiyon yapısı babacım :)
    return MaterialApp(
      title: 'Cool App',
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
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: "Cool App 38"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //Hot reoladta MyHomePage tekrardan yaratılır.
  MyHomePage({Key? key, required this.title}) : super(key: key);
  int _counter2 = 0;

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
  _MyHomePageState() {
    print("My home page state yaratılıyor");
  }

  @override
  void initState() {
    super
        .initState(); //Hot reload yaptığımızda state'i koruduğundan dolayı counter değeri yapılmadan önceki değerini koruyor.
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  int _counter = 0; //Genel counter Değişkenimiz.



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

  void _incrementCounter2() {
    setState(() {
      widget._counter2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //Bu widget uygulamanın temel yapısını oluşturur ve ekranı düzenlemekten sorumludur.
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: Icon(Icons.account_balance), //En sol üstteki ikon
        actions: [
          //Üst kısmın sağ tarafındaki şeyler
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print("Remove Bitch");
            },
          ),
          //Böyle yaptığımızda bu iki icon birbirlerine çok yakın oluyorlar.
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _incrementCounter();
              print("Eksiye bastik");
            },
          )
          //Alt+Enter yapıtığımızda widgetlarla oynayabiliyoruz.
        ],
      ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Sayac("$_counter", ilkdeger: 5),



            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20, //Bunları ben girdim.
                  fontWeight: FontWeight.w900,
                  height: 13),
            ),
            Yazi("Stateless Widget =  Sayimiz: $_counter"),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              //Bir text'i basılabilir bir buton haline dönüştürücez
              onPressed: () {
                print("Giral'a basildi ");
                _incrementCounter(); //'Giral' butonuna bastığımızda ekrandaki sayı artacak.
                _incrementCounter2();
                //Not:Eğer _counter++ deseydik o zaman artışı Giral'a basarak göremezdik.
              },
              child: const Text(
                "Giral",
              ),
            ),
            Text(
              "${widget._counter2 + 1}",
              style: Theme.of(context)
                  .textTheme
                  .headline3, //Burdak sayı her Hot reload yapıldığında default değerine dönüyor çünkü
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        //Biz ne zaman düğmeye(Artı gibi şeye) bu fonksiyon çağrılıyor
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        currentIndex: 1, //Bu değerde hangi iconda olduğumuzu gösteriyor.

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Bir"),
          BottomNavigationBarItem(
              //Bu ifadelerle ekranın altına iki adet icon ekliyoruz.
              icon: Icon(Icons.add),
              label: "Iki"),
        ],
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  final String sayi;

  const Yazi(this.sayi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Yazidaki build çalişti");
    return Text(sayi);
  }
}

class Sayac extends StatefulWidget {
  final String sayi2;

  final int ilkdeger;

  const Sayac(this.sayi2, {Key? key, required this.ilkdeger}) : super(key: key);

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi3 = 0;

  @override
  void initState() {
    super.initState();
    sayi3 = widget.ilkdeger; //Bu da farklı bir yöntemdir.
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            sayi3++;
          });
        },
        child: Text(
            "Sayi2: ${widget.sayi2} Sayi3: $sayi3")); //Önemli!!!Stateful widgetlarda field'a ulaşmak için widget.field şeklindeki yapıyı kullanmalıyız.
  }
}
