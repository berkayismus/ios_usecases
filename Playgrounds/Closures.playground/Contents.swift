import Cocoa

// CLOSURELAR

func greetUser()  {
    print("Hi there!")
}
// fonksiyonları fonksiyonlara atayabiliriz
var greetCopy = greetUser
greetCopy()

// fonksiyonu bir değişkene veya sabite atayabiliriz
let sayHello = {
    print("Hi there!")
}

sayHello()

// parametre alan [name] ve değer döndüren[String] closure
// in, parametrelerin ve dönüş tipinin sona erdiğini belirtmek için kullanılır
let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

let hi = sayHello2("Berkay")
print(hi)

// greetCopy2: yeni fonksiyonun adı
// (): parametre almadığını belirtiyoruz
// ->: dönüş tipini bildirmek üzereyiz
// Void: dönüş tipi
// greetUser: değeri (bu da bir fonksiyon olabilir)
var greetCopy2: () -> Void = greetUser


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
// external parameter name, sadece normal fonksiyonlarda önemlidir
// buradaki closure'da data(for: 1989) olarak kullanmadığımıza dikkat
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
// diziyi alfabetik olarak sıralar
let sortedTeam = team.sorted()
print(sortedTeam)

// ya bu sıralamayı kontrol etmek isteseydik?
// örneğin, takım kaptanını başa koymak, ardından gelenleri sıralamak isteseydik?
// closure'lara fonksiyon göndererek bunu çözebiliriz
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}


let captainFirstSortedTeam = team.sorted(by: captainFirstSorted)
print(captainFirstSortedTeam)

// bunu closure'ların gücünü kullanarak başka şekilde de yapabiliriz
// beyin yakıyor değil mi? :)
// kısaca; ekstra bir filtre fonksiyonu(captainFirstSorted gibi) yazmamıza gerek kalmadı
let captainFirstTeam2 = team.sorted(by: { (name1: String,name2: String) -> Bool in
    if name1 == "Suzanne" {
           return true
       } else if name2 == "Suzanne" {
           return false
       }

       return name1 < name2
})

// trailing closure'lar
// parametreleri ve dönüş türünü belirtmemize gerek yok
// swift bunu zaten biliyor
// o yüzden kodu şu şekilde yazabiliriz
let captainFirstTeam3 = team.sorted { name1,name2 in
    if name1 == "Suzanne" {
           return true
       } else if name2 == "Suzanne" {
           return false
       }

       return name1 < name2
}

// parametre adlarını da vermek zorunda değiliz
// swift bizim yerimize parametre adlarını oluşturur
// bunlar; $0 ve $1 (1. ve 2.parametre)
let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
           return true
       } else if $1 == "Suzanne" {
           return false
       }

       return $0 < $1
}

let reverseTeam = team.sorted {
    return $0 > $1
}

// fonksiyon gövdesinde tek bir kod satırı olduğu için return'ü de kaldırabiliriz
let reverseTeam2 = team.sorted {
    $0 > $1
}


// parametre olarak fonksiyon göndermek
// burada bu fonksiyona external parameter name'i using
// internal parameter name'i generator olan bir fonksiyon vermemiz gerekiyor
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 50, using: { () -> Int in
    Int.random(in: 1...10)
})

// fonksiyonumuzun son parameresi bir closure ise direkt süslü parantez ile bunu kullanabiliriz
let rolls2 = makeArray(size: 50) {
    Int.random(in: 1...10)
}

// birden fazla trailing closure'ı shorthand syntax ile kullanabiliriz
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
