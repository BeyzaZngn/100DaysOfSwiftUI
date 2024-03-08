import Cocoa

var greeting = "Hello, playground"

// 21 Şubat 2024 , DAY 1 ile başladım.
//**********************************************************************************************************

// ********** DAY 1 (Variables, constants, strings, and numbers) **********

let character = "Daphne"
var playerName = "Roy"
print(playerName)

// String içerisinde tırnak işaretiyle bir kelime elde etmek için tırnaklardan önce ters eğik çizgi kullanmalıyız.
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Alt satırlara geçmek istersek üçlü tırnak kullanmalıyız.
let movie = """
A day in
the life of an
Apple engineer
"""
// Baştaki üçlü tırnak en başta tek başınaysa, sondaki üçlü tırnak da tek kullanılmalıdır!

// Karakter saydırmak için count kullanırız.
let actor = "Denzel Washington"
print(actor.count)
// Veya
let nameLength = actor.count
print(nameLength)

// Tüm harfleri büyük yapmak için uppercased() kullanırız. Burada parantez kullanıldığına dikkat edelim!
print(actor.uppercased())

// hasPrefix() bir dizenin seçtiğimiz bazı harflerle başlayıp başlamadığını bilmemizi sağlar.
print(actor.hasPrefix("A day"))

// Ayrıca, bir dizenin bir metinle bitip bitmediğini kontrol eden bir hasSuffix() karşılığı da vardır.
print(actor.hasSuffix(".jpg"))
// Burada tırnak içerisine yazılacak olan kelimenin küçük-büyük harflerine dikkat edilmelidir!

let reallyBig = 100000000
/* Bunu elle yazıyor olsaydık muhtemelen "100,000,000" yazardık ki bu noktada sayının 100 milyon olduğu açıktır.
Swift' te de benzer bir şey var:
Sayıları istediğiniz gibi ayırmak için alt çizgi ,_, kullanabilirsiniz. */
let reallyBigSeperated = 100_000_000
// Swift aslında alt çizgileri önemsemez, bu nedenle isterseniz bunun yerine bunu yazabilirsiniz.
let reallyBigVerySep = 1_00__00___00____00

// Toplama, çıkarma, çarpma ve bölme işlemlerinin gösterimi.
let score = 10
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

// Bileşik atama operatörleri
var counter = 10
counter = counter + 5
// Veya
counter += 5
print(counter)

/* Bir tamsayının başka bir tamsayının katı olup olmadığını öğrenmek için isMultiple(of:)
fonksiyonunu çağırabilirsiniz. Dolayısıyla, 120'nin üçün katı olup olmadığını şu şekilde sorabiliriz. */
let number = 120
print(number.isMultiple(of: 3))
// Veya
print(120.isMultiple(of: 3))

/*
 
 TİP GÜVENLİĞİ
 *** Swift ondalık sayıları tamsayılardan tamamen farklı bir veri türü olarak kabul eder,
 bu da onları birbirine karıştıramayacağınız anlamına gelir.
 Sonuçta, tamsayılar her zaman %100 doğrudur, ondalık sayılar ise değildir,
 bu nedenle Swift, siz özellikle istemediğiniz sürece ikisini bir araya getirmenize izin vermez.
 
 Pratikte bu, ondalık sayıya tamsayı eklemek gibi şeyler yapamayacağınız anlamına gelir,
 bu nedenle bu tür bir kod hata üretecektir:
 
 let a = 1
 let b = 2.0
 let c = a + b
 
 *** Eğer ısrarla toplamak istersek dönüşüm yapmamız gerekir.
 let c = a + Int(b)
 Veya
 let c = Double(a) + b
 
 *** Tip güvenliği ile birlikte bu, Swift'in bir sabit veya değişkenin
 hangi veri tipini tutacağına karar verdikten sonra,
 her zaman aynı veri tipini tutması gerektiği anlamına gelir.
 Bu, bu kodun iyi olduğu anlamına gelir:
 
 var name = "Nicolas Cage"
 name = "John Travolta"
 
 *** Ancak bu tür bir kod iyi değildir:
 var name = "Nicolas Cage"
 name = 57
 
 *** Ondalık sayılar, tam sayılarla aynı operatör aralığına ve bileşik atama operatörlerine sahiptir:
 var rating = 5.0
 rating *= 2
 
 */

//**********************************************************************************************************

// ********** DAY 2 (Booleans, string interpolation, and checkpoint 1) **********

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)
// Veya
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

/* İki stringi birleştirmek için de + kullandığımıza,
 Int ve Double kullandığımızda da + işaretinin sayıları birbirine eklediğine dikkat ettiniz mi?
 Buna operatör aşırı yüklemesi(operator overloading) denir.
 - + gibi bir operatörün nasıl kullanıldığına bağlı olarak farklı anlamlara gelebilmesidir.
 Stringler için, bir stringi doğrudan diğerine ekleyen += için de geçerlidir. */
let firstPart = "Hello, "
let secondPart = "world!"
let greetingg = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

/* Swift tüm bu stringleri tek seferde birleştiremez.
 Bunun yerine, ilk ikisini birleştirerek "12" yapar, sonra "12" ve "3 "ü birleştirerek "123" yapar,
 sonra "123" ve "4 "ü birleştirerek "1234" yapar ve son olarak "1234" ve "5 "i birleştirerek "12345" yapar
 Kod bittiğinde nihai olarak kullanılmasalar bile "12", "123" ve "1234 "ü tutmak için geçici stringler oluşturur. */
let luggageCode = "1" + "2" + "3" + "4" + "5"

/* + kullanmak stringleri stringlere, tamsayıları tamsayılara ve ondalık sayıları ondalık sayılara
 eklememize izin verir, ancak tamsayıları dizelere eklememize izin vermez.
 Dolayısıyla, String Enterpolasyonu yaparsak buna izin verilir. */
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

// İsterseniz Swift'ten sayıya bir string gibi davranmasını isteyebilirsiniz, bunun gibi:
let missionMessage = "Apollo " + String(number) + " landed on the moon."
// String enterpolasyonuyla gösterimi:
let missionMessagee = "Apollo \(number) landed on the moon."

// String enterpolasyonunun içine işlem de koyabiliriz.
print("5 x 5 is \(5 * 5)")

// *************************************** CHECKPOINT 1 ************************************************

let Celcius = 10.0
let Fahrenheit = ((Celcius * 9.0 / 5.0) + 32.0)
print("\(Celcius)° = \(Fahrenheit)°")

//**********************************************************************************************************

// ********** DAY 3 (Arrays, dictionaries, sets, and enums) **********

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

// append()
beatles.append("Adrian")
// Bir diziye sadece aynı türden veri append edilebilir, aşağıdaki kod hata verir.
// temperatures.append("Chris")

/*
 Bu kod da hata verir çünkü yine farklı türden veriler birleştirilmeye çalışılmış.
 
 let firstBeatle = beatles[0]
 let firstNumber = numbers[0]
 let notAllowed = firstBeatle + firstNumber
 */

/* İlk satır nasıl özel bir dizi türüne sahip olduğumuzu gösteriyor.
Bu herhangi bir dizi değil, tamsayıları tutan bir dizi.
Array<Int>'ten sonraki açık ve kapalı parantezler,
gerektiğinde dizinin oluşturulma şeklini özelleştirmek mümkün olduğu için oradadır.  */
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// İki String tanımlaması da aynıdır.
var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
// Veya
var albumss = [String]()
albumss.append("Folklore")
albumss.append("Fearless")
albumss.append("Red")

// Dizilerle kullanılan bazı işlevler:

// Bir dizide kaç öğe olduğunu okumak için .count kullanabilirsiniz.
print(albums.count)

// Belirli bir dizindeki bir öğeyi kaldırmak için remove(at:)
// veya her şeyi kaldırmak için removeAll() kullanarak bir diziden öğeleri kaldırabilirsiniz.
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)
print(characters)

characters.removeAll()
print(characters.count)
print(characters)

// contains() metodunu kullanarak bir dizinin belirli bir öğeyi içerip içermediğini kontrol edebilirsiniz.
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

// sorted() ile alfabetik sıralama yapabilirsiniz.
// sorted() işlevini kullanmak, String harflerini alfabetik sıraya koyar ve "swift" gibi bir şeyi "fistw" haline getirir.
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

// reversed() ile diziyi tersine çevirebilirsiniz.
// Dizinin tüm elemanlarını tek tek yazdırmadığımız sürece bunu göremeyiz,
// ancak print edersek bu dizinin reversed() edilmiş bir dizi olduğunu gözlemlemiş oluruz.
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

// Sözlükler(Dictionaries), diziler gibi öğeleri konumlarına göre saklamaz,
// bunun yerine öğelerin nerede saklanması gerektiğine karar vermemizi sağlar.
// Swift soldaki dizeleri (isim, iş ve konum) sözlüğün anahtarları, sağdaki dizeleri ise değerler olarak adlandırıyor.
let employee = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
// Veya
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

/* Sözlükten veri okumak söz konusu olduğunda, sözlüğü oluştururken kullandığınız anahtarları kullanırsınız.
print(employee2["name"])
print(employee2["job"])
print(employee2["location"])
Ancak burada swift bize bir uyarı mesajı verir. Buradaki uyarı,
erişmeye çalıştığımız verinin boş olabileceğiyle ilgili bir uyarıdır. */

// Bu kullanım daha uygundur.
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// Ayrıca saklamak istediğiniz açık türleri kullanarak boş bir sözlük oluşturabilir
// ve ardından anahtarları tek tek ayarlayabilirsiniz.
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

// count ve removeAll() işlevlerinin her ikisi de sözlükler için mevcuttur ve tıpkı dizilerde olduğu gibi çalışır.
// Her sözlük öğesinin belirli bir anahtarda bulunması gerektiğinden,
// sözlükler yinelenen anahtarların var olmasına izin vermez.
// Bunun yerine, zaten var olan bir anahtar için bir değer ayarlarsanız, Swift önceki değerin üzerine yazacaktır.

// Set: dizilere benzerler, ancak yinelenen öğeler ekleyemezsiniz ve öğelerini belirli bir sırada saklamazlar.
let peoplee = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
// Bunun aslında nasıl önce bir dizi oluşturduğuna, sonra da bu diziyi sete yerleştirdiğine dikkat ettiniz mi?
// Bu kasıtlıdır ve sabit verilerden bir set oluşturmanın standart yoludur.
// Setin yinelenen değerleri otomatik olarak kaldıracağını ve
// dizide kullanılan sırayı tam olarak hatırlamayacağını unutmayın. Yazdıralım:
print(peoplee)
// set, öğelerinin hangi sırada geldiğini önemsemez.

var peopple = Set<String>()
peopple.insert("Denzel Washington")
peopple.insert("Tom Cruise")
peopple.insert("Nicolas Cage")
peopple.insert("Samuel L Jackson")
print(peopple)
// insert() fonksiyonunu nasıl kullandığımıza dikkat ettiniz mi? Stringlerden oluşan bir dizimiz olduğunda,
// öğeleri append işlevini çağırarak eklerdik, ancak bu ad burada bir anlam ifade etmiyor.
// Setin sonuna bir öğe eklemiyoruz, çünkü set öğeleri istediği sırada saklayacaktır.

/*
 Set, hem aynı öğelerin kullanılmasına izin vermemesi bakımından hem de
 contains() ile aradığımız bir verinin diziye göre daha kolay ve hızlı bulunabilmesi bakımından avantajlıdır.
 contains() işlevinin yanı sıra, bir kümedeki öğe sayısını okumak için count
 ve kümenin öğelerini içeren sıralanmış bir dizi döndürmek için sorted() işlevlerini de bulacaksınız.
*/


/* Enum - numaralandırmanın kısaltması - kodumuzda oluşturabileceğimiz
 ve kullanabileceğimiz bir dizi adlandırılmış değerdir.
 Swift için özel bir anlamları yoktur, ancak daha verimli ve daha güvenlirdirler,
 bu nedenle kodunuzda bunları çok kullanacaksınız. Genelde sayısı belirli şeylerde kullanmak daha mantıklıdır!
 */

// Örneğin haftanın günlerini bir değişkene atayıp String olarak yazdırmak ve bu değişkeni değiştirmek istersek,
// hata yapma olasılığımız çok yüksektir.
// Enumun sahip olabileceği değer aralığını önceden listeleyebiliriz ve Swift bunları kullanırken asla hata yapmamanızı sağlar.
// Böylece, hafta içi günlerimizi aşağıdaki gibi yeni bir enum olarak yeniden yazabiliriz:
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
// Veya
enum Weekdayy {
    case monday, tuesday, wednesday, thursday, friday
}
// Şimdi string kullanmak yerine enum kullanacağız.
var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

/*
 Bununla, Stringde yapılabilecek hatalar gibi yanlışlıkla fazladan bir boşlukla "friday " kullanamazsınız
 veya bunun yerine bir ay adı koyamazsınız.
 Her zaman enum'da listelenen olası günlerden birini seçmelisiniz.
 */

// Swift, .tuesday öğesinin Weekday.tuesday öğesine başvurması gerektiğini bilir,
// çünkü day öğesi her zaman bir tür Weekday öğesi olmalıdır.
var dayy = Weekday.monday
dayy = .tuesday
dayy = .friday

//**********************************************************************************************************

// ********** DAY 4 (Type annotations and checkpoint 2) **********

// Tür ek açıklamaları(type annotations), hangi veri türlerini istediğimizi açıkça belirtmemizi sağlar ve aşağıdaki gibi görünür.
let surname: String = "Lasso"
var scoree: Int = 0

// Double kısmı olmadan Swift bunun bir tamsayı olduğu sonucuna varırdı,
// ancak biz bunu geçersiz kılıyoruz ve kesinlikle ondalık sayı olduğunu söylüyoruz.
var scoreee: Double = 0

// Bool, doğru ya da yanlış değerlerini tutar.
var issAuthenticated: Bool = true

// Dizi, eklediğiniz sırayla çok sayıda farklı değeri tutar. Bu, [String] gibi özelleşmiş olmalıdır.
var albummss: [String] = ["Red", "Fearless"]

// Sözlük, verilere nasıl erişilmesi gerektiğine karar verdiğiniz birçok farklı değeri tutar.
// Bu, [String: Int] gibi özelleşmiş olmalıdır.
var user: [String: String] = ["id": "@twostraws"]

// Set birçok farklı değeri tutar, ancak bunları içerdiklerini kontrol etmek için
// optimize edilmiş bir sırada saklar. Bu, Set<String> gibi özelleştirilmiş olmalıdır.
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// Tüm bu türleri bilmek, başlangıç değerlerini sağlamak istemediğiniz zamanlar için önemlidir.
// Örneğin, bu bir string dizisi oluşturur:
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
// Swift bir String dizisi atadığınızı görebildiği için burada tür ek açıklamasına gerek yoktur.
// Ancak, boş bir String dizisi oluşturmak istiyorsanız, türü bilmeniz gerekir:
var teams: [String] = [String]()

// Yine, tür ek açıklaması gerekli değildir, ancak yine de bir string dizisinin
// [String] olarak yazıldığını bilmeniz gerekir, böylece bu şeyi yapabilirsiniz.
var citiess: [String] = []

// Mümkün olduğunca tür çıkarımını kullanmayı tercih edelim,
// bu yüzden bunu yazalım:
var clues = [String]()

// Enum kendi yeni türlerimizi oluşturmamıza izin verir.
// Bir enum'un değerleri enum'un kendisiyle aynı türe sahiptir, bu nedenle şöyle bir şey yazabiliriz:
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

let username: String
// Çok sayıda karmaşık mantık
username = "@twostraws"
// Çok daha karmaşık mantık
print(username)

// İster tür çıkarımı ister tür ek açıklaması kullanın, bir altın kural vardır:
// Swift her zaman sabitlerinizin ve değişkenlerinizin hangi veri türlerini içerdiğini bilmelidir.
// Bu, tip güvenli bir dil olmanın özüdür ve 5 + true veya benzeri saçma şeyler yapmamızı engeller.

// Swift'e bir değişkenin var olacağını söylemek istediğinizde, ancak henüz değerini ayarlamak istemediğinizde :
var namee: String

// *************************************** CHECKPOINT 2 ************************************************

var dizi = [String]()
dizi = ["Ali", "Beyza", "Ali"]
dizi.count
Set(dizi)

//**********************************************************************************************************

// ********** DAY 5 (If, switch, and the ternary operator) **********

// İf
let sscore = 85

if sscore > 80 {
print("Do something")
print("Do something else")
print("Do a third thing")
}


let speed = 88
let percentage = 85
let aage = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if aage >= 18 {
    print("You're eligible to vote")
}


let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}


// Make an array of 3 numbers
var numberrss = [1, 2, 3]

// Add a 4th
numberrss.append(4)

// If we have over 3 items
if numberrss.count > 3 {
    // Remove the oldest number
    numberrss.remove(at: 0)
}

// Display the result
print(numberrss)


let country = "Canada"

if country == "Australia" {
    print("G'day!")
}


let nname = "Taylor Swift"

if nname != "Anonymous" {
    print("Welcome, \(name)")
}


// Create the username variable
var uusername = "taylorswift13"

// If `username` contains an empty string
if uusername == "" {
    // Make it equal to "Anonymous"
    uusername = "Anonymous"
}

// Now print a welcome message
print("Welcome, \(uusername)!")


if uusername.count == 0 {
    uusername = "Anonymous"
}

if uusername.isEmpty == true {
    uusername = "Anonymous"
}

if uusername.isEmpty {
    uusername = "Anonymous"
}


let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)


// Swift'ten enumlarımızı karşılaştırılabilir hale getirmesini bile isteyebiliriz, bunun gibi:
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)
// Bu "true" yazdıracaktır, çünkü enum durum listesinde small, large'dan önce gelir.


let agge = 16

if agge >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}


let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

var temmp = 22
if temmp > 20 && temmp < 30 {
    print("It's a nice day.")
}


let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}
// Unutmayın, bir koşulda == true kullanımı kaldırılabilir,
// çünkü zaten bir Boolean'ı kontrol ettiğimiz açıktır. Yani, bunun yerine şunu yazabiliriz:
if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}


/* Transport için değer belirlediğimizde, TransportOption.airplane'e atıfta bulunduğumuzu açıkça belirtmemiz gerekir.
 Sadece .airplane yazamayız çünkü Swift TransportOption enum'unu kastettiğimizi anlamaz.
 Bu gerçekleştiğinde, artık TransportOption yazmamıza gerek kalmaz
 çünkü Swift transport'un bir tür TransportOption olması gerektiğini bilir.
 Böylece, TransportOption.airplane yerine .airplane'e eşit olup olmadığını kontrol edebiliriz. */
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

/* Swift, kontrol ettiğiniz koşulla eşleşen ilk durumu çalıştırır, ancak daha fazlasını yapmaz.
 Diğer diller genellikle sonraki tüm durumlardan diğer kodları çalıştırmaya devam eder,
 bu da genellikle yapılacak tamamen yanlış varsayılan şeydir.
 
 switch forecast {
 case .sun:
     print("It should be a nice day.")
 case .rain:
     print("Pack an umbrella.")
 case .wind:
     print("Wear something warm")
 case .snow:
     print("School is cancelled.")
 case .unknown:
     print("Our forecast generator is broken!")
 }
 
 */

/* Unutmayın: Swift case'leri sırayla kontrol eder ve eşleşen ilk case'i çalıştırır.
 Varsayılanı başka bir durumdan önce yerleştirirseniz,
 o durum hiçbir zaman eşleşmeyeceği için işe yaramaz ve Swift kodunuzu oluşturmayı reddeder. */
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

/* İkinci olarak, Swift'in sonraki vakaları yürütmeye devam etmesini açıkça istiyorsanız,fallthrough kullanın.
 Bu yaygın olarak kullanılmaz, ancak bazen - sadece bazen - işi tekrarlamaktan kaçınmanıza yardımcı olabilir.
 */
// fallthrough kullanmadan:
let ddday = 5
print("My true love gave to me…")

switch ddday {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}

// fallthrough kullanarak:
let daay = 5
print("My true love gave to me…")

switch daay {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

let aaage = 18
let canVote = age >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

