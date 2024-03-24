//
//  CookingModel.swift
//  KaracaApp
//
//  Created by Zeki Baklan on 14.02.2024.
//

import Foundation

var recipesData: [Recipe] = [
  Recipe(
    index: 0,
    cookingName: "PATATES KIZARTMASI",
    cookingTime: "15dk",
    cookingDegrees: "200°C",
    cookingImage: "patateskizartmasi",
    instructions: [
      "Patatesleri iyice yıkadıktan sonra elma dilimi şeklinde kesin.",
      "Daha çıtır olması için soğuk su dolu bir kaba alıp 15 dakika bekletin.",
      "Patatesleri sudan çıkartıp iyice kuruladıktan sonra derin bir kapta zeytinyağı, tuz ve karabiberle harmanlayın.",
      "2 dakika ön ısıtma yaptıktan sonra patatesleri Air Pro Cook haznesine alıp, Air Fry fonksiyonunda 15 dakika boyunca 170 °C derecede pişirin.",
      "Pişme sırasında ara ara patatesleri karıştırın.",
      "15 dakika sonunda hazneyi çıkartıp kırmızı biber ve sarımsak tozunu da ilave edin. Sıcaklık derecesini 180 °C dereceye, süreyi de 7 dakikaya ayarlayıp pişirmeye devam edin.",
      "Pişene kadar bir iki kere daha karıştırın.",
      "Sürenin sonunda çıtır patatesleriniz servise hazırdır.",
    ],
    ingredients: [
      "750gr patates",
      "1 kaşık yağ",
      "1/2 çay kaşığı tuz",
    ], isFavorite: true
  ),

  Recipe(
    index: 1,
    cookingName: "ÇITIR TAVUK ŞERİTLERİ",
    cookingTime: "8dk",
    cookingDegrees: "200°C",
    cookingImage: "citirtavuk",
    instructions: [
      "Tavuk göğsünü 2 cm kalınlığında şeritler halinde kesin.",
      "Yumurtayı, unu ve galeta ununu farklı kaplara koyun ve hepsine azar azar tuz ve karabiber ekleyin.",
      "Her malzemeyi kendi kabının içerisinde karıştırın.",
      "Tavuk parçalarını önce yumurtaya, sonra una, ardından tekrar yumurtaya ve son olarak galeta ununa bulayıp kaplayın.",
      "Air Pro Cook’u Isıtma fonksiyonunda 200 °C'de çalıştırarak 3 dakika ön ısıtma yapın.",
      "Ön ısıtma tamamlanınca hazneyi fırça yardımıyla yağlayın ve tavuk dilimlerini yerleştirin.",
      "Air Fry fonksiyonunda, pişirme sıcaklığını 200 °C dereceye ve pişirme süresini de 8 dakikaya ayarlayıp pişirme işlemine başlayın.",
      "Tavuklar pişmeye başladığında üzerlerini bir fırça yardımıyla yağlayın.",
      "Her 2-3 dakikada bir hazneyi çıkarıp tavukları sallayarak ters düz edin.",
      "İşleme tavuk parçaları kızarana kadar yaklaşık 8 dakika daha devam edin ve sıcak olacak şekilde servis edin.",
    ],
    ingredients: [
      "300 gram tavuk göğsü 2 adet yumurta",
      "1 su bardağı un",
      "1 su bardağı galeta unu",
      "1 çay kaşığı tuz",
      "1 çay kaşığı karabiber 3 yemek kaşığı sıvı yağ",
    ], isFavorite: true
  ),

  Recipe(
    index: 2,
    cookingName: "ELMA DİLİMİ PATATES",
    cookingTime: "20dk",
    cookingDegrees: "200°C",
    cookingImage: "elmadilimpatates",
    instructions: [
      "2 orta boy kızartmalık patates",
      "2 yemek kaşığı zeytinyağı",
      "Tuz",
      "Karabiber",
      "1 çay kaşığı kırmızı toz biber",
      "1/2 çay kaşığı sarımsak toz",
    ],
    ingredients: [
      "Patatesleri iyice yıkadıktan sonra elma dilimi şeklinde kesin.",
      "Daha çıtır olması için soğuk su dolu bir kaba alıp 15 dakika bekletin.",
      "Patatesleri sudan çıkartıp iyice kuruladıktan sonra derin bir kapta zeytinyağı, tuz ve karabiberle harmanlayın.",
      "2 dakika ön ısıtma yaptıktan sonra patatesleri Air Pro Cook haznesine alın.",
      "Air Fry fonksiyonunda 15 dakika boyunca 170 °C derecede pişirin.",
      "Pişme sırasında ara ara patatesleri karıştırın.",
      "5 dakika sonunda hazneyi çıkartıp kırmızı biber ve sarımsak tozunu da ilave edin.",
      "Sıcaklık derecesini 180 °C dereceye,süreyi de 7 dakikaya ayarlayıp pişirmeye devam edin.",
      "Pişene kadar bir iki kere daha karıştırın. Sürenin sonunda çıtır patatesleriniz servise hazırdır.",
    ], isFavorite: true
  ),

  Recipe(
    index: 3,
    cookingName: "KIZARMIŞ TAVUK KANAT",
    cookingTime: "20dk",
    cookingDegrees: "200°C",
    cookingImage: "citirtavukkanat",
    instructions: [
      "10 adet kanat",
      "1 bardak kefir",
      "2 büyük yumurta",
      "1/2 bardak un",
      "1/2 bardak mısır nişastası",
      "3 yemek kaşığı toz kırmızı biber",
      "1/2 yemek kaşığı sarımsak tozu",
      "1 yemek kaşığı soğan tozu 2 çay kaşığı tuz",
      "2 çay kaşığı kereviz tozu 2 çay kaşığı toz karabiber",
      "2 çay kaşığı hardal tozu 2 çay kaşığı toz zencefil",
      "1 çay kaşığı kuru kekik",
      "1 çay kaşığı kuru fesleğen",
    ],
    ingredients: [
      "Büyükçe bir kapta yumurtalar ve kefiri iyice karışana kadar çırpın.",
      "Başka bir kapta un, mısır nişastası, toz kırmızı biber, sarımsak tozu, soğan, tozu, kereviz tozu, karabiber, hardal tozu, toz zencefil, kekik ve fesleğeni karıştırın.",
      "Air Pro Cook’u Isıtma fonksiyonuna, pişirme sıcaklığını 190 °C dereceye ve pişirme süresini 3 dakikaya ayarlayıp çalıştırarak ön ısıtma yapın.",
      "Tavukları kefir karışımına daldırın.",
      "Tavuklar kefir karışımında ne kadar uzun süre kalırlarsa o kadar iyi olur.",
      "Tercihen bir gece önceden buzdolabında marine edebilirsiniz.",
      "Tavuk parçalarını kefir karışımına batırıp çıkarttıktan sonra fazlasını akıtıp, un ve baharat karışımına iyice bastırın. Fazla kalan unu silkeleyin.",
      "Ön ısıtma süresinin sonunda pişirme haznesini fırça yardımıyla yağlayın.",
      "Tavukları güzelce hazneye yerleştirin.",
      "Air Fry fonksiyonunu seçip pişirme sıcaklığını 190 °C dereceye ve pişirme süresini 30 dakikaya ayarlayıp pişirmeye başlayın.",
      "Pişirme süresinin yarısında tavukları ters yüz edip, fırçayla her taraflarını yağladıktan sonra pişirmeye devam edin.",
      "Dışları çıtır olup, içleri yeterince pişinceye kadar pişirmeye devam edin.",
    ], isFavorite: false
  ),
]
