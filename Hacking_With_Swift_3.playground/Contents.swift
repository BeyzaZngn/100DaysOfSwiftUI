import Cocoa

// ******************************************************************************************************

// ********** DAY 11 (Access control, static properties and methods, and checkpoint 6) **********

struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
// Bir banka hesabına para yatırma ve hesaptan para çekme yöntemleri vardır ve bu şekilde kullanılmalıdır:
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

account.funds -= 1000
// Bu, insanların sahip olduklarından daha fazla para çekmelerini önlemek için
// koyduğumuz mantığı tamamen atlar ve şimdi programımız garip şekillerde davranabilir.

private var funds = 0
// Ve şimdi yapının dışından funds' a erişmek mümkün değil, ancak hem deposit() hem de withdraw() içinde mümkün.
// Eğer struct dışından funds okumaya veya yazmaya çalışırsanız Swift kodunuzu oluşturmayı reddedecektir.

/*
 
 Buna erişim kontrolü (access control) denir,
 çünkü bir struct'ın özelliklerine ve yöntemlerine struct dışından nasıl erişilebileceğini kontrol eder.

 "Yapının (struct) dışında hiçbir şeyin bunu kullanmasına izin verme" için private kullanın.
 "Geçerli dosya dışında hiçbir şeyin bunu kullanmasına izin verme" için fileprivate kullanın.
 "Herhangi birinin, herhangi bir yerde bunu kullanmasına izin ver" için public kullanın.
 
 private(set). Bu, "bu özelliği herkesin okumasına izin ver, ancak yalnızca benim metotlarımın yazmasına izin ver"
 anlamına gelir. Bunu BankAccount ile kullanmış olsaydık, account.funds'u yapının dışına yazdırabileceğimiz,
 ancak değeri yalnızca deposit() ve withdraw() yöntemlerinin değiştirebileceği anlamına gelirdi.

 Bu durumda, private(set)'in funds için en iyi seçim olduğunu düşünüyorum:
 mevcut banka hesabı bakiyesini istediğiniz zaman okuyabilirsiniz, ancak mantığımdan geçmeden değiştiremezsiniz.

 Önemli: Bir veya daha fazla özellik için özel erişim kontrolü kullanıyorsanız,
 büyük olasılıkla kendi başlatıcınızı oluşturmanız gerekecektir.

 */

// Statik özelliklerin ve yöntemlerin nasıl oluşturulacağı ve kullanılacağına ilişkin basitleştirilmiş bir örneğe bakalım:
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
// Buradaki static anahtar kelimesine dikkat edin; bu da hem studentCount özelliğinin hem de
// add() yönteminin yapının tek tek örneklerine değil, School yapısının kendisine ait olduğu anlamına gelir.

School.add(student: "Taylor Swift")
print(School.studentCount)

// *******************************************************************************************************

// *********************************** CHECKPOINT 6 ******************************************************

// modeli, koltuk sayısı ve mevcut vitesi dahil olmak üzere bir araba hakkında bilgi depolamak için bir yapı oluşturun,
// ardından vitesleri yukarı veya aşağı değiştirmek için bir yöntem ekleyin. Değişkenler ve erişim kontrolü hakkında düşünün:
// hangi veriler sabit yerine değişken olmalı ve hangi veriler herkese açık olmalı? Vites değiştirme yöntemi girdisini bir şekilde doğrulamalı mı?

struct Car {
    let model: String     // constant! probably won't change
    let seatCount: Int    // same!
    private(set) var currentGear = 1  // only change via an internal method.

    enum GearDirection {
        case up, down, neutral
    }

    public mutating func changeGear(_ direction: GearDirection) {
        switch direction {
        case .down : currentGear -= 1
            if currentGear < 1 {currentGear = 1}
        case .up :   currentGear += 1
            if currentGear > 10 { currentGear = 10 }
        case .neutral:
            currentGear = 1  // arbitrary selection
        }
        print("The \(model) is in gear: \(currentGear)")
    }
}

// Test Code
var prefect = Car(model: "Ford Prefect", seatCount: 4, currentGear: 3)
prefect.changeGear(.up)
prefect.changeGear(.neutral) // Jump right to Gear 1.
prefect.changeGear(.down)  // try this line a couple of times. try to get below zero.

// ********************************************************************************************************
// ********** DAY 12 (Classes, inheritance, and checkpoint 7) **********

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

/*
 Swift, kalıtım(inheritance) olarak bilinen bir süreç olan mevcut sınıfları temel alarak sınıflar oluşturmamızı sağlar.
 Bir sınıf başka bir sınıftan (its “parent” or “super” class) işlevsellik miras aldığında,
 Swift yeni sınıfa (the “child class” or “subclass”) üst sınıftaki özelliklere ve yöntemlere erişim vererek
 yeni sınıfın davranış biçimini özelleştirmek için küçük eklemeler veya değişiklikler yapmamıza olanak tanır.
 */

// Bir sınıfın diğerinden miras almasını sağlamak için, alt sınıfın adından sonra iki nokta üst üste yazın ve ardından
// üst sınıfın adını ekleyin. Örneğin, burada bir özelliği ve başlatıcısı olan bir Employee sınıfı bulunmaktadır:
class Employee {
    let hours: Int
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }

    init(hours: Int) {
        self.hours = hours
    }
}

// Employee'nin iki alt sınıfını oluşturabiliriz, bunların her biri hours özelliğini ve başlatıcısını kazanacaktır:
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

// Bu sınıfların her biri Employee'den miras alır, ancak her biri daha sonra kendi özelleştirmelerini ekler.
// Dolayısıyla, her birinin bir örneğini oluşturup work() işlevini çağırırsak farklı bir sonuç elde ederiz:
let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

// Developer, Employee'den miras aldığı için, Developer örneklerinde printSummary() işlevini hemen çağırmaya başlayabiliriz:
let novall = Developer(hours: 8)
novall.printSummary()

/*
 
 Miras aldığınız bir yöntemi değiştirmek istediğinizde işler biraz daha karmaşık hale gelir. Örneğin,
 Employee'ye printSummary() metodunu koyduk, ancak belki de alt sınıflardan biri biraz farklı bir davranış istiyordur.

 Bu noktada Swift basit bir kuralı uygulamaya koyar: Eğer bir alt sınıf üst sınıftaki bir yöntemi değiştirmek istiyorsa,
 alt sınıfın sürümünde override kullanmanız gerekir. Bu iki şey yapar:

 1- Override kullanmadan bir yöntemi değiştirmeye çalışırsanız, Swift kodunuzu oluşturmayı reddeder.
 Bu, yanlışlıkla bir yöntemi geçersiz kılmanızı engeller.
 
 2- Eğer override kullanıyorsanız ancak metodunuz aslında üst sınıftaki bir şeyi override etmiyorsa,
 Swift kodunuzu oluşturmayı reddedecektir çünkü muhtemelen bir hata yapmışsınızdır.
 Dolayısıyla, geliştiricilerin benzersiz bir printSummary() yöntemine sahip olmasını istiyorsak, bunu Developer sınıfına ekleriz:
 
*/


/*
 İpucu: Sınıfınızın kalıtımı desteklememesi gerektiğinden eminseniz, onu final olarak işaretleyebilirsiniz.
 Bu, sınıfın kendisinin başka şeylerden miras alabileceği, ancak miras almak için kullanılamayacağı anlamına gelir.
 Hiçbir alt sınıf, nihai bir sınıfı ebeveyni olarak kullanamaz.
 */


// Yeni bir sınıf tanımlayalım.
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

/*
 
Şimdi, diyelim ki Vehicle'dan miras alan bir Car sınıfı yapmak istedik - şöyle bir şey yazmaya başlayabilirsiniz:

class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
    }
}
 
 Swift'in bizden istediği şey Car'a hem isElectric hem de isConvertible içeren bir başlatıcı sağlamaktır,
 ancak isElectric'i kendimiz saklamaya çalışmak yerine onu aktarmamız gerekir.
 super sınıftan kendi başlatıcısını çalıştırmasını istememiz gerekir.

*/
class Carr: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

/*
 super, Swift'in self'e benzer şekilde bizim için otomatik olarak sağladığı değerlerden bir diğeridir:
 initializer gibi ana sınıfımıza ait yöntemleri çağırmamızı sağlar. İsterseniz bunu diğer metotlarla da kullanabilirsiniz;
 sadece başlatıcılarla sınırlı değildir.
 Artık her iki sınıfımızda da geçerli bir başlatıcıya sahip olduğumuza göre, Car'ın bir örneğini şu şekilde oluşturabiliriz:
 */
let teslaX = Carr(isElectric: true, isConvertible: false)

// İpucu: Bir alt sınıfın kendi başlatıcıları yoksa, otomatik olarak ana sınıfının başlatıcılarını devralır.


class User {
    var username = "Anonymous"
}

// Bunun sadece bir özelliği vardır, ancak bir sınıfın içinde saklandığı için sınıfın tüm kopyalarında paylaşılacaktır.
// Böylece, bu sınıfın bir örneğini oluşturabiliriz:
var user1 = User()

// Daha sonra user1'in bir kopyasını alabilir ve kullanıcı adı değerini değiştirebiliriz:
var user2 = user1
user2.username = "Taylor"

// Şimdi kopyanın kullanıcı adı özelliğini değiştirdik, daha sonra her farklı kopyadan aynı özellikleri yazdırabiliriz:
print(user1.username)
print(user2.username)
// ...ve bu her ikisi için de "Taylor" yazdıracak - örneklerden yalnızca birini değiştirmiş olsak da, diğeri de değişti.

// Buna karşılık, struct'lar verilerini kopyalar arasında paylaşmaz, yani kodumuzda User sınıfını struct User olarak değiştirirsek
// farklı bir sonuç elde ederiz: kopyayı değiştirmek orijinali de değiştirmediği için önce "Anonymous" sonra "Taylor" yazdıracaktır.


// Bir sınıf örneğinin benzersiz bir kopyasını oluşturmak istiyorsanız - bazen derin kopya olarak adlandırılır -
// yeni bir örnek oluşturmayı ve tüm verilerinizi güvenli bir şekilde kopyalamayı ele almanız gerekir.
class Usser {
    var username = "Anonymous"

    func copy() -> Usser {
        let user = Usser()
        user.username = username
        return user
    }
}
// Artık aynı başlangıç verilerine sahip bir nesne elde etmek için copy() işlevini güvenle çağırabiliriz,
// ancak gelecekte yapılacak herhangi bir değişiklik orijinali etkilemeyecektir.


// Swift'in sınıflarına isteğe bağlı olarak bir deinitializer verilebilir;
// bu, nesne oluşturulduğunda değil yok edildiğinde çağrıldığı için initializer'ın tersi gibidir.
// Tıpkı initializer'larda olduğu gibi, deinitializer'larda da func kullanmazsınız - bunlar özeldir.
// Deinitializer'lar asla parametre alamaz veya veri döndüremez ve sonuç olarak parantezle bile yazılmazlar.
// Deinitializer'ınız, bir sınıf örneğinin son kopyası yok edildiğinde otomatik olarak çağrılacaktır.
// Bu, örneğin artık sonlandırılan bir fonksiyonun içinde oluşturulduğu anlamına gelebilir.
// Deinitializer'ları asla doğrudan çağırmayız; bunlar sistem tarafından otomatik olarak işlenir.
// Structların deinitializer'ları yoktur, çünkü onları kopyalayamazsınız.

// Bir initializer ve deinitializer kullanarak oluşturulduğunda ve yok edildiğinde bir mesaj yazdıran bir sınıf oluşturabiliriz:
class Userr {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

// Döngü içinde bir User örneği oluşturursak, döngü yinelemesi bittiğinde yok edilecektir:
for i in 1...3 {
    let user = Userr(id: i)
    print("User \(user.id): I'm in control!")
}
// Bu kod çalıştığında, her bir kullanıcıyı ayrı ayrı oluşturduğunu ve yok ettiğini göreceksiniz,
// biri daha oluşturulmadan diğeri tamamen yok edilecektir.

// Unutmayın, deinitializer yalnızca bir sınıf örneğine kalan son referans yok edildiğinde çağrılır.
// Bu, sakladığınız bir değişken veya sabit olabilir ya da bir dizide bir şey saklamış olabilirsiniz.
// Örneğin, Kullanıcı örneklerimizi oluşturuldukça ekliyor olsaydık, bunlar yalnızca dizi temizlendiğinde yok edilirdi:
var users = [Userr]()

for i in 1...3 {
    let user = Userr(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// Deinitializer'ların görevi, bir sınıf örneğinin ne zaman yok edildiğini bize söylemektir.
// Yapılar(struct) için bu oldukça basittir: yapı, ona sahip olan şey artık var olmadığında yok edilir.
// Yani, bir yöntemin içinde bir struct oluşturursak ve yöntem sona ererse, struct yok edilir.


// Burada name değiştirilir ve çıktısı Taylor olacaktır.
class Hello {
    var name = "Paul"
}

let hello = Hello()
hello.name = "Taylor"
print(hello.name)

// Bunun sonucunda "Paul" yazdırılacaktır, çünkü adı "Taylor" olarak değiştirmiş olsak da,
// tüm kullanıcı nesnesinin üzerine yeni bir tane yazarak onu "Paul" olarak sıfırladık.
class HelloTwo {
    var name = "Paul"
}

var helloTwo = HelloTwo()
helloTwo.name = "Taylor"
helloTwo = HelloTwo()
print(helloTwo.name)


