import Cocoa

// FONKSİYONLAR
func showWelcome()  {
    print("Hello Berkay!")
}

showWelcome()

// parametre ile fonksiyon yazmak
// number bir parametredir
func printTimeTables(number: Int,number2: Int = 5)  {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimeTables(number: 5)
// parametreler fonksiyon imzasında geçtiği gibi(sırayla) çağrılmalıdır
// aşağıdaki çağrı çalışmaz
// printTimeTables(number2: 3,number: 2)


// değer döndüren fonksiyon
// -> Int: Döndürülen değerin tipini ifade eder
// return: geriye değer döndürür
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

rollDice()

// fonksiyon tek satır ise return yazmak zorunda değiliz
func rollDice2() -> Int {
    Int.random(in: 1...6)
}

rollDice2()

// fonksiyon çıkmak için (işlemi sonlandırmak için)
// tek başına return kullanabiliriz
func quitIfNil(name: String?)  {
    if(name == nil) {
        return
    }
    print("name isnt nil: \(name!)")
}

quitIfNil(name: nil)
quitIfNil(name: "Berkay")

// fonksiyonlarda birden fazla değer döndürme - tuple
// tuple: (firstName: String,lastName: String)
func getUser() -> (firstName: String,lastName: String) {
    (firstName: "Berkay",lastName: "ÇAYLI")
}

// parametrelerin name'lerini yazmak zorunda değiliz
func getUser2() -> (firstName: String,lastName: String) {
    ("Berkay","ÇAYLI")
}

// tuple'a isim vermek zorunda değiliz
func getUser3() -> (String,String) {
    ("Berkay","ÇAYLI")
}

let t1 = getUser3()
// dönen değerlere indisler ile erişebiliriz
print(t1.0)
print(t1.1)

// dönen değerleri tek seferde birden fazla değişkene atayabiliriz
// aslında tuple'a atıyoruz
let (firstName,lastName) = getUser()
print(firstName)
print(lastName)

// tüm değerlere gerek yoksa, ignore (_) kullanabiliriz
let (firstName2,_) = getUser()
print(firstName2)

// isimsiz parametreler kullanmak
// _ ile fonksiyonun kullanıldığı yerde verdiğimiz ismi ignore ediyoruz
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

// bkz: parametre adı yok
isUppercase("Berkay")

// harici parametre adı ve dahili parametre adını aynı anda kullanmak
// for: harici parametre adı (fonksiyonun kullanıldığı yerde kullanmak için)
// number: dahili parametre adı (fonksiyonun içinde kullanmak için)
func printTimeTables(for number: Int)  {
    for i in 1...12 {
            print("\(i) x \(number) is \(i * number)")
        }
}

printTimeTables(for: 5)



