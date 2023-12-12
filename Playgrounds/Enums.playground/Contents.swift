import Cocoa

// ENUMLAR
// elimizde sınırlı sayıda bir değer listesi varsa, bunu bir array,set vb. olarak tanımlamak yerine enumlar kullanılabilir
// enum'ı tanımlamak
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
// enum'ı bir değişkene atamak
// burada atama yaparken, sınırlı bir değer arasından seçim yaptığımıza dikkat edin!
// yani Weekday.somethingElse diye bir kullanım yapamayız
// Bu da kodumuzdaki hataları azaltır
var day = Weekday.monday
day = Weekday.tuesday

// ayrıca, swift day değişkeninin bir enum olduğunu biliyor
// dolayısıyla enum'ın adını belirtmeden, başka bir seçenek atayabiliriz
day = .tuesday

// ayrıca enumlar tek seferde(tek case kullanarak) da oluşturulabilir
enum Weekday2 {
    case monday,
     tuesday,
     wednesday,
     thursday,
     friday
}


