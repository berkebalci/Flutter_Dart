
void main(){
  bool a = true;
  print(!a);
  var object = Ahmet("Ahmet",31,false);
  object.sayMyname();
  
}

abstract class IOgrenci{
  String isim;
  int yas;
  void sayMyname(){
    print("My name is $isim");
  }
  IOgrenci(this.isim,this.yas);
}

class Ahmet extends IOgrenci{
  bool askerlik;
  Ahmet(String isim,int yas,this.askerlik):super(isim,yas);
}

class Ayse extends IOgrenci{
  bool sacitoplumu;
  Ayse(String isim,int yas,this.sacitoplumu):super(isim,yas);
}


