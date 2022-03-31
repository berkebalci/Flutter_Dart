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
        body: MeyveBilgisi(
            baslik: baslik,
            liste: liste,
            yeniMeyveEklee: yeniMeyveEkle1,
            meyvecikarr: MeyveCikar,
            child:
            Stack( //Stackin birde fit diye bir parametresi vardır.Normalde bu parametreinin
              //**değeri Stack.loose'dır.
                fit: StackFit.expand, //StackFit.expand dediğimizde ekranın ortasının tamamını kaplamaktır.
                children: [
                ArkaPlan(),
                Positioned(
                    child: Meyve(),
                    top: 40,
                    left:50,
                right: 50,),
                  Positioned( //Böylece ekrana adapteli bir widget oluşturduk.
                      bottom: 50,
                      right: 5,
                      left: 5,
                      child: MeyveEkleme())
        ])
    )








    ); //Önemli!!!Stateful widgetlarda field'a ulaşmak için widget.field şeklindeki yapıyı kullanmalıyız.
  }
}

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
  final void Function(String yenimeyve) yeniMeyveEklee; //Dartta da gördüğümüz gibi fonksiyonda parametre olabiliyormuş.
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
    return Column(
        mainAxisSize: MainAxisSize.min,
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
        //mainAxisAlligment ile sütünun dikey başlangıç konumunu ayarlayabiliriz.
        crossAxisAlignment: CrossAxisAlignment.center,

        //crossAxisAllignment ile sütünün yatay başlangıç konumunu ayarlayabiliriz.
        //mainAxisSize: MainAxisSize.min, >>>Bu parametreyi doldurduğumuzda yukarıdaki crossaxis ve mainaxis'in bir anlamı kalmayacak
        children: <Widget>[
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 20,
              ),
              Text(
                "${Meyvebilgisi.baslik}",
                textScaleFactor: 2,
              ),
              //textScaleFactor parametresi text'in büyüklüğünü ayarlamamızı sağlar.
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 20,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            //Row'un yataylığını ayarlıyor
            crossAxisAlignment: CrossAxisAlignment.start,
            //Row'un dikeyliğini ayarlıyor
            mainAxisSize: MainAxisSize
                .min, //Bu değeri verdiğimide row olabilecek minimum alanı kapsayacak
            //!!!Ayrıca yukarıdaki crossaxis ve mainaxis'in bir anlamı kalmayacak
          )
          //Eğer mainAxisSize parametresini doldurmazsak Row kaplayabileceği maksimum alanı kaplar.
          ,
          Meyve_Listesi(),



        ]);
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
    return Column(
      children: [
        TextField(
          controller: Controller,
          onChanged: (value) {
            setState(() {
              //Burası bir nevi hot reload işlevi görüyor.
              //TextField'a bir şey yazdığımızda
            });
          },
        ),
        ElevatedButton(
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


        /*Row(
        mainAxisAlignment: MainAxisAlignment.center, //Flexible ve Expanded
        children: [
            Expanded(
                child: Text("Merhaba")),
            Flexible(
                child: Text("Merhaba")),
            Text("Merhaba"),
            Spacer(),
             Text("Merhaba"),
            Text("Merhaba"),

          ],*/
        ]);
  }
}

class ArkaPlan extends StatelessWidget {
  const ArkaPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

              padding: const EdgeInsets.symmetric(horizontal:6,vertical: 6),
              color: Colors.amber,
              child: Padding( //Padding widget'ı sardığı widegtın etrafına boşluk bırakır.
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical:15),
                child: Container(
                  color: Colors.red,
                  //SizedBox Container'ı gerdiğinden dolayı burdaki değerler işe yaramıyor.
                  width: 50,
                  height: 100,
                  child: Text(
                    "Beybi",

                    textAlign: TextAlign.right, //Center widget'ı ile bunun bir anlamı yok.
                  ),
                ),
              ),
            );



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

class YaziAlani extends StatefulWidget {
  const YaziAlani({Key? key}) : super(key: key);

  @override
  State<YaziAlani> createState() => _YaziAlaniState();
}

class _YaziAlaniState extends State<YaziAlani> {
  final yazialani_controller = TextEditingController();
  @override
  void dispose(){
    yazialani_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged:(value){
          setState(() {


          });
        },
          controller: yazialani_controller,);
      }

  }


