import 'dart:math';

class RandomPerson {
  List<String> _firstNameList = [
    'Jale',
    'Ali̇',
    'Mahmut',
    'Mansur',
    'Gamze',
    'Mi̇raç',
    'Yücel',
    'Kubi̇lay',
    'Hayati̇',
    'Müge',
    'Bi̇rsen',
    'Serdal',
    'Bünyami̇n',
    'Özgür',
    'Ferdi̇',
    'Reyhan',
    'İlhan',
    'Gülşah',
    'Nalan',
    'Semi̇h',
    'Ergün',
    'Fati̇h',
    'Şenay',
    'Serkan',
    'Emre',
    'Bahatti̇n',
    'Irazca',
    'Hati̇ce',
    'Bariş',
    'Rezan',
    'Fati̇h',
    'Fuat',
    'Gökhan'
  ];
  List<String> _lastNameList = [
    'ŞEN',
    'KANDEMİR',
    'ÇEVİK',
    'ERKURAN',
    'TÜTEN',
    'ÖZTÜRK',
    'YÜZBAŞIOĞLU',
    'VURAL',
    'YÜCEL',
    'SÖNMEZ',
    'ERTEKİN',
    'DEDE',
    'UYANIK',
    'ASLAN',
    'AKBULUT',
    'ORHON',
    'UZ',
    'YAVUZ',
    'ERDEM',
    'KULAÇ',
    'KAYA',
    'SELVİ',
    'AKPINAR',
    'ABACIOĞLU',
    'ÇAY',
    'IŞIK',
    'ÖZER',
    'ÖZDEMİR',
    'ÖZTÜRK',
    'TAHTACI',
    'BÜYÜKCAM',
    'KULAKSIZ',
    'AKSEL'
  ];

  String get firstName => _firstNameList[Random().nextInt(_firstNameList.length)];
  String get lastName => _lastNameList[Random().nextInt(_lastNameList.length)];
  int get grade => Random().nextInt(100+1);

}
