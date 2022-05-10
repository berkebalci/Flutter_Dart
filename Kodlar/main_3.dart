// ignore_for_file: prefer_const_constructors

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
      home: MyHomePage(title: "berkebalcikayseri"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //Hot reoladta MyHomePage tekrardan yaratılır.
  MyHomePage({Key? key, required this.title}) : super(key: key);

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

  var liste = ["Muz", "Elma", "Armut"];
  var baslik = "Meyveler";

  void yeniMeyveEkle1(String yenimeyve) {
    setState(() {
      //Hocanın yaptığı
      liste.add(yenimeyve);
    });
  }

  void MeyveCikar(String meyve) {
    setState(() {
      //Benim yaptığım
      liste.remove(meyve);
    });
  }

  @override
  void initState() {
    super
        .initState(); //Hot reload yaptığımızda state'i koruduğundan dolayı counter değeri yapılmadan önceki değerini koruyor.
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    print("Did update widget calistigaga");
    super.didUpdateWidget(oldWidget);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
          child: MeyveBilgisi(
            baslik: baslik,
            liste: liste,
            yeniMeyveEklee: yeniMeyveEkle1,
            meyvecikarr: MeyveCikar,
            child: Meyve(),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                print("Resme basildi");
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("images/ata.jpg"),
              ),
            )
          ],
        ));
  }
}

//Önemli!!!Stateful widgetlarda field'a ulaşmak için widget.field şeklindeki yapıyı kullanmalıyız.

class MeyveBilgisi extends InheritedWidget {
  const MeyveBilgisi({
    Key? key,
    required this.baslik,
    required this.liste,
    required this.yeniMeyveEklee,
    required this.meyvecikarr,
    required Widget child,
  }) : super(key: key, child: child);

  final String baslik;
  final List<String> liste;
  final void Function(String yenimeyve)
  yeniMeyveEklee; //Dartta da gördüğümüz gibi fonksiyonda parametre olabiliyormuş.
  final void Function(String yenimeyve) meyvecikarr;

  static MeyveBilgisi of(BuildContext context) {
    //Bu metod ile birlikte ağacın altındaki widgetlar fieldlara erişebilecek.
    final MeyveBilgisi? result =
    context.dependOnInheritedWidgetOfExactType<MeyveBilgisi>();
    assert(result != null, 'No MeyveBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MeyveBilgisi old) {
    //Yenileme gibi durumlarda eski MeyveBilgisi ile
    //**yeni MeyveBilgisi arasında kıyaslama yapar,eğer gerek varsa rebuild yapar.
    return baslik != old.baslik ||
        liste != old.liste ||
        yeniMeyveEklee != old.yeniMeyveEklee ||
        meyvecikarr != old.meyvecikarr;
  }
}

class Meyve extends StatelessWidget {
  const Meyve({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meyvebilgisi = MeyveBilgisi.of(context); //Artık InheritedWidget olan
    //**meyve bilgisinin fieldlarına ulaşabileceğiz.
    return Center(
        child: Container(
          color: Colors.yellow,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          //Böylece Daire içine bir fotoğraf koyduk.
                          backgroundImage: AssetImage("images/ata.jpg"),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Expanded(
                          child: const Text(
                            "Berke Balci Flutter",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        //Buda RichText olarak geçiyor
                        """
               Hakkımda:
               1* 
               2*
               """,
                        style: TextStyle(fontSize: 16),
                      ),

                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Flutter projesi ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: " Atatürk",
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        TextSpan(
                            text: "Slm cnm",
                            style: TextStyle(color: Colors.purpleAccent)),
                      ])),
                    ],
                  ),

                  ListView(

                  )

                  ,Container(
                    height:
                    200 //Yüksekliği arttırdıkça yukarıdaki widget'ı yukarı attı.
                    ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //spaceAround >>> Widgetlar arası boşluk bırakır.Satırı ful genişletmez.
                      //betweenAround >>>
                      children: [
                        MaterialButton(
                          minWidth: 100,
                          color: Colors.red,
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: () {
                              print("Berke");
                            },
                          ),
                          onPressed: () {
                            print("Mavi buton.");
                          },
                        ),
                        MaterialButton(
                          minWidth: 120,
                          color: Colors.red,
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: () {
                              print("Berke");
                            },
                          ),
                          onPressed: () {
                            print("Mavi buton.");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("images/ata.jpg")),

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
                ]),
          ),
        ));
  }
}

class MeyveEkleme extends StatefulWidget {
  const MeyveEkleme({
    Key? key,
  }) : super(key: key);

  @override
  State<MeyveEkleme> createState() => _MeyveEklemeState();
}

class _MeyveEklemeState extends State<MeyveEkleme> {
  final Controller =
  TextEditingController(); //TextField'ı kontrol etmek için bunu oluşturduk.
  @override
  void dispose() {
    // TODO: implement dispose
    Controller.dispose(); //dispose() metodu widget'ı yok edicek
    //**bu yüzden ekstradan widget ile alakalı controller nesnesini biz yok edicez.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Meyvebilgisi = MeyveBilgisi.of(context);
    return Column(children: [
      TextField(
        controller: Controller,
        onChanged: (value) {
          setState(() {
            //Burası bir nevi hot reload işlevi görüyor.
            //TextField'a bir şey yazdığımızda
          });
        },
      ),
      Align(
        //Bu layout widget'ı ile butonun ekrandaki konumunu değiştirdik.
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
            onPressed: Controller.text == ""
                ? null
                : () {
              final yeniMeyve = Controller.text;
              Meyvebilgisi.yeniMeyveEklee(yeniMeyve);
              Controller.text = "";
            },

            /*setState(() { //Değişikliğin hot reload olmadan sağlıklı bir biçimde ekrana yansıması için setState fonksiyonunu kullanmalıyız.
              liste.add("Armut");*/
            child: Text("Yeni meyve")),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            final meyve = Controller.text;
            Meyvebilgisi.meyvecikarr(meyve);
            Controller.text = "";
          });
        },
        child: Icon(Icons.remove_circle_outlined),
      ),
      Row(
        children: [Text("Selam")],
      )
    ]);
  }
}

class Meyve_Listesi extends StatelessWidget {
  const Meyve_Listesi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meyvebilgisi = MeyveBilgisi.of(context);
    return Column(
      children: [
        for (var i in Meyvebilgisi.liste) Text("$i"),
      ],
    );
  }
}
