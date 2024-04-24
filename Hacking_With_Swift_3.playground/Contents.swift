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

// *******************************************************************************************************

// *********************************** CHECKPOINT 7 ******************************************************

/*

 Göreviniz şu: Hayvanlar için bir sınıf hiyerarşisi oluşturun, en üstte Hayvan ile başlayın,
 sonra alt sınıflar olarak Köpek ve Kedi, sonra
 Köpek'in alt sınıfları olarak Corgi ve Poodle ve Kedi'nin alt sınıfları olarak Persian ve Lion.

 Ama dahası da var:

 Animal sınıfı, hayvanın kaç bacağı olduğunu izleyen bir legs tamsayı özelliğine sahip olmalıdır.
 Dog sınıfı, genel bir köpek havlaması dizesi yazdıran bir speak() yöntemine sahip olmalıdır, ancak alt sınıfların her biri biraz farklı bir şey yazdırmalıdır.
 Kedi sınıfının yine her alt sınıfın farklı bir şey yazdırdığı eşleşen bir speak() yöntemi olmalıdır.
 Kedi sınıfı, bir başlatıcı kullanılarak sağlanan isTame Boolean özelliğine sahip olmalıdır.
 
*/

class Animals {
    let legs : Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog : Animals {
    func speak() {
        print("haw")
    }
}

class Corgi : Dog {
    
    override func speak() {
        print("Wau Wau I am a Corgi and I have \(legs) legs")
    }
}

class Poodle : Dog {
    
    override func speak() {
        print("Wuff Wuff I am a Poodle and I have \(legs) legs")
    }
}

class Cat : Animals {
    
    var isTame: Bool
    
    func speak() {
        print("miaw")
    }

    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

class Persian : Cat {
    
    override func speak() {
        print("Miau Miau Cat \(legs) legs and isTame = \(isTame)")
    }
}

class Lion : Cat {
    
    override func speak() {
        print("Miz Miz I am a Cat with \(legs) legs and isTame = \(isTame)")
    }
}

let random = Persian(legs: 8, isTame: true)
random.speak()
let random2 = Lion(legs: 4, isTame: false)
random2.speak()

// *******************************************************************************************************
// ********** DAY 13 (Protocols, extensions, and checkpoint 8) **********

// Protokoller Swift'teki sözleşmeler gibidir: bir veri türünün ne tür işlevleri desteklemesini beklediğimizi
// tanımlamamızı sağlarlar ve Swift kodumuzun geri kalanının bu kurallara uymasını sağlar.

func commute(distance: Int, using vehicle: Carr) {
    // lots of code here
}

// Protokoller burada devreye girer: kullanmak istediğimiz bir dizi özellik ve yöntemi tanımlamamıza izin verirler.
// Bu özellikleri ve yöntemleri uygulamazlar - aslında arkasına herhangi bir kod koymazlar - sadece özelliklerin ve
// yöntemlerin var olması gerektiğini söylerler, tıpkı bir plan gibi.
// Örneğin, aşağıdaki gibi yeni bir Araç protokolü tanımlayabiliriz:
protocol Vehiclee {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
// Protokolün içinde, bu protokolün beklediğimiz şekilde çalışması için ihtiyaç duyduğumuz tüm yöntemleri listeleriz.
// Bu yöntemlerin içinde herhangi bir kod bulunmaz - burada sağlanan herhangi bir fonksiyon gövdesi yoktur.
// Bunun yerine, yöntem adlarını, parametreleri ve dönüş türlerini belirtiyoruz. Gerekirse yöntemleri fırlatma(throwing) veya mutasyon(mutating) olarak da işaretleyebilirsiniz.

// Protokol, var olması gereken tüm işlevselliği belirtmez, yalnızca asgari düzeyde bir işlevsellik belirtir.
// Bu, protokole uygun yeni türler oluşturduğunuzda, gerektiğinde her türlü başka özellik ve yöntem ekleyebileceğiniz anlamına gelir.
struct Carrr: Vehiclee {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

// Şimdi bir protokol oluşturduk ve protokole uygun bir Car yapısı yaptık.
// Bitirmek için, daha önceki commute() fonksiyonunu Car'a eklediğimiz yeni metotları kullanacak şekilde güncelleyelim:
func commute(distance: Int, using vehicleee: Carrr) {
    if vehicleee.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicleee.travel(distance: distance)
    }
}

let car = Carrr()
commute(distance: 100, using: car)


// Swift, Vehicle'a uyan herhangi bir türün hem estimateTime() hem de travel() yöntemlerini uygulaması gerektiğini bilir
// ve bu nedenle aslında parametremizin türü olarak Car yerine Vehicle kullanmamıza izin verir. Fonksiyonu şu şekilde yeniden yazabiliriz:
// func commute(distance: Int, using vehicle: Vehicle) {

// Şimdi bu fonksiyonun, Vehicle protokolüne uygun olduğu sürece herhangi bir veri türüyle çağrılabileceğini söylüyoruz.
// Swift, estimateTime() ve travel() yöntemlerinin var olduğundan emin olduğu için işlevin gövdesinin değişmesi gerekmez.

/*
struct Bicycle: Vehiclee {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

*/

// Örneğin, Araç'a uyan tüm tiplerin kaç koltuğa sahip olduklarını ve şu anda kaç yolcuya sahip olduklarını
// belirtmeleri gerektiğini şu şekilde belirtebiliriz:
protocol Vehhicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// Bir dizi araç kabul eden ve bunu bir dizi seçenek üzerinden tahminleri hesaplamak için kullanan bir yöntem yazabiliriz:
func getTravelEstimates(using vehicles: [Vehhicle], distance: Int) {
    for vehhicle in vehicles {
        let estimate = vehhicle.estimateTime(for: distance)
        print("\(vehhicle.name): \(estimate) hours to travel \(distance)km")
    }
}

// Bir dizi Araç protokolünü kabul ediyoruz, bu da bir Araba, Bisiklet veya Araç'a uyan herhangi bir yapıyı aktarabileceğimiz
// ve otomatik olarak çalışacağı anlamına geliyor:
// getTravelEstimates(using: [car, bike], distance: 150)

/*
 Protokolleri parametre olarak kabul etmenin yanı sıra, gerekirse bir fonksiyondan protokolleri de döndürebilirsiniz.
 İpucu: Sadece virgülle ayırarak tek tek listeleyerek istediğiniz kadar protokole uyabilirsiniz.
 Bir şeyin alt sınıfını oluşturmanız ve bir protokole uymanız gerekirse, önce üst sınıf adını yazmalı, ardından protokollerinizi yazmalısınız.
*/


// opaque return types:

func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}

/*
 
 İpucu: Bool.random() işlevi doğru veya yanlış döndürür. Rastgele tamsayılar ve ondalık sayıların aksine,
 özelleştirme seçenekleri olmadığı için herhangi bir parametre belirtmemiz gerekmez.

 Böylece getRandomNumber() rastgele bir tamsayı ve getRandomBool() rastgele bir Boolean döndürür.

 Hem Int hem de Bool, Equatable adı verilen ve "eşitlik için karşılaştırılabilir" anlamına gelen
 ortak bir Swift protokolüne uygundur. Equatable protokolü, == ifadesini kullanmamızı sağlayan şeydir:

 */

print(getRandomNumber() == getRandomNumber())

// Bu türlerin her ikisi de Equatable'a uygun olduğundan, fonksiyonumuzu Equatable değeri döndürecek şekilde değiştirmeyi deneyebiliriz:

/*
func getRandomNumber() -> Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> Equatable {
    Bool.random()
}
 
"protokol 'Equatable' yalnızca genel bir kısıtlama olarak kullanılabilir çünkü Self veya ilişkili tür gereksinimleri vardır".
 Swift'in hatasının anlamı, Equatable döndürmenin mantıklı olmadığıdır ve neden mantıklı olmadığını anlamak, opak dönüş türlerini anlamanın anahtarıdır.
 
 Opak geri dönüş tipleri burada devreye girer: kodumuzdaki bilgileri gizlememize izin verirler, ancak Swift derleyicisinden gizlemezler.
 Bu, kodumuzu dahili olarak esnek hale getirme hakkımızı saklı tuttuğumuz anlamına gelir, böylece gelecekte farklı şeyler döndürebiliriz,
 ancak Swift her zaman döndürülen gerçek veri türünü anlar ve uygun şekilde kontrol eder.

 İki fonksiyonumuzu opak dönüş tipine yükseltmek için, dönüş tiplerinden önce some anahtar sözcüğünü aşağıdaki gibi ekleyin:
 
 func getRandomNumber() -> some Equatable {
     Int.random(in: 1...6)
 }

 func getRandomBool() -> some Equatable {
     Bool.random()
 }
 
*/



