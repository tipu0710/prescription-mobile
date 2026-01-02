import '../../domain/entities/dosage_suggestions.dart';
import '../../domain/entities/localized_string.dart';

const Map<String, String> banglaDigitMap = {
  '0': '০',
  '1': '১',
  '2': '২',
  '3': '৩',
  '4': '৪',
  '5': '৫',
  '6': '৬',
  '7': '৭',
  '8': '৮',
  '9': '৯',
};

String convertToBanglaDigits(String text) {
  return text.split('').map((char) => banglaDigitMap[char] ?? char).join('');
}

// --- Dosage Lists ---

const List<LocalizedString> suppository = [
  LocalizedString(en: "1+1+1", bn: "১+১+১"),
  LocalizedString(en: "1+0+1", bn: "১+০+১"),
  LocalizedString(en: "0+1+1", bn: "০+১+১"),
  LocalizedString(en: "1+0+0", bn: "১+০+০"),
  LocalizedString(en: "0+0+1", bn: "০+০+১"),
  LocalizedString(en: "1+1+0", bn: "১+১+০"),
  LocalizedString(en: "0+1+0", bn: "০+১+০"),
];

const List<LocalizedString> oralSolid = [
  LocalizedString(en: "1+1+1", bn: "১+১+১"),
  LocalizedString(en: "1+0+1", bn: "১+০+১"),
  LocalizedString(en: "0+1+1", bn: "০+১+১"),
  LocalizedString(en: "1+0+0", bn: "১+০+০"),
  LocalizedString(en: "0+0+1", bn: "০+০+১"),
  LocalizedString(en: "1+1+0", bn: "১+১+০"),
  LocalizedString(en: "0+1+0", bn: "০+১+০"),
  LocalizedString(en: "2+2+2", bn: "২+২+২"),
  LocalizedString(en: "2+0+2", bn: "২+০+২"),
  LocalizedString(en: "0+2+2", bn: "০+২+২"),
  LocalizedString(en: "2+0+0", bn: "২+০+০"),
  LocalizedString(en: "0+0+2", bn: "০+০+২"),
  LocalizedString(en: "2+2+0", bn: "২+২+০"),
  LocalizedString(en: "0+2+0", bn: "০+২+০"),
  LocalizedString(en: "0.5+0.5+0.5", bn: "০.৫+০.৫+০.৫"),
  LocalizedString(en: "0.5+0+0.5", bn: "০.৫+০+০.৫"),
  LocalizedString(en: "0+0.5+0.5", bn: "০+০.৫+০.৫"),
  LocalizedString(en: "0.5+0+0", bn: "০.৫+০+০"),
  LocalizedString(en: "0+0+0.5", bn: "০+০+০.৫"),
  LocalizedString(en: "0.5+0.5+0", bn: "০.৫+০.৫+০"),
  LocalizedString(en: "0+0.5+0", bn: "০+০.৫+০"),
  LocalizedString(en: "3+0+0", bn: "৩+০+০"),
  LocalizedString(en: "0+3+0", bn: "০+৩+০"),
  LocalizedString(en: "0+0+3", bn: "০+০+৩"),
  LocalizedString(en: "3+3+3", bn: "৩+৩+৩"),
  LocalizedString(en: "4+0+0", bn: "৪+০+০"),
  LocalizedString(en: "0+4+0", bn: "০+৪+০"),
  LocalizedString(en: "0+0+4", bn: "০+০+৪"),
  LocalizedString(en: "4+4+4", bn: "৪+৪+৪"),
  LocalizedString(en: "5+0+0", bn: "৫+০+০"),
  LocalizedString(en: "0+5+0", bn: "০+৫+০"),
  LocalizedString(en: "0+0+5", bn: "০+০+৫"),
  LocalizedString(en: "5+5+5", bn: "৫+৫+৫"),
  LocalizedString(en: "1+1+1+1", bn: "১+১+১+১"),
  LocalizedString(en: "2+2+2+2", bn: "২+২+২+২"),
];

const List<LocalizedString> oralLiquid = [
  LocalizedString(en: "1 tsp + 1 tsp + 1 tsp", bn: "১ চামচ + ১ চামচ + ১ চামচ"),
  LocalizedString(en: "1 tsp + 0 + 1 tsp", bn: "১ চামচ + ০ + ১ চামচ"),
  LocalizedString(en: "0 + 1 tsp + 1 tsp", bn: "০ + ১ চামচ + ১ চামচ"),
  LocalizedString(en: "1 tsp + 0 + 0", bn: "১ চামচ + ০ + ০"),
  LocalizedString(en: "0 + 0 + 1 tsp", bn: "০ + ০ + ১ চামচ"),
  LocalizedString(en: "1 tsp + 1 tsp + 0", bn: "১ চামচ + ১ চামচ + ০"),
  LocalizedString(en: "0 + 1 tsp + 0", bn: "০ + ১ চামচ + ০"),
  LocalizedString(en: "2 tsp + 2 tsp + 2 tsp", bn: "২ চামচ + ২ চামচ + ২ চামচ"),
  LocalizedString(en: "2 tsp + 0 + 2 tsp", bn: "২ চামচ + ০ + ২ চামচ"),
  LocalizedString(en: "0 + 2 tsp + 2 tsp", bn: "০ + ২ চামচ + ২ চামচ"),
  LocalizedString(en: "2 tsp + 0 + 0", bn: "২ চামচ + ০ + ০"),
  LocalizedString(en: "0 + 0 + 2 tsp", bn: "০ + ০ + ২ চামচ"),
  LocalizedString(en: "2 tsp + 2 tsp + 0", bn: "২ চামচ + ২ চামচ + ০"),
  LocalizedString(en: "0 + 2 tsp + 0", bn: "০ + ২ চামচ + ০"),
  LocalizedString(en: "3 tsp + 3 tsp + 3 tsp", bn: "৩ চামচ + ৩ চামচ + ৩ চামচ"),
  LocalizedString(en: "0 + 3 tsp + 3 tsp", bn: "০ + ৩ চামচ + ৩ চামচ"),
  LocalizedString(en: "3 tsp + 0 + 3 tsp", bn: "৩ চামচ + ০ + ৩ চামচ"),
  LocalizedString(en: "3 tsp + 3 tsp + 0", bn: "৩ চামচ + ৩ চামচ + ০"),
  LocalizedString(en: "3 tsp + 0 + 0", bn: "৩ চামচ + ০ + ০"),
  LocalizedString(en: "0 + 3 tsp + 0", bn: "০ + ৩ চামচ + ০"),
  LocalizedString(
    en: "1 tsp + 1 tsp + 1 tsp + 1 tsp",
    bn: "১ চামচ + ১ চামচ + ১ চামচ + ১ চামচ",
  ),
  LocalizedString(
    en: "2 tsp + 2 tsp + 2 tsp + 2 tsp",
    bn: "২ চামচ + ২ চামচ + ২ চামচ + ২ চামচ",
  ),
  LocalizedString(
    en: "1/2 tsp + 1/2 tsp + 1/2 tsp",
    bn: "১/২ চামচ + ১/২ চামচ + ১/২ চামচ",
  ),
  LocalizedString(en: "1/2 tsp + 0 + 1/2 tsp", bn: "১/২ চামচ + ০ + ১/২ চামচ"),
  LocalizedString(en: "0 + 1/2 tsp + 1/2 tsp", bn: "০ + ১/২ চামচ + ১/২ চামচ"),
  LocalizedString(en: "1/2 tsp + 0 + 0", bn: "১/২ চামচ + ০ + ০"),
  LocalizedString(en: "0 + 0 + 1/2 tsp", bn: "০ + ০ + ১/২ চামচ"),
  LocalizedString(en: "1/2 tsp + 1/2 tsp + 0", bn: "১/২ চামচ + ১/২ চামচ + ০"),
  LocalizedString(en: "0 + 1/2 tsp + 0", bn: "০ + ১/২ চামচ + ০"),
  LocalizedString(
    en: "1.5 tsp + 1.5 tsp + 1.5 tsp",
    bn: "১.৫ চামচ + ১.৫ চামচ + ১.৫ চামচ",
  ),
  LocalizedString(en: "1.5 tsp + 0 + 1.5 tsp", bn: "১.৫ চামচ + ০ + ১.৫ চামচ"),
  LocalizedString(en: "0 + 1.5 tsp + 1.5 tsp", bn: "০ + ১.৫ চামচ + ১.৫ চামচ"),
  LocalizedString(en: "1.5 tsp + 0 + 0", bn: "১.৫ চামচ + ০ + ০"),
  LocalizedString(en: "0 + 0 + 1.5 tsp", bn: "০ + ০ + ১.৫ চামচ"),
  LocalizedString(en: "1.5 tsp + 1.5 tsp + 0", bn: "১.৫ চামচ + ১.৫ চামচ + ০"),
  LocalizedString(en: "0 + 1.5 tsp + 0", bn: "০ + ১.৫ চামচ + ০"),
  LocalizedString(
    en: "2.5 tsp + 2.5 tsp + 2.5 tsp",
    bn: "২.৫ চামচ + ২.৫ চামচ + ২.৫ চামচ",
  ),
  LocalizedString(en: "2.5 tsp + 0 + 2.5 tsp", bn: "২.৫ চামচ + ০ + ২.৫ চামচ"),
  LocalizedString(en: "0 + 2.5 tsp + 2.5 tsp", bn: "০ + ২.৫ চামচ + ২.৫ চামচ"),
  LocalizedString(en: "2.5 tsp + 0 + 0", bn: "২.৫ চামচ + ০ + ০"),
  LocalizedString(en: "0 + 0 + 2.5 tsp", bn: "০ + ০ + ২.৫ চামচ"),
  LocalizedString(en: "2.5 tsp + 2.5 tsp + 0", bn: "২.৫ চামচ + ২.৫ চামচ + ০"),
  LocalizedString(en: "0 + 2.5 tsp + 0", bn: "০ + ২.৫ চামচ + ০"),
];

const List<LocalizedString> topical = [
  LocalizedString(
    en: "Apply to whole body after bath except head and face.",
    bn: "গোসলের পর মাথা এবং মুখমণ্ডল ব্যতীত সমস্ত গায়ে মাখবেন।",
  ),
  LocalizedString(
    en: "Apply to affected area.",
    bn: "আক্রান্ত স্থানে ব্যাবহার করবেন।",
  ),
  LocalizedString(
    en: "Apply to affected area 1 time daily.",
    bn: "দিনে ১ বার আক্রান্ত স্থানে ব্যাবহার করবেন।",
  ),
  LocalizedString(
    en: "Apply to affected area 2 times daily.",
    bn: "দিনে ২ বার আক্রান্ত স্থানে ব্যাবহার করবেন।",
  ),
  LocalizedString(
    en: "Apply to affected area 3 times daily.",
    bn: "দিনে ৩ বার আক্রান্ত স্থানে ব্যাবহার করবেন।",
  ),
  LocalizedString(
    en: "Apply to affected area 4 times daily.",
    bn: "দিনে ৪ বার আক্রান্ত স্থানে ব্যাবহার করবেন।",
  ),
  LocalizedString(en: "Apply to whole body.", bn: "সমস্ত শরীরে মাখবেন।"),
  LocalizedString(
    en: "Apply to whole body 1 time daily.",
    bn: "দিনে ১ বার সমস্ত শরীরে মাখবেন।",
  ),
  LocalizedString(
    en: "Apply to whole body 2 times daily.",
    bn: "দিনে ২ বার সমস্ত শরীরে মাখবেন।",
  ),
  LocalizedString(
    en: "Apply to whole body 3 times daily.",
    bn: "দিনে ৩ বার সমস্ত শরীরে মাখবেন।",
  ),
  LocalizedString(
    en: "Apply to whole body 4 times daily.",
    bn: "দিনে ৪ বার সমস্ত শরীরে মাখবেন।",
  ),
];

const List<LocalizedString> medicatedBar = [
  LocalizedString(
    en: "Apply to whole body during bath",
    bn: "গোসলের সময় সমস্ত শরীরে মাখবেন",
  ),
  LocalizedString(
    en: "Apply to head during bath",
    bn: "গোসলের সময় মাথায় ব্যাবহার করবেন",
  ),
  LocalizedString(
    en: "Apply to head and whole body during bath",
    bn: "গোসলের সময় মাথায় ও সমস্ত শরীরে ব্যাবহার করবেন",
  ),
];

const List<LocalizedString> mouthwash = [
  LocalizedString(
    en: "Gargle with 2 tsp mixed with equal water 2 times daily",
    bn: "দিনে ২ বার ২ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 1 tsp mixed with equal water 2 times daily",
    bn: "দিনে ২ বার ১ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 3 tsp mixed with equal water 2 times daily",
    bn: "দিনে ২ বার ৩ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 4 tsp mixed with equal water 2 times daily",
    bn: "দিনে ২ বার ৪ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 1 tsp mixed with equal water 1 time daily",
    bn: "দিনে ১ বার ১ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 2 tsp mixed with equal water 1 time daily",
    bn: "দিনে ১ বার ২ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 3 tsp mixed with equal water 1 time daily",
    bn: "দিনে ১ বার ৩ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 4 tsp mixed with equal water 1 time daily",
    bn: "দিনে ১ বার ৪ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 1 tsp mixed with equal water 3 times daily",
    bn: "দিনে ৩ বার ১ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 2 tsp mixed with equal water 3 times daily",
    bn: "দিনে ৩ বার ২ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 3 tsp mixed with equal water 3 times daily",
    bn: "দিনে ৩ বার ৩ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 4 tsp mixed with equal water 3 times daily",
    bn: "দিনে ৩ বার ৪ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 1 tsp mixed with equal water 4 times daily",
    bn: "দিনে ৪ বার ১ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 2 tsp mixed with equal water 4 times daily",
    bn: "দিনে ৪ বার ২ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 3 tsp mixed with equal water 4 times daily",
    bn: "দিনে ৪ বার ৩ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
  LocalizedString(
    en: "Gargle with 4 tsp mixed with equal water 4 times daily",
    bn: "দিনে ৪ বার ৪ চামচ সম পরিমাণ পানির সাথে মিশিয়ে কুলি করুন",
  ),
];

List<LocalizedString> _generateDrops() {
  List<LocalizedString> list = [];
  const banglaNumbers = [
    "০",
    "১",
    "২",
    "৩",
    "৪",
    "৫",
    "৬",
    "৭",
    "৮",
    "৯",
    "১০",
    "১১",
    "১২",
    "১৩",
    "১৪",
    "১৫",
    "১৬",
    "১৭",
    "১৮",
    "১৯",
    "২০",
  ];
  for (int i = 1; i <= 20; i++) {
    for (int j = 1; j <= 6; j++) {
      list.add(
        LocalizedString(
          en: "$i drop${i > 1 ? 's' : ''} $j time${j > 1 ? 's' : ''}",
          bn: "${banglaNumbers[i]} ফোঁটা ${banglaNumbers[j]} বার",
        ),
      );
    }
  }
  return list;
}

final List<LocalizedString> drops = _generateDrops();

List<LocalizedString> _generateImInjection() {
  List<LocalizedString> list = [];
  const banglaNumbers = [
    "০",
    "১",
    "২",
    "৩",
    "৪",
    "৫",
    "৬",
    "৭",
    "৮",
    "৯",
    "১০",
  ]; // Assuming up to 4 needed based on TS loop
  final vials = [1, 2, 3, 4];
  final times = [1, 2, 3, 4];

  for (var v in vials) {
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v vial $t time${t > 1 ? 's' : ''} IM",
          bn: "${banglaNumbers[v]} ভায়াল ${banglaNumbers[t]} বার মাংসপেশীতে দিবেন",
        ),
      );
    }
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v ampoule $t time${t > 1 ? 's' : ''} IM",
          bn: "${banglaNumbers[v]} অ্যাম্পুল ${banglaNumbers[t]} বার মাংসপেশীতে দিবেন",
        ),
      );
    }
  }
  return list;
}

final List<LocalizedString> imInjection = _generateImInjection();

List<LocalizedString> _generateIvInjection() {
  List<LocalizedString> list = [];
  const banglaNumbers = [
    "০",
    "১",
    "২",
    "৩",
    "৪",
    "৫",
    "৬",
    "৭",
    "৮",
    "৯",
    "১০",
  ];
  final vials = [1, 2, 3, 4];
  final times = [1, 2, 3, 4];

  for (var v in vials) {
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v vial $t time${t > 1 ? 's' : ''} IV",
          bn: "${banglaNumbers[v]} ভায়াল ${banglaNumbers[t]} বার শিরাপথে দিবেন",
        ),
      );
    }
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v ampoule $t time${t > 1 ? 's' : ''} IV",
          bn: "${banglaNumbers[v]} অ্যাম্পুল ${banglaNumbers[t]} বার শিরাপথে দিবেন",
        ),
      );
    }
  }
  return list;
}

final List<LocalizedString> ivInjection = _generateIvInjection();

const List<LocalizedString> oralInjection = [
  LocalizedString(en: "1 ampoule orally", bn: "১ অ্যাম্পুল মুখে খাওয়াবেন"),
];

List<LocalizedString> _generateIaInjection() {
  List<LocalizedString> list = [];
  const banglaNumbers = [
    "০",
    "১",
    "২",
    "৩",
    "৪",
    "৫",
    "৬",
    "৭",
    "৮",
    "৯",
    "১০",
  ];
  final vials = [1, 2, 3, 4];
  final times = [1, 2, 3, 4];

  for (var v in vials) {
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v vial $t time${t > 1 ? 's' : ''} intra-articularly",
          bn: "${banglaNumbers[v]} ভায়াল ${banglaNumbers[t]} বার অস্থিসন্ধিতে দিবেন",
        ),
      );
    }
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v ampoule $t time${t > 1 ? 's' : ''} intra-articularly",
          bn: "${banglaNumbers[v]} অ্যাম্পুল ${banglaNumbers[t]} বার অস্থিসন্ধিতে দিবেন",
        ),
      );
    }
  }
  return list;
}

final List<LocalizedString> iaInjection = _generateIaInjection();

List<LocalizedString> _generateScInjection() {
  List<LocalizedString> list = [];
  const banglaNumbers = [
    "০",
    "১",
    "২",
    "৩",
    "৪",
    "৫",
    "৬",
    "৭",
    "৮",
    "৯",
    "১০",
  ];
  final vials = [1, 2, 3, 4];
  final times = [1, 2, 3, 4];

  for (var v in vials) {
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v vial $t time${t > 1 ? 's' : ''} SC",
          bn: "${banglaNumbers[v]} ভায়াল ${banglaNumbers[t]} বার চামড়ার নিচে দিবেন",
        ),
      );
    }
    for (var t in times) {
      list.add(
        LocalizedString(
          en: "$v ampoule $t time${t > 1 ? 's' : ''} SC",
          bn: "${banglaNumbers[v]} অ্যাম্পুল ${banglaNumbers[t]} বার চামড়ার নিচে দিবেন",
        ),
      );
    }
  }
  return list;
}

final List<LocalizedString> scInjection = _generateScInjection();

const List<LocalizedString> infusion = [
  LocalizedString(en: "5 drops/min IV", bn: "শিরাপথে ৫ ফোঁটা/মিনিট"),
  LocalizedString(en: "6 drops/min IV", bn: "শিরাপথে ৬ ফোঁটা/মিনিট"),
  LocalizedString(en: "7 drops/min IV", bn: "শিরাপথে ৭ ফোঁটা/মিনিট"),
  LocalizedString(en: "8 drops/min IV", bn: "শিরাপথে ৮ ফোঁটা/মিনিট"),
  LocalizedString(en: "9 drops/min IV", bn: "শিরাপথে ৯ ফোঁটা/মিনিট"),
  LocalizedString(en: "10 drops/min IV", bn: "শিরাপথে ১০ ফোঁটা/মিনিট"),
  LocalizedString(en: "15 drops/min IV", bn: "শিরাপথে ১৫ ফোঁটা/মিনিট"),
  LocalizedString(en: "20 drops/min IV", bn: "শিরাপথে ২০ ফোঁটা/মিনিট"),
  LocalizedString(en: "25 drops/min IV", bn: "শিরাপথে ২৫ ফোঁটা/মিনিট"),
  LocalizedString(en: "30 drops/min IV", bn: "শিরাপথে ৩০ ফোঁটা/মিনিট"),
  LocalizedString(en: "40 drops/min IV", bn: "শিরাপথে ৪০ ফোঁটা/মিনিট"),
  LocalizedString(
    en: "4 micro drops/min IV",
    bn: "শিরাপথে ৪ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "8 micro drops/min IV",
    bn: "শিরাপথে ৮ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "12 micro drops/min IV",
    bn: "শিরাপথে ১২ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "16 micro drops/min IV",
    bn: "শিরাপথে ১৬ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "20 micro drops/min IV",
    bn: "শিরাপথে ২০ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "24 micro drops/min IV",
    bn: "শিরাপথে ২৪ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "28 micro drops/min IV",
    bn: "শিরাপথে ২৮ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "32 micro drops/min IV",
    bn: "শিরাপথে ৩২ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "36 micro drops/min IV",
    bn: "শিরাপথে ৩৬ মাইক্রো ফোঁটা/মিনিট",
  ),
  LocalizedString(
    en: "40 micro drops/min IV",
    bn: "শিরাপথে ৪০ মাইক্রো ফোঁটা/মিনিট",
  ),
];

const List<LocalizedString> meteredDoseInhaler = [
  LocalizedString(en: "1 puff 1 time", bn: "১ চাপ ১ বার"),
  LocalizedString(en: "1 puff 2 times", bn: "১ চাপ ২ বার"),
  LocalizedString(en: "2 puffs 1 time", bn: "২ চাপ ১ বার"),
  LocalizedString(en: "2 puffs 2 times", bn: "২ চাপ ২ বার"),
  LocalizedString(en: "If shortness of breath occurs", bn: "শ্বাসকষ্ট হলে"),
];

const List<LocalizedString> dpi = [
  LocalizedString(en: "1 cap morning", bn: "১ টি করে সকালে ব্যাবহার করবেন"),
  LocalizedString(
    en: "1 cap morning and night",
    bn: "১ টি করে সকালে এবং রাতে ব্যাবহার করবেন",
  ),
  LocalizedString(
    en: "1 cap morning, noon and night",
    bn: "১ টি করে সকালে, দুপুরে এবং রাতে ব্যাবহার করবেন",
  ),
  LocalizedString(
    en: "Use if shortness of breath occurs",
    bn: "শ্বাসকষ্ট হলে ব্যাবহার করবেন",
  ),
];

// --- Note Helpers ---

const List<LocalizedString> noteForInhaler = [
  LocalizedString(en: "Rinse mouth after use", bn: "ব্যবহারের পর কুলি করবেন"),
];

const List<LocalizedString> noteForEyeDrop = [
  LocalizedString(en: "Apply to right eye", bn: "ডান চোখে ব্যাবহার করবেন"),
  LocalizedString(en: "Apply to left eye", bn: "বাম চোখে ব্যাবহার করবেন"),
  LocalizedString(en: "Apply to both eyes", bn: "উভয় চোখে ব্যাবহার করবেন"),
];

const List<LocalizedString> noteForNasalDrop = [
  LocalizedString(
    en: "Apply to right nostril",
    bn: "ডান পাশের নাকে ব্যাবহার করবেন",
  ),
  LocalizedString(
    en: "Apply to left nostril",
    bn: "বাম পাশের নাকে ব্যাবহার করবেন",
  ),
  LocalizedString(en: "Apply to both nostrils", bn: "উভয় নাকে ব্যাবহার করবেন"),
];

const List<LocalizedString> noteForDissolveInWater = [
  LocalizedString(
    en: "Dissolve in half glass of water",
    bn: "অর্ধেক গ্লাস পানিতে গুলিয়ে খাবেন",
  ),
  LocalizedString(
    en: "Dissolve in 1 glass of water",
    bn: "১ গ্লাস পানিতে গুলিয়ে খাবেন",
  ),
  LocalizedString(
    en: "Dissolve in half liter of water",
    bn: "আধা লিটার পানিতে গুলিয়ে খাবেন",
  ),
  LocalizedString(
    en: "Dissolve in 1 liter of water",
    bn: "১ লিটার পানিতে গুলিয়ে খাবেন",
  ),
];

// --- Notes Map ---

final Map<String, List<LocalizedString>> notes = {
  "Chewable Tablet": [
    const LocalizedString(en: "Chew properly", bn: "চুষে খাবেন"),
  ],
  "Flash Tablet": [
    const LocalizedString(en: "Chew properly", bn: "চুষে খাবেন"),
  ],
  "Chewing Gum Tablet": [
    const LocalizedString(
      en: "Chew slowly",
      bn: "মুখে নিয়ে ধীরে ধীরে চিবাতে হবে",
    ),
  ],
  "Dispersible Tablet": noteForDissolveInWater,
  "Effervescent Powder": noteForDissolveInWater,
  "Effervescent Tablet": noteForDissolveInWater,
  "Buccal Tablet": [
    const LocalizedString(
      en: "Keep inside cheek until dissolved",
      bn: "সম্পূর্ণ গলে না যাওয়া পর্যন্ত গালের ভেতর রাখবেন",
    ),
  ],
  "Sublingual Tablet": [
    const LocalizedString(en: "Place under tongue", bn: "জিহ্বার নিচে রাখবেন"),
  ],
  "Vaginal Tablet": [
    const LocalizedString(
      en: "Use vaginally",
      bn: "মাসিকের রাস্তায় ব্যাবহার করবেন",
    ),
  ],
  "Microgranules": [
    const LocalizedString(
      en: "Swallow with water or orange juice, do not chew",
      bn: "সরাসরি জিভের উপর উপরে ঢেলে পানি বা কমলা রস দিয়ে গিলে ফেলুন, চিবাবেন না",
    ),
    const LocalizedString(
      en: "Mix with yogurt and eat quickly",
      bn: "দইয়ের সাথে মিশিয়ে তা দ্রুত খেয়ে ফেলুন",
    ),
  ],
  "Ear Drop": [
    const LocalizedString(
      en: "Apply to right ear",
      bn: "ডান কানে ব্যাবহার করবেন",
    ),
    const LocalizedString(
      en: "Apply to left ear",
      bn: "বাম কানে ব্যাবহার করবেন",
    ),
    const LocalizedString(
      en: "Apply to both ears",
      bn: "উভয় কানে ব্যাবহার করবেন",
    ),
  ],
  "Nasal Drop": noteForNasalDrop,
  "Viscous Eye Drop": noteForEyeDrop,
  "Ophthalmic Emulsion": noteForEyeDrop,
  "Ophthalmic Gel": noteForEyeDrop,
  "Ophthalmic Ointment": noteForEyeDrop,
  "Ophthalmic Solution": noteForEyeDrop,
  "Ophthalmic Suspension": noteForEyeDrop,
  "Metered-Dose Inhaler (MDI)": noteForInhaler,
  "Metered-Dose Inhaler": noteForInhaler,
  "Dry Powder Inhalation Capsule (DPI)": noteForInhaler,
};

// --- Dosage Form Map ---

final Map<String, List<LocalizedString>> dosageFormMap = {
  "BP Monitor Device": [],
  "Buccal Tablet": oralSolid,
  "Capsule": oralSolid,
  "Capsule (Enteric Coated)": oralSolid,
  "Chewable Tablet": oralSolid,
  "Chewing Gum Tablet": oralSolid,
  "Condom": [],
  "Cream": topical,
  "Dialysis Solution": [],
  "Dispersible Tablet": oralSolid,
  "Dry Powder Inhalation Capsule (DPI)": dpi,
  "Ear Drop": drops,
  "Effervescent Granules": oralSolid,
  "Effervescent Powder": oralSolid,
  "Effervescent Tablet": oralSolid,
  "Emulsion": [], // Handled dynamically
  "Emulsion for infusion": infusion,
  "Flash Tablet": oralSolid,
  "Gel": topical,
  "Glucometer": [],
  "Hand Rub": [],
  "IM Injection": imInjection,
  "IM/IA Injection": [...iaInjection, ...imInjection],
  "IM/IV Injection": [...imInjection, ...ivInjection],
  "IM/SC Injection": [...scInjection, ...imInjection],
  "Injectable Solution (Oral & IM)": [...oralInjection, ...imInjection],
  "Injection": [
    ...imInjection,
    ...ivInjection,
    ...scInjection,
    ...oralInjection,
  ],
  "Insulin Device": [],
  "Intra-articular Injection": iaInjection,
  "Intracameral Injection": [],
  "Intraocular Injection": [],
  "Intraspinal Injection": [],
  "Intratracheal Suspension": [],
  "Intravitreal Injection": [],
  "Irrigation Solution": [],
  "IV Infusion": infusion,
  "IV Injection": ivInjection,
  "IV Injection or Infusion": infusion,
  "IV/SC Injection": [...ivInjection, ...imInjection],
  "Lancet Needle": [],
  "Liquid": [],
  "Long Acting Tablet": oralSolid,
  "Lotion": topical,
  "Medicated Bar": medicatedBar,
  "Metered-Dose Inhaler (MDI)": meteredDoseInhaler,
  "Metered-Dose Inhaler": meteredDoseInhaler,
  "Microgranules": oralSolid,
  "Mouthwash": mouthwash,
  "Multidose Dry Powder Inhaler (MDPI)": [],
  "MUPS Tablet": oralSolid,
  "Nail Lacquer": [],
  "Nasal Drop": drops,
  "Nasal Inhaler": [],
  "Nasal Ointment": [],
  "Nasal Spray": [],
  "Nebuliser Suspension": [],
  "Ocular Spray": [],
  "Ointment": [],
  "Ophthalmic Emulsion": [],
  "Ophthalmic Gel": [],
  "Ophthalmic Ointment": [],
  "Ophthalmic Solution": [],
  "Ophthalmic Suspension": [],
  "Oral Gel": [],
  "Oral Granules": [],
  "Oral Paste": [],
  "Oral Powder": [],
  "Oral Soluble Film": [],
  "Oral Solution": oralLiquid,
  "Oral Suspension": oralLiquid,
  "OROS Tablet": oralSolid,
  "Pediatric Drops": drops,
  "Pen Needle": [],
  "Powder for Injection": [],
  "Powder for Solution": [],
  "Powder for Suspension": [],
  "Rectal Ointment": [],
  "Rectal Saline": [],
  "Respirator Solution": [],
  "Retard Tablet": oralSolid,
  "SC Injection": scInjection,
  "Scalp Lotion": [],
  "Scalp Ointment": [],
  "Scalp Solution": [],
  "Shampoo": [],
  "Solution": [],
  "Solution for Inhalation": [],
  "Sprinkle Capsule": oralSolid,
  "Sublingual Tablet": oralSolid,
  "Suppository": suppository,
  "Surgical Scrub": [],
  "Suspension": oralLiquid,
  "Syrup": oralLiquid,
  "Tablet": oralSolid,
  "Tablet (Enteric Coated)": oralSolid,
  "Tablet (Delayed Release)": oralSolid,
  "XR Tablet (Wax Matrix)": oralSolid,
  "Tablet (Wax Matrix)": oralSolid,
  "Test strip": [],
  "Topical Gel": [],
  "Topical Powder": [],
  "Topical Solution": [],
  "Topical Spray": [],
  "Topical Suspension": [],
  "Transdermal Patch": [],
  "Vaginal Cream": [],
  "Vaginal Gel": [],
  "Vaginal Pessary": [],
  "Vaginal Suppository": suppository,
  "Vaginal Tablet": oralSolid,
  "Viscoelastic Solution": [],
  "Viscous Eye Drop": [],
};

// --- Taking Times ---

const List<LocalizedString> takingTimes = [
  LocalizedString(en: "1 hour before meal", bn: "খাবার এক ঘণ্টা আগে"),
  LocalizedString(en: "30 minutes before meal", bn: "খাবার আধা ঘণ্টা আগে"),
  LocalizedString(en: "After meal", bn: "খাবার পর"),
];

const List<String> infusionVolumes = [
  '3L',
  '2.5L',
  '2L',
  '1.5L',
  '1L',
  '500ml',
  '250ml',
  '100ml',
];

const List<String> oralDosageForms = [
  "Buccal Tablet",
  "Capsule",
  "Capsule (Enteric Coated)",
  "Chewable Tablet",
  "Chewing Gum Tablet",
  "Dispersible Tablet",
  "Effervescent Granules",
  "Effervescent Powder",
  "Effervescent Tablet",
  "Flash Tablet",
  "Injectable Solution (Oral & IM)",
  "Liquid",
  "Long Acting Tablet",
  "Microgranules",
  "MUPS Tablet",
  "Oral Gel",
  "Oral Granules",
  "Oral Paste",
  "Oral Powder",
  "Oral Soluble Film",
  "Oral Solution",
  "Oral Suspension",
  "OROS Tablet",
  "Pediatric Drops",
  "Powder for Solution",
  "Powder for Suspension",
  "Retard Tablet",
  "Solution",
  "Sprinkle Capsule",
  "Sublingual Tablet",
  "Suspension",
  "Syrup",
  "Tablet",
  "Tablet (Enteric Coated)",
  "XR Tablet (Wax Matrix)",
  "Tablet (Wax Matrix)",
  "Emulsion", // Can be oral
];

bool isOralDosageForm(String? dosageForm) {
  if (dosageForm == null || dosageForm.isEmpty) return false;
  return oralDosageForms.contains(dosageForm);
}

bool isInfusion(String? dosageForm) {
  if (dosageForm == null) return false;
  return dosageForm.toLowerCase().contains("infusion");
}

bool isSuppository(String? dosageForm) {
  if (dosageForm == null) return false;
  return dosageForm.toLowerCase().contains("suppository");
}

final Map<String, List<LocalizedString>> suppositoryRoutes = {
  "Suppository": [
    const LocalizedString(en: "Use rectally", bn: "পায়ুপথে ব্যবহার করবেন"),
  ],
  "Vaginal Suppository": [
    const LocalizedString(en: "Use vaginally", bn: "যোনিপথে ব্যাবহার করবেন"),
  ],
};

DosageSuggestions getDosageSuggestions({
  required String dosageForm,
  String? genericName,
  required String lang, // 'en' or 'bn'
}) {
  final normalizedForm = dosageForm;
  final normalizedGeneric = (genericName ?? "").toLowerCase();

  List<LocalizedString> dosageList = [];
  List<LocalizedString> noteList = [];
  List<LocalizedString> takingTimeList = [];
  List<LocalizedString> routeList = [];

  // Special logic for Emulsion
  if (normalizedForm == "Emulsion") {
    if (normalizedGeneric.contains("benzyl benzoate") ||
        normalizedGeneric ==
            "triclosan + benzalkonium chloride + light liquid paraffin") {
      dosageList = topical;
    } else if (normalizedGeneric.contains("liquid paraffin") &&
        normalizedGeneric !=
            "triclosan + benzalkonium chloride + light liquid paraffin") {
      dosageList = oralLiquid;
      takingTimeList = takingTimes;
    } else {
      // Default for Emulsion
      dosageList = [...topical, ...oralLiquid];
      takingTimeList = takingTimes;
    }
  } else {
    // Direct mapping
    if (dosageFormMap.containsKey(normalizedForm)) {
      dosageList = dosageFormMap[normalizedForm]!;
    }
  }

  // Notes mapping
  if (notes.containsKey(normalizedForm)) {
    noteList = notes[normalizedForm]!;
  } else {
    // Fallback for oral forms if no specific note exists
    if ([
      "Tablet",
      "Capsule",
      "Syrup",
      "Suspension",
      "Solution",
      "Drop",
    ].any((t) => normalizedForm.contains(t))) {
      noteList = notes["Oral"] ?? [];
    }
  }

  // Taking Times mapping - mostly for Oral forms
  final isOral = [
    "Tablet",
    "Capsule",
    "Syrup",
    "Suspension",
    "Solution",
    "Drop",
    "Oral",
    "Lozenge",
    "Gum",
  ].any((t) => normalizedForm.contains(t));

  if (isOral) {
    takingTimeList = takingTimes;
  }

  // Route mapping for Suppository
  if (normalizedForm.contains("Suppository")) {
    if (normalizedForm.contains("Vaginal")) {
      routeList = suppositoryRoutes["Vaginal Suppository"]!;
    } else {
      routeList = suppositoryRoutes["Suppository"]!;
    }
  }

  return DosageSuggestions(
    dosages: dosageList.map((d) => lang == 'bn' ? d.bn : d.en).toList(),
    notes: noteList.map((n) => lang == 'bn' ? n.bn : n.en).toList(),
    takingTimes: takingTimeList.map((t) => lang == 'bn' ? t.bn : t.en).toList(),
    routes: routeList.map((r) => lang == 'bn' ? r.bn : r.en).toList(),
  );
}

const List<LocalizedString> durations = [
  LocalizedString(en: "7 day", bn: "৭ দিন"),
  LocalizedString(en: "10 day", bn: "১০ দিন"),
  LocalizedString(en: "14 day", bn: "১৪ দিন"),
  LocalizedString(en: "15 day", bn: "১৫ দিন"),
  LocalizedString(en: "20 day", bn: "২০ দিন"),
  LocalizedString(en: "1 month", bn: "১ মাস"),
  LocalizedString(en: "2 months", bn: "২ মাস"),
  LocalizedString(en: "Continue", bn: "চলবে"),
];

List<String> getDurationSuggestions(String lang) {
  return durations.map((d) => lang == 'bn' ? d.bn : d.en).toList();
}
