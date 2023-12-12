// STRUCTLAR
// structlar classlar ile benzerlik gösterir
// ancak değer tiplidirler (value type)

// basit bir struct tanımlamak
struct Album {
    let title: String
        let artist: String
        let year: Int

        func printSummary() {
            print("\(title) (\(year)) by \(artist)")
        }
}

// class'larda olduğu gibi bir örnek oluşturabilir
// metodlarını kullanabiliriz

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    // structların property'lerini değiştirmek istediğimizde
    // değiştiren fonksiyonu (mutating) ile işaretlemeliyiz
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// sabit(let) bir struct örneğinde mutating func kullanamayız
// bunu bir değişken(var) halinde oluşturmalıyız
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// structlar hakkında bir kaç bilgi
// içlerinde bulunan değişkenlere [property] denir
// içlerinde bulunan fonksiyonlara [metod] denir
// bir structtan, bir sabit veya değişken oluşturduğumuzda buna [instance] denir

// swift structlarda otomatik olarak 
// diğer programlama dillerinde constructor olarak bilinen
// init adında bir metod oluşturur
// aşağıdaki 2 kod satırı da aynı anlama gelir
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

// structta bir property'e varsayılan değer atarsak, bunu [instance] üretirken vermek zorunda kalmayız
struct User {
    let name: String
    // varsayılan değer atanıyor
    var position: String = "Developer"
}
// position değerini vermemize gerek kalmıyor
let user1 = User(name: "Berkay")
let user2 = User(name: "Ahmet",position: "Medical Doctor")

// structlar iki tür property tutar
// stored property: bir sabit veya değişken
// computed property: her erişildiğinde tekrar erişilen

struct Employee2 {
    // stored property
    var name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // computed property
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
    
    // computed propertylerin set parametresini ayarlayarak
    // bir değişkenlermiş gibi değer de atayabiliriz
    var nName: String {
        get {
            name
        }
        set {
           name = newValue
        }
    }
}

var berkay = Employee2(name: "Berkay ÇAYLI", vacationAllocated: 14)
berkay.vacationTaken += 4
print(berkay.vacationRemaining)
berkay.vacationTaken += 4
print(berkay.vacationRemaining) // erişildiğinde hesaplanır
print(berkay.nName)
// computed property'e değer atama
berkay.nName = "berkayismus"
print(berkay.nName)

// property observers
// structlardaki bir property değiştiğinde veya değişmeden önce tetiklenen bir metoddur

struct Game {
    var score = 0 {
        didSet {
            print("score is now \(score)")
            // property atanmadan önceki değere de erişebiliriz
            print("old value: \(oldValue)")
        }
        willSet {
            // property atandıktan sonraki değere de erişebiliriz
            print("new value: \(newValue)")
            print("score will be change soon \(score)")
        }
    }
}


var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// custom initializers
// initializer'da tüm değerlere atama yaptığımız sürece custom initializer oluşturabiliriz

struct Player {
    let name: String
    let number: Int
    
    // custom initializer
    init(name: String,number: Int) {
        // burada selft struct'ın kendisine[Player] atıfta bulunur
        self.name = name
        self.number = number
    }
}

let player = Player(name: "Berkay", number: 67)

