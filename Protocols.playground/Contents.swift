import Cocoa

// PROTOCOLLER

// protokolleri şu şekilde tanımlayabiliriz
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// implemente eden protokolün fonksiyonlarını override etmek zorundayız
struct Car: Vehicle {
    // protocol'ün zorladığı değişkenlere varsayılan değer atayabiliriz
    var name: String = "Im a car"
    
    var currentPassengers: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        return 0
    }
    
    func travel(distance: Int) {
        print("travelling")
    }
    
    
    func openSunroof()  {
        print("Its a nice day")
    }
    
}

struct Bicycle: Vehicle {
    var name: String = "Im a bike"
    
    var currentPassengers: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
let bike = Bicycle()

commute(distance: 50, using: car)
commute(distance: 50, using: bike)


func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car,bike], distance: 150)

// EXTENSIONS

// extension nasıl yazılır
// String: Hangi veri türü üzerinde extension yazmak istiyorsak onu yazmalıyız
extension String {
    
    //extension'larda metod oluşturmak zorunda değiliz
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
    func hi() -> String {
        "Hi \(self)!"
    }
    
    mutating func trimmed()  {
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


let berkay = "Berkay".hi()
// extensionlar kendi instance'ını değiştirebilir
// ancak bu fonksiyonlar mutating olmak zorunda
var devrim = "Devrim AYYILDIZLI   ".hi()
devrim.trimmed()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""


// lyrics kaç satırdan oluşuyor?
print(lyrics.lines.count)

// extensionlar ile structlar için default memberwise initializer tanımlayabiliriz
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int

  
}

extension Book {
    init() {
          self.title = "Default title"
          self.pageCount = 100
          self.readingHours = pageCount / 50
      }
}

let book = Book()
print(book.readingHours)

// PROTOCOL EXTENSIONLAR

let guests = ["Berkay","Devrim","Emir"]

if guests.isEmpty {
    print("misafir bulunamadı")
} else {
    print("misafir sayısı \(guests.count)")
}

// sadece arraylere extension yazmak istemiyorsak
// onu implemente eden collection'a extension yazabiliriz

extension Collection {
    var isNotEmpty: Bool {
        return isEmpty == false
    }
}

if guests.isNotEmpty {
    print("misafiriniz var!")
}

// bu aynı zamanda set,dictionary gibi collection'ı implemente eden türlerde işe yarar
let guestsInSet = Set(["Devrim","Devrim","Emir"])
if guestsInSet.isNotEmpty {
    print("misafiriniz var!")
}

// protocol extensionlar ile
// protocol'lerin implemente etmeye zorladığı fonksiyonlara varsayılan davranışlar verebiliriz

protocol Person {
    var name: String { get }
    func sayHello()
}


extension Person {
    func sayHello() {
        print("Hello \(self.name)!")
    }
}


struct Employee: Person {
    let name: String
    // protocol extension sayesinde,
    // sayHello metodunu implemente etmemize gerek kalmadı
    // default davranışı tanımladık
}

let devrim2 = Employee(name: "Devrim")
devrim2.sayHello()
