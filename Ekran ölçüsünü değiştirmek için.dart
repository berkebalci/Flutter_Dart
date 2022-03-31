 @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final mq = MediaQuery.of(context); //MediaQuery widget'ına obje oluşturduk.
    final screenSize = mq.size; //App'in çalıştığı ekranın boyutunu aldık(432.0,816.0)
    final desiredWidth = 300; //istenen genişlik.
    final ratio = screenSize.width / desiredWidth ;
    return FractionallySizedBox(
          widthFactor: 1 / ratio ,
          heightFactor: 1 / ratio,
          child: Transform.scale( //Bu üçlü widget ittifakı telefonun boyutlarına göre kendini ayar-
                                  //**layabilen bir yapı ortaya çıkartır.
            scale: ratio,
            child: MediaQuery(data: mq.copyWith(
              viewInsets: mq.viewInsets.copyWith(
                bottom: mq.viewInsets.bottom / ratio,
              )
            ),
              child: Scaffold(
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
                      print("Artiya Bastik");
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
                       //StackFit.expand dediğimizde ekranın ortasının tamamını kaplamaktır.
                      children: [

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








          ),
        ),
      ),
    ); //Önemli!!!Stateful widgetlarda field'a ulaşmak için widget.field şeklindeki yapıyı kullanmalıyız.
  }
}
