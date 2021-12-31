import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  var a;
  a = 4;

  final List<Object> liste = [
    1,
    2,
    3,
    "Berke"
  ]; //'final' keywordunu kullandığımızda veri tiplerinin içinde değişiklikler yapabiliyorken;
  //'const' keywordunu kullandığımızda bu değişiklikleri yapamıyoruz.(Eleman çıkarma,ekleme vs...)
  //Listeye Eleman Ekleme

  liste.add(7);
  print(liste[-1]); //Dart dilinde index - olamıyor Pythondan farklı olarak.
  /*liste.addAll(["Balci"]); //addAll methodunda parantez içerisine verdiğimiz iterable'ın illa liste olmasına gerek yoktur.
  liste.addAll(["Kayseri"]); //Gördüğümüz gibi..
  print(liste);
  */

  //Listeden Eleman Çıkarma
  var liste_2 = [4, 5, 6];
  /*
  liste_2.remove(4);
  print("2.liste: $liste_2");

  print("İlk eleman çift mi:${liste_2.first.isEven}");  //Even >>Cift sayi
  print("Sonuncu eleman tek mi:${liste_2.last.isOdd}");  //Odd>> Tek sayi

  print(liste_2.length);

  liste_2.removeAt(0);
  print("Liste2'nin son hali:$liste_2");*/

  Set kume = {1, 2, 3}; //Kümelerin özellikleri pythondakine benzer.
  kume.add(5); //Dart dilinde set'ler itreable objelerdir.
  print(kume);
  kume.remove(2);
  print(kume);
  kume.removeAll([1, 3]);
  print(kume);

  for (var x in kume) {
    print(x);
  }
  Set kume_2 = {5, 6, 7};
  //print(kume_2[0]);  //Kumelerde soldaki gibi elemanlara indeks yardımıyla ulaşamıyoruz çünkü sıralı bir yapıya sahip değiller.
  print("Küme 1 ile Küme arasındaki ortak elemanlar:${kume_2.intersection(kume)}");
  print(kume_2.length);
  Map harita = {1: "Bir", 2: "İki", 3: "Üç"};
  harita[1] = "OTUZ";
  harita.addAll({"Rex":"Pati"});
  if (harita.isEmpty){
    print("yazik");
  }
  else{
    print("Helal Aslanım");
  }
  print(harita);
  //Bir key'in olup olmadığına bakma
  if (harita.containsKey("Rex")){
    print("Bu satir çalıştı");
  }
  for (var x in harita.entries){ //Pythondaki gibi direkt olarak maplarin(pythondaki dict) üzerinde gezemiyoruz.
    print(x);
  }


  /*
  for (var x in liste){
    print(x);
  }

  for (var i = 0;i < 5;i++){
    print("$i kadar BRO var");
  }

  do {
    print("$a******************");
    a += 1;

  }
  while (a < 4);
}*/
}
