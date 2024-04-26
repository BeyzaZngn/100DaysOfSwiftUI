import Cocoa

// ********** DAY 6 (Loops, summary, and checkpoint 3) **********

// for
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for rubberChicken in platforms {
    print("Swift works great on \(rubberChicken).")
}

// Örneğin, 5 çarpım tablosunu 1'den 12'ye kadar şu şekilde yazdırabiliriz:
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// İç içe döngüler
for i in 1...12 {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}

// Bu çalıştırıldığında, ilk döngüde 1, 2, 3, 4, 5 sayıları için yazdıracak,
// ancak ikincisinde yalnızca 1, 2, 3 ve 4 sayılarını yazdıracaktır.
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// Bazen bir aralık kullanarak bazı kodları belirli sayıda çalıştırmak istersiniz,
// ancak aslında döngü değişkenini istemezsiniz - i veya j'yi istemezsiniz, çünkü kullanmazsınız.
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// Bir dizideki öğeler üzerinde döngü yapmak istiyorsanız, aşağıdaki gibi bir kod yazabilirsiniz:
let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
    print("\(name) is a secret agent")
}

// Gövde içinde bir döngü değişkeni kullanmazsanız, Swift sizi bu şekilde yeniden yazmanız için uyaracaktır:
let naames = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for _ in naames {
    print("[CENSORED] is a secret agent!")
}

let nnames = ["Piper", "Alex", "Suzanne", "Gloria"]
print(nnames[0])
print(nnames[1...3])

// Ancak bu küçük bir risk taşır: dizimiz en az dört öğe içermiyorsa, 1...3 başarısız olur.
// Neyse ki, "bana dizinin sonuna kadar 1 ver" demek için tek taraflı bir aralık kullanabiliriz, bunun gibi:
print(nnames[1...])

/*
for beatle in "John", "Paul", "Ringo" {
print("\(beatle) was in the Beatles")
}
Bu kodun geçerli olması için isimler dizi içerisinde olmalıdır.
*/

/*
 var speeds = (65, 58, 72)
 for speed in speeds {
     print("You were driving at \(speed)km/h.")
 }
 */

// While
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// random(in:) Buraya çalışmak için bir sayı aralığı verin ve bu aralığın içinde bir yerde rastgele bir Int veya Double gönderecektir.
// Örneğin, bu 1 ile 1000 arasında yeni bir tamsayı oluşturur:
let id = Int.random(in: 1...1000)

// Bu da 0 ile 1 arasında rastgele bir ondalık oluşturur:
let amount = Double.random(in: 0...1)

// roll u saklamak için bir tam sayı oluştur.
var roll = 0

// 20'ye ulaşana kadar döngüye devam et.
while roll != 20 {
    // yeni bir zar at ve ne olduğunu yazdır.
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// eğer buradaysak döngü sona erdi demektir, 20 aldık!
print("Critical hit!")


/*
 for döngüleri, bir aralık veya dizi gibi üzerinden geçilecek sınırlı miktarda veriniz olduğunda daha yaygındır,
 ancak while döngüleri özel bir koşula ihtiyacınız olduğunda gerçekten yararlıdır!
 */

// Continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

// Break
/*
 İki sayıyı tutmak için iki sabit oluşturun.
 İki sayımızın ortak katlarını saklayacak bir tamsayı dizi değişkeni oluşturun.
 Her döngü değişkenini i'ye atayarak 1'den 100.000'e kadar sayın.
 Eğer i hem birinci hem de ikinci sayının katıysa, onu tamsayı dizisine ekleyin.
 10 elemana ulaştığımızda, döngüden çıkmak için break deyin.
 Ortaya çıkan diziyi yazdırın.
 Dolayısıyla, geçerli döngü yinelemesinin geri kalanını atlamak istediğinizde continue,
 geri kalan tüm döngü yinelemelerini atlamak istediğinizde break komutunu kullanın.
 */
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
    if score == 0 {
        break
    }

    count += 1
}

print("You had \(count) scores before you got 0.")

// *************************************** CHECKPOINT 3 ************************************************

/*
 Amacınız 1'den 100'e kadar ve her sayı için döngü yapmaktır:

 Eğer 3'ün katıysa, "Fizz" yazdırın
 Eğer 5'in katıysa, "Buzz" yazdırın
 Eğer 3 ve 5'in katı ise, "FizzBuzz" yazdırın
 Aksi takdirde, sadece sayıyı yazdırın.
 İşte kodunuz çalıştığında sahip olmanız gereken bazı örnek değerler:

 1 "1" yazdırmalıdır
 2 "2" yazdırmalıdır
 3 "Fizz" yazdırmalıdır
 4 "4" yazdırmalıdır
 5 "Buzz" yazdırmalıdır
 6 "Fizz" yazdırmalıdır
 7 "7" yazdırmalıdır
 ...
 15 "FizzBuzz" yazdırmalıdır
 ...
 100 "Buzz" yazdırmalıdır
 */

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    }
    else if i % 3 == 0 {
       print("Fizz")
   }
    else if i % 5 == 0 {
        print("Buzz")
    }
    else {
        print(i)
    }
}
// ***************************************************************************************************

// ********** DAY 7 (Functions, parameters, and return values) **********

// Fonksiyonlar, programınızın geri kalanından ayırdığınız ve
// kolayca başvurabilmeniz için bir ad verdiğiniz kod parçalarıdır.
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

// Bu fonksiyon iki parametre alır: number adında bir tamsayı ve end adında bir bitiş noktası.
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)


// İpucu: Bir fonksiyon içinde oluşturduğunuz tüm veriler, fonksiyon tamamlandığında otomatik olarak yok edilir.

/* Bir fonksiyondan kendi değerinizi döndürmek istiyorsanız, iki şey yapmanız gerekir:
 Fonksiyonunuzun açılış parantezinden önce bir ok ve ardından Swift'e ne tür bir verinin
 geri gönderileceğini söyleyen bir veri türü yazın.
 Verilerinizi geri göndermek için return anahtar sözcüğünü kullanın. */
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

// Örnek bir kod
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

// Daha kısa hali
func aareLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

// Bu kod tek satır olduğu için aslında return kullanmamıza gerek de yoktur.
func aaareLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
// Unutmayın, bu yalnızca işleviniz tek bir kod satırı içerdiğinde ve
// özellikle bu kod satırı gerçekten döndürmeyi vaat ettiğiniz verileri döndürdüğünde çalışır.


// pythagoras() adında, iki Double parametre alan ve başka bir Double döndüren bir fonksiyon.
// İçinde a ve b'yi kareler, bunları toplar, sonra bunu sqrt()'e geçirir ve sonucu geri gönderir.
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// Bu fonksiyon da tek bir satıra indirgenebilir ve return anahtar sözcüğü kaldırılabilir.
func ppythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

/*
 Eğer fonksiyonunuz bir değer döndürmüyorsa, fonksiyonu erken çıkmaya zorlamak için
 return'ü tek başına kullanabilirsiniz. Örneğin, belki de girdinin beklediğinizle eşleşip
 eşleşmediğini kontrol ediyorsunuz ve eşleşmiyorsa devam etmeden önce fonksiyondan hemen
 çıkmak istiyorsunuz.
 */

/*
 kodumuz true, false, "Hello" veya 19 gibi tek bir değere indirgenebiliyorsa,
 buna ifade (expression) diyoruz. İfadeler, bir değişkene atanabilen veya print() kullanılarak yazdırılabilen şeylerdir.
 Öte yandan, değişken oluşturma, bir döngü başlatma veya bir koşulu kontrol etme gibi eylemler gerçekleştiriyorsak,
 buna deyim (statement) diyoruz.
 */

func doMath() -> Int {
    return 5 + 5
}

func doMoreMath() -> Int {
    5 + 5
}

/* Bu, bir Stringi kendisinin büyük harfli sürümüyle karşılaştırır. String zaten tamamen büyük harfle yazılmışsa,
 hiçbir şey değişmemiş olacak ve iki Stirng aynı olacaktır, aksi takdirde farklı olacaklar ve == false geri gönderecektir. */
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

// Bir fonksiyondan iki veya daha fazla değer döndürmek istiyorsanız, bir dizi kullanabilirsiniz.
func getUser() -> [String] {
    ["Taylor", "Swift"]
}
let user = getUser()
print("Name: \(user[0]) \(user[1])")
/* Bu sorunludur, çünkü user[0] ve user[1]'in ne olduğunu hatırlamak zordur ve bu dizideki verileri değiştirirsek,
 user[0] ve user[1] başka bir şey olabilir veya belki de hiç mevcut olmayabilir. */


/* Sözlük ile deneyecek olursak: Evet, artık kullanıcı verilerimizin çeşitli bölümlerine anlamlı isimler verdik,
 ancak print() çağrısına bakın - hem firstName hem de lastName'in var olacağını bilsek bile,
 yine de işler beklediğimiz gibi gitmezse diye varsayılan değerler sağlamamız gerekiyor. */
func getUserr() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}
let userr = getUserr()
print("Name: \(userr["firstName", default: "Anonymous"]) \(userr["lastName", default: "Anonymous"])")

// Bu çözümlerin her ikisi de oldukça kötüdür, ancak Swift'in tuple şeklinde bir çözümü vardır.
func getUserrr() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let userrr = getUserrr()
print("Name: \(userrr.firstName) \(userrr.lastName)")

// Bir fonksiyondan bir tuple döndürüyorsanız, Swift tuple'daki her bir öğeye verdiğiniz isimleri zaten biliyordur,
// bu nedenle return'ü kullanırken bunları tekrarlamanıza gerek yoktur. Yani, bu kod önceki tuple'ımızla aynı şeyi yapar:
func getUserrrrr() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// Bazen size elemanlarının isimleri olmayan tuple'lar verildiğini görürsünüz.
// Bu durumda, tuple'ın elemanlarına 0'dan başlayan sayısal indisleri kullanarak erişebilirsiniz:
func getUuser() -> (String, String) {
    ("Taylor", "Swift")
}

let uuser = getUuser()
print("Name: \(uuser.0) \(uuser.1)")

// Bir fonksiyon bir tuple döndürüyorsa, isterseniz tuple'ı ayrı ayrı değerlere ayırabilirsiniz:
func gettUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let useer = gettUser()
let firstName = useer.firstName
let lastName = useer.lastName

print("Name: \(firstName) \(lastName)")

/* Aslında, tuple'daki tüm değerlere ihtiyacınız yoksa, Swift'e tuple'ın o kısmını yok saymasını söylemek
için _ kullanarak bir adım daha ileri gidebilirsiniz:
 
let (firstName, _) = getUser()
print("Name: \(firstName)")
 
*/


/* Parametre adının önüne bir alt çizgi eklersek, harici parametre etiketini aşağıdaki gibi kaldırabiliriz:
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO, WORLD"
let result = isUppercase(string: string)
 
// Kaldıralım:
 
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO, WORLD"
let result = isUppercase(string)
*/


// ********** DAY 8 (Default values, throwing functions, and checkpoint 4) **********

// Bitiş noktası sonda belirlenmiş bir fonksiyon:
func printTimesTabless(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTabless(for: 5, end: 20)

// Bitiş noktası baştan belirlenmiş bir fonksiyon:
func printTimesTablesss(for numberr: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(numberr) is \(i * numberr)")
    }
}
printTimesTablesss(for: 5, end: 20)
printTimesTablesss(for: 8)

// Bu, bir diziye bazı dizeler ekler, sayısını yazdırır, sonra hepsini kaldırır ve sayıyı tekrar yazdırır.
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)

/* removeAll() işlevini çağırdığımızda, Swift otomatik olarak dizideki tüm öğeleri kaldıracak
 ve ardından diziye atanmış olan tüm belleği boşaltacaktır.
 Ancak bazen - sadece bazen - diziye çok sayıda yeni öğe eklemek üzere olabilirsiniz
 ve bu nedenle bu işlevin öğeleri kaldırırken önceki kapasiteyi de koruyan ikinci bir biçimi vardır:
*/
characters.removeAll(keepingCapacity: true)
/*
 Bu, varsayılan bir parametre değeri kullanılarak gerçekleştirilir: keepingCapacity,
 varsayılan değeri false olan bir Boolean'dır, böylece varsayılan olarak mantıklı olanı yapar
 ve aynı zamanda dizinin mevcut kapasitesini korumak istediğimiz zamanlar için true'yu geçme seçeneğini açık bırakır.
*/


// Error Handling

// Bu, parola ile ilgili iki olası hata olduğunu söylüyor: kısa ve açık. Bunların ne anlama geldiğini tanımlamıyor,
// sadece var olduklarını söylüyor.
enum PasswordError: Error {
    case short, obvious
}

// İkinci adım, bu hatalardan birini tetikleyecek bir fonksiyon yazmaktır.
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

/*
 # Eğer bir fonksiyon kendisi işlem yapmadan hata atabiliyorsa,
 dönüş tipinden önce fonksiyonu throws olarak işaretlemeniz gerekir.
 
 # Fonksiyon tarafından tam olarak ne tür bir hata atılacağını belirtmeyiz,
 sadece hata atabileceğini belirtiriz.
 
 # Throws ile işaretlenmiş olması, fonksiyonun hata vermesi gerektiği anlamına gelmez,
 sadece hata verebileceği anlamına gelir.
 
 # Bir hata atma zamanı geldiğinde, throw ve ardından PasswordError durumlarımızdan birini yazıyoruz.
 Bu, fonksiyondan hemen çıkılmasını sağlar, yani bir String döndürmez.
 
 # Herhangi bir hata atılmazsa, fonksiyon normal şekilde davranmalıdır - bir String döndürmesi gerekir.
 Bu, hata fırlatmanın ikinci adımını tamamlar: meydana gelebilecek hataları tanımladık,
 ardından bu hataları kullanan bir fonksiyon yazdık.

 # Son adım ise fonksiyonu çalıştırmak ve oluşabilecek hataları ele almaktır.
 Swift Playgrounds, çoğunlukla öğrenme amaçlı olduğu için hata işleme konusunda oldukça gevşektir,
 ancak gerçek Swift projeleriyle çalışmak söz konusu olduğunda üç adım olduğunu göreceksiniz:
*/


/*
do kullanarak hata fırlatabilecek bir iş bloğu başlatma.
try kullanarak bir veya daha fazla fırlatma fonksiyonunu çağırma.
catch kullanarak fırlatılan hataları işleme.
Sözde kodda şu şekilde görünür:

do {
    try someRiskyWork()
} catch {
    print("Handle errors here")
}
*/

// Eğer mevcut checkPassword() fonksiyonumuzu kullanarak bunu denemek isteseydik, şunu yazabilirdik:
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// try: hata verebilecek tüm fonksiyonlar çağrılmadan önce yazılmalıdır ve geliştiricilere,
// bir hata oluşması durumunda normal kod yürütmesinin kesintiye uğrayacağına dair görsel bir işarettir.

/*
 readItem() işlevi hata fırlatamaz, çünkü throws kullanılarak işaretlenmemiştir.
 enum ArrayError: Error {
     case negateIndex
 }
 func readItem(_ index: Int, from array: [String]) -> String {
     if index < 0 {
         throw ArrayError.negateIndex
     }
     return array[index]
 }
 */

// *************************************** CHECKPOINT 4 ************************************************

// Zorluk şu: 1'den 10.000'e kadar bir tamsayı kabul eden ve bu sayının tamsayı karekökünü döndüren bir fonksiyon yazın.

/*
 - Swift'in yerleşik sqrt() fonksiyonunu veya benzerini kullanamazsınız - karekökü kendiniz bulmanız gerekir.
 - Eğer sayı 1'den küçük veya 10.000'den büyükse "sınırların dışında" hatası vermelisiniz.
 - Yalnızca tamsayı kareköklerini dikkate almalısınız - örneğin 3'ün karekökünün 1,732 olması konusunda endişelenmeyin.
 - Eğer karekökü bulamazsanız, "kök yok" hatası verin.
 - Bir hatırlatma olarak, elinizde X sayısı varsa, X'in karekökü, kendisiyle çarpıldığında X'i veren başka bir sayı olacaktır.
 - 9'un karekökü 3'tür, çünkü 3x3 9'dur ve 25'in karekökü 5'tir, çünkü 5x5 25'tir.
 */

enum SqrtError: Error {
    case tooSmallNumber, tooBigNumber, noRoot
}

func mySqrt(_ number: Int) throws -> Int {
    if number < 1 {
        throw SqrtError.tooSmallNumber
    }
    
    if number > 10000 {
        throw SqrtError.tooBigNumber
    }
    
    for i in 1...100 {
        if number == i * i {
            return i
        }
    }
    throw SqrtError.noRoot
}

let number = 3
do {
    let result = try mySqrt(number)
    print("Girdiğiniz sayının karekökü: \(result)")
} catch SqrtError.tooSmallNumber {
    print("Girdiğiniz sayı 1'den küçüktür.")
} catch SqrtError.tooBigNumber {
    print("Girdiğiniz sayı 10000'den büyüktür.")
} catch SqrtError.noRoot {
    print("Girdiğiniz sayının tam karekökü yoktur.")
} catch {
    print("Bilinmedik bir hatayla karşılaşıldı.")
}

// ***************************************************************************************************

// ********** DAY 9 (Closures, passing functions into functions, and checkpoint 5) **********

// Bir fonksiyonu kopyalarken, parantezleri ondan sonra yazmazsınız.
// var greetCopy = greetUser olur, var greetCopy = greetUser() olmaz.
// Parantezleri oraya koyarsanız, fonksiyonu çağırmış ve dönüş değerini başka bir şeye geri atamış olursunuz.
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

// Peki ya ayrı bir fonksiyon oluşturmayı atlamak ve fonksiyonu doğrudan bir sabite
// veya değişkene atamak isterseniz? Bunu da yapabileceğiniz ortaya çıktı:
let sayHello = {
    print("Hi there!")
}

sayHello()
// Swift buna closure expression ismini verir,
// bu da bir closure oluşturduğumuzu söylemenin süslü bir yoludur.
// Parametre almayan ve değer döndürmeyen bir fonksiyon.

/*
 Eğer closure'un parametre kabul etmesini istiyorsanız, bunların özel bir şekilde yazılması gerekir.
 Gördüğünüz gibi, closure parantezlerle başlar ve biter, bu da parametreleri veya dönüş değerini
 kontrol etmek için bu parantezlerin dışına kod koyamayacağımız anlamına gelir.
 Bu yüzden, Swift'in güzel bir çözümü var: aynı bilgiyi parantezlerin içine koyabiliriz, bunun gibi:
 */
let sayHelloo = { (name: String) -> String in
    "Hi \(name)!"
}
// Normal bir fonksiyonda parametreler ve dönüş tipi parantezlerin dışında gelirdi,
// ancak bunu closure'larda yapamayız. Dolayısıyla, in parametre ve
// dönüş tipinin sonunu işaretlemek için kullanılır, bundan sonraki her şey closure'un gövdesidir.

/*
 
 greetUser() fonksiyonunu ele alalım: hiçbir parametre kabul etmez,
 değer döndürmez ve hata fırlatmaz. Bunu greetCopy için
 bir tür ek açıklaması olarak yazacak olsaydık, şunu yazardık:
 
 Boş parantezler parametre almayan bir fonksiyonu işaret eder.
 Ok, bir fonksiyon oluştururken ne anlama geliyorsa o anlama gelir:
 fonksiyonun geri dönüş türünü bildirmek üzereyiz.
 Void "hiçbir şey" anlamına gelir - bu fonksiyon hiçbir şey döndürmez.
 Bazen bunun () şeklinde yazıldığını görebilirsiniz, ancak boş parametre
 listesiyle karıştırılabileceği için genellikle bundan kaçınırız.
 
 */
var greetCopyy: () -> Void = greetUser

/*
 Her fonksiyonun türü aldığı ve geri gönderdiği verilere bağlıdır.
 Bu kulağa basit gelebilir, ancak önemli bir püf noktasını gizler:
 Aldığı verilerin adları fonksiyon türünün bir parçası değildir.
 */
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let usseer = data(1989)
print(usseer)
// Bir tamsayı kabul eden ve bir string döndüren bir fonksiyon.
// Ancak fonksiyonun bir kopyasını aldığımızda, fonksiyon türü for harici parametre adını içermez,
// bu nedenle kopya çağrıldığında data(for: 1989) yerine data(1989) kullanırız.

// Aynı kural tüm closure'lar için de geçerlidir.
// Daha önce yazdığımız sayHello closure'ını kullanmadığımı fark etmiş olabilirsiniz,
// bunun nedeni çağrı yerinde bir parametre adının olmamasını sorgulamanıza neden olmak istemememdir. Şimdi onu çağıralım:
// sayHello("Taylor")

// Bu, tıpkı fonksiyonları kopyaladığımızda olduğu gibi parametre adı kullanmaz.
// Yani, tekrar: harici parametre adları yalnızca bir fonksiyonu doğrudan çağırdığımızda önemlidir,
// bir closure oluşturduğumuzda veya önce fonksiyonun bir kopyasını aldığımızda değil.

// Bir dizinin elemanlarını sıralamak için sorted() fonksiyonunu kullandığımızı hatırlayalım.
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

/*
 Ya bu sıralamayı kontrol etmek istersek ya her zaman bir kişinin takım kaptanı olduğu
 için ilk sırada gelmesini ve diğerlerinin alfabetik olarak sıralanmasını istersek?

 sorted() aslında tam olarak bunu kontrol etmek için özel bir sıralama fonksiyonu
 geçirmemize izin verir. Bu fonksiyon iki dize kabul etmeli ve
 ilk dizenin ikinciden önce sıralanması gerekiyorsa true,
 ilk dizenin ikinciden sonra sıralanması gerekiyorsa false döndürmelidir.

 Suzanne kaptan olsaydı, fonksiyon şöyle görünürdü:
 */
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// sorted() özel bir sıralama düzeni oluşturmak için bir fonksiyona aktarılabilir
// ve bu fonksiyon a) iki dizgi kabul ettiği ve b) bir Boolean döndürdüğü sürece sorted() bunu kullanabilir.
// Yeni captainFirstSorted() fonksiyonumuz tam olarak bunu yapıyor, bu yüzden onu hemen kullanabiliriz:
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// İlk olarak, closure'ları anonim fonksiyonlar olarak oluşturabilir,
// sabitler ve değişkenler içinde saklayabiliriz:
let sayHhello = {
    print("Hi there!")
}
sayHhello()

// Ayrıca, tıpkı captainFirstSorted() fonksiyonunu sorted() fonksiyonuna aktardığımız gibi,
// fonksiyonları diğer fonksiyonlara da aktarabiliyoruz:
// let captainFirstTeam = team.sorted(by: captainFirstSorted)

/*
 closure'ların gücü, bu ikisini bir araya getirebilmemizdir:
 sorted() iki string kabul edecek ve bir Boolean döndürecek bir fonksiyon ister
 ve bu fonksiyonun resmi olarak func kullanılarak mı oluşturulduğunu yoksa bir closure
 kullanılarak mı sağlandığını umursamaz.
 */

// Bir closure kullanarak sorted() işlevini çağıran yeni bir kod yazalım:
/*
 
 let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
 if name1 == "Suzanne" {
 return true
 } else if name2 == "Suzanne" {
 return false
 }
 
 return name1 < name2
 })
 
 */

// Hem closure'lar hem de fonksiyonlar parametre alabilir, ancak parametre alma şekilleri çok farklıdır.
// İşte bir String ve bir tamsayı kabul eden bir fonksiyon:
func pay(user: String, amount: Int) {
    // code
}
// Burada da closure olarak yazılmış aynı şey var:
let payment = { (user: String, amount: Int) in
    // code
}

// Parametre almayan bir closure'dan nasıl değer döndürürsünüz?
// İlk olarak, burada bir parametre kabul eden ve hiçbir şey döndürmeyen bir closure var:
let payyment = { (user: String) in
    print("Paying \(user)…")
}

// Şimdi bir parametre kabul eden ve bir Boolean döndüren bir closure var:
let paymeent = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

// Herhangi bir parametre kabul etmeden bir değer döndürmek istiyorsanız,
// sadece -> Bool yazamazsınız - Swift ne demek istediğinizi anlamayacaktır.
// Bunun yerine, parametre listeniz için aşağıdaki gibi boş parantezler kullanmalısınız:
let paymentt = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}
// Eğer düşünürseniz, bu func payment() -> Bool yazabileceğiniz standart bir fonksiyonla aynı şekilde çalışır.


// Swift, closure'larla birlikte gelen sözdizimi(Syntax) miktarını azaltmak için birkaç hileye sahiptir,

/*
 
 Bu kodda sorted() fonksiyonuna verdiğimiz fonksiyon iki string sağlamalı ve bir Boolean döndürmelidir,
 öyleyse neden closure da kendimizi tekrarlamamız gerekiyor?
 
 let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

 let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
     if name1 == "Suzanne" {
         return true
     } else if name2 == "Suzanne" {
         return false
     }

     return name1 < name2
 })

 print(captainFirstTeam)
 
 Cevap: Gerekmiyor. İki parametremizin türünü belirtmemize gerek yok çünkü string olmalılar
 ve dönüş türünü belirtmemize gerek yok çünkü Boolean olmalı. Böylece kodu şu şekilde yeniden yazabiliriz:
 
 let captainFirstTeam = team.sorted(by: { name1, name2 in

 Bu zaten koddaki karmaşa miktarını azalttı, ancak bir adım daha ileri gidebiliriz:
 sorted() gibi bir işlev parametre olarak başka bir işlevi kabul ettiğinde,
 Swift sondaki closure sözdizimi adı verilen özel sözdizimine izin verir. Bu şuna benzer:
 
 let captainFirstTeam = team.sorted { name1, name2 in
     if name1 == "Suzanne" {
         return true
     } else if name2 == "Suzanne" {
         return false
     }

     return name1 < name2
 }
 closure' ı bir parametre olarak geçirmek yerine, devam edip closure' ı doğrudan başlatıyoruz
 ve bunu yaparken (by: 'yi başlangıçtan ve closure parantezini sondan kaldırıyoruz.
 
 Swift'in closure'ları daha az karmaşık hale getirmesinin son bir yolu daha var:
 Swift, shorthand syntax kullanarak parametre adlarını bizim için otomatik olarak sağlayabilir.
 Bu sözdizimi ile artık name1, name2 bile yazmıyoruz ve bunun yerine Swift'in bizim için sağladığı
 özel olarak adlandırılmış değerlere güveniyoruz: sırasıyla birinci ve ikinci dizeler için $0 ve $1.
 
 Bu sözdizimini kullanarak kodumuz daha da kısalır:
 
 let captainFirstTeam = team.sorted {
     if $0 == "Suzanne" {
         return true
     } else if $1 == "Suzanne" {
         return false
     }

     return $0 < $1
 }
 
 Burada kullanmak gereksiz olabilir,
 sorted() çağrımız daha basit olsaydı - örneğin, sadece ters sıralama yapmak isteseydik - o zaman kullanabilirdik:
 let reverseTeam = team.sorted {
     return $0 > $1
 }
 
 Yani, in parametre ve dönüş tipinin sonunu işaretlemek için kullanılır - bundan sonraki her şey closure'un gövdesidir.
 
 Burada karşılaştırmayı <'den >'e çevirdim, böylece ters sıralama elde ettik,
 ancak şimdi tek bir kod satırına indiğimiz için geri dönüşü kaldırabilir ve neredeyse sıfıra indirebiliriz:
 let reverseTeam = team.sorted { $0 > $1 }

 Kısaltılmış sözdiziminin (shorthand syntax) ne zaman kullanılacağı ve ne zaman kullanılmayacağı konusunda
 sabit kurallar yoktur, ancak yardımcı olması durumunda, aşağıdakilerden herhangi biri doğru olmadıkça
 kısaltılmış sözdizimini kullanırım:

 1) Kapanış kodu uzun.
 2) $0 ve arkadaşlarının her biri birden fazla kez kullanılır.
 3) Üç veya daha fazla parametre alırsınız (örn. $2, $3, vb.).
 
 */

// filter() fonksiyonu, dizideki her öğe üzerinde bazı kodlar çalıştırmamıza izin verir ve
// fonksiyon için true döndüren her öğeyi içeren yeni bir dizi gönderir. Böylece,
// adı T ile başlayan tüm takım oyuncularını şu şekilde bulabiliriz:
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// map() fonksiyonu dizideki her öğeyi kendi seçtiğimiz bir kodu kullanarak dönüştürmemizi sağlar
// ve dönüştürülmüş tüm öğelerden oluşan yeni bir dizi gönderir:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

// İpucu: map() ile çalışırken, döndürdüğünüz türün başladığınız türle aynı olması gerekmez,
// örneğin bir tamsayı dizisini bir string dizisine dönüştürebilirsiniz.

// Closure kullanım alanları:

// Ekranda bir veri listesi oluşturduğunuzda, SwiftUI sizden listeden bir öğeyi kabul eden ve
// onu ekranda görüntüleyebileceği bir şeye dönüştüren bir fonksiyon sağlamanızı isteyecektir.

// Bir düğme oluşturduğunuzda, SwiftUI sizden düğmeye basıldığında çalıştırılacak bir fonksiyon ve
// düğmenin içeriğini (bir resim veya bazı metinler vb.) oluşturacak başka bir fonksiyon sağlamanızı isteyecektir.

// Sadece metin parçalarını dikey olarak üst üste koymak bile bir closure kullanılarak yapılır.

// Closure ile ilgili son bir konuya daha değinmek istiyorum, o da diğer fonksiyonları parametre olarak kabul eden fonksiyonların nasıl yazılacağı.

// Tip ek açıklamasını bilerek ekledim, çünkü fonksiyonları parametre olarak belirtirken tam olarak bunu kullanıyoruz:
// Swift'e fonksiyonun hangi parametreleri kabul ettiğini ve dönüş tipini söylüyoruz.
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
// Fonksiyonun adı makeArray(). Biri istediğimiz tamsayı sayısı olmak üzere iki parametre alır ve ayrıca bir tamsayı dizisi döndürür.
// İkinci parametre bir fonksiyondur. Bu fonksiyonun kendisi parametre kabul etmez, ancak her çağrıldığında bir tamsayı döndürür.
// makeArray() içinde yeni bir boş tamsayı dizisi oluştururuz, ardından istenildiği kadar döngü yaparız.
// Döngü her döndüğünde, parametre olarak aktarılan generator fonksiyonunu çağırırız.
// Bu, yeni bir tamsayı döndürecektir, bu yüzden bunu sayılar dizisine koyarız.
// Son olarak bitmiş dizi döndürülür.

// ******** Explanation ********
/*
 - Karmaşık kısım ilk satırdır:
 
func makeArray(size: Int, using generator: () -> Int) -> [Int] {

 - Burada iki parantez kümesi ve iki dönüş türü kümesi vardır,
 bu nedenle ilk başta biraz karışık olabilir. Eğer bölerseniz doğrusal olarak okuyabilirsiniz:

1- Yeni bir fonksiyon oluşturuyoruz.
2- Fonksiyonun adı makeArray()'dir.
3- İlk parametre "size" adı verilen bir tamsayıdır.
4- İkinci parametre, kendisi parametre kabul etmeyen ve bir tamsayı döndüren generator adlı bir işlevdir.
5- Her şey - makeArray() - bir tamsayı dizisi döndürür.

- Sonuç olarak, artık her bir sayıyı oluşturmak için kullanılması gereken bir fonksiyonu
 ileterek keyfi boyutta tamsayı dizileri oluşturabiliriz:

 let rolls = makeArray(size: 50) {
     Int.random(in: 1...20)
 }

 print(rolls)
 
- Ve unutmayın, aynı işlevsellik özel fonksiyonlarla da çalışır, bu nedenle şöyle bir şey yazabiliriz:
 
 func generateNumber() -> Int {
     Int.random(in: 1...20)
 }

 let newRolls = makeArray(size: 50, using: generateNumber)
 print(newRolls)
 
- Bu, diziyi doldurmak için generateNumber() işlevini 50 kez çağıracaktır.
*/


// İsterseniz fonksiyonunuzun birden fazla fonksiyon parametresi almasını sağlayabilirsiniz,
// bu durumda birden fazla sondaki closure belirtebilirsiniz. Buradaki sözdizimi SwiftUI'de çok yaygındır.
// Bunu göstermek için, her biri parametre kabul etmeyen ve hiçbir şey döndürmeyen üç fonksiyon parametresi kabul eden bir fonksiyon:
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}
// Birinci, ikinci ve üçüncü çağrılar arasında belirli bir işin yapıldığını simüle etmek için buraya fazladan print() çağrıları ekledim.
// Bunu çağırmaya gelince, ilk sondaki kapatma zaten kullandığımızla aynıdır, ancak ikinci ve üçüncü farklı biçimlendirilir:
// Önceki kapatmadan gelen parantezi bitirirsiniz, ardından harici parametre adını ve iki nokta üst üste işaretini yazarsınız,
// ardından başka bir parantez başlatırsınız.
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


// *************************************** CHECKPOINT 5 ************************************************
// sorted(), filter(), map() ile zaten tanıştınız, bu yüzden bunları bir zincir halinde bir araya getirmenizi istiyorum
// - birini, sonra diğerini, sonra diğerini geçici değişkenler kullanmadan arka arkaya çağırın.
// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Çift olan tüm sayıları filtreleyin
// Diziyi artan sırada sıralar.
// Bunları "7 şanslı bir sayıdır" biçiminde stringlerle eşleyin.
// Ortaya çıkan diziyi, her satırda bir öğe olacak şekilde yazdırın.
// Yani, çıktınız aşağıdaki gibi olmalıdır:
/*
7 is a lucky number
15 is a lucky number
21 is a lucky number
31 is a lucky number
33 is a lucky number
49 is a lucky number
*/
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Filtreleme işlemi için closure
let filteredNumbers = luckyNumbers.filter { number in
    return number % 2 != 0
}

// Sıralama işlemi için closure
let sortedNumbers = filteredNumbers.sorted()

// Eşleme işlemi için closure
let mappedNumbers = sortedNumbers.map { number in
    return "\(number) is a lucky number"
}

// Yazdırma işlemi için closure
mappedNumbers.forEach { string in
    print(string)
}
// ******************************************************************************************************

// ********** DAY 10 (Structs, computed properties, and property observers) **********

// Basit bir struct (yapı) şu şekildedir:
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

// Bu noktada, Albüm tıpkı String veya Int gibidir - onları oluşturabilir, değer atayabilir,
// kopyalayabilir ve benzeri işlemleri yapabiliriz. Örneğin, birkaç albüm oluşturabilir,
// ardından bazı değerlerini yazdırabilir ve fonksiyonlarını çağırabiliriz:
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

/*

Bu kod çalışmaz: Gördüğünüz gibi, let kullanarak bir çalışanı sabit olarak oluşturursak,
Swift çalışanı ve tüm verilerini sabit hale getirir - fonksiyonları gayet iyi çağırabiliriz,
ancak bu fonksiyonların yapının verilerini değiştirmesine izin verilmemelidir çünkü onu sabit hale getirdik.
 
struct Employee {
    let name: String
    var vacationRemaining: Int

    func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
 
*/

/*
 
*** Yalnızca veri okuyan tüm fonksiyonlar oldukları gibi iyidir,
ancak struct'a ait verileri değiştirenler, bunun gibi özel bir mutating anahtar sözcüğü ile işaretlenmelidir:
 
mutating func takeVacation(days: Int) {
 
*** Artık kodumuz sorunsuz bir şekilde oluşturulacak, ancak Swift sabit yapılardan takeVacation() işlevini çağırmamızı engelleyecektir.
 
 var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
 archer.takeVacation(days: 5)
 print(archer.vacationRemaining)
 
*** Ancak var archer'ı let archer olarak değiştirirseniz Swift'in kodunuzu tekrar oluşturmayı reddettiğini göreceksiniz
 - sabit bir yapı üzerinde mutasyona uğrayan bir fonksiyon çağırmaya çalışıyoruz, buna izin verilmiyor.
 
*/

// ============================================================================================
// Structlara ait değişkenler ve sabitler özellik olarak adlandırılır.
// Yapılara ait fonksiyonlara metot denir.
// Bir struct'tan bir sabit veya değişken oluşturduğumuzda, buna örnek diyoruz.
// - örneğin Album struct'ının bir düzine benzersiz örneğini oluşturabilirsiniz.
// Yapıların örneklerini oluşturduğumuzda, bunu aşağıdaki gibi bir başlatıcı kullanarak yaparız:
// Album(title: "Wings", artist: "BTS", year: 2016).
// ============================================================================================

// Swift struct'ın içinde init() adında özel bir fonksiyon yaratır ve struct'ın tüm özelliklerini
// parametre olarak kullanır. Daha sonra otomatik olarak bu iki kod parçasını aynı olarak değerlendirir:
struct Employee {
    let name: String
    var vacationRemaining: Int
}
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

// Swift, başlatıcısını oluşturma biçiminde akıllıdır, hatta bunları özelliklerimize atarsak varsayılan değerleri bile ekler.
// Örneğin, yapımız şu iki özelliğe sahip olsaydı:
let name: String
var vacationRemaining = 14
/*
Ardından Swift, vacationRemaining için varsayılan değeri 14 olan bir başlatıcıyı sessizce oluşturacak ve her ikisini de geçerli kılacaktır:
let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)
*/

// İpucu: Sabit bir özelliğe varsayılan bir değer atarsanız, bu değer başlatıcıdan tamamen kaldırılır.
// Varsayılan bir değer atamak ancak gerektiğinde bunu geçersiz kılma olasılığını açık bırakmak için bir değişken özelliği kullanın.


// Struct iki tür özelliğe sahip olabilir: stored property, yapının bir örneği içinde bir veri parçasını tutan bir değişken veya sabittir.
// ve computed property, özelliğe her erişildiğinde özelliğin değerini dinamik olarak hesaplar.
// Bu, hesaplanan(computed) özelliklerin hem saklanan(stored) özelliklerin hem de fonksiyonların bir karışımı olduğu anlamına gelir:
// saklanan özellikler gibi erişilirler, ancak fonksiyonlar gibi çalışırlar.


// Örnek olarak, daha önce o çalışan için kaç gün tatil kaldığını takip edebilen bir Çalışan yapımız vardı. İşte basitleştirilmiş bir versiyon:
struct Empployee {
    let name: String
    var vacationRemaining: Int
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.vacationRemaining -= 5
print(archer.vacationRemaining)
archer.vacationRemaining -= 3
print(archer.vacationRemaining)

/*
 Bu önemsiz bir yapı olarak işe yarıyor, ancak değerli bilgileri kaybediyoruz.
 Bu çalışana 14 günlük tatil atıyoruz, ardından günler alındıkça bunları çıkarıyoruz,
 ancak bunu yaparken başlangıçta kaç gün verildiğini kaybediyoruz.
 Bunu, hesaplanmış özelliği kullanmak için şu şekilde ayarlayabiliriz:
*/
struct Emppployee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}
// Artık vacationRemaining' ı doğrudan atayabileceğimiz bir şey yapmak yerine,
// ne kadar tatil yaptıklarını kendilerine ayrılan tatil miktarından çıkararak hesaplanıyor.

/*
vacationRemaining'den okuduğumuzda, normal bir depolanmış özellik (stored property) gibi görünür:
 
var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)
 
 Bu gerçekten güçlü bir şey: bir özellik gibi görünen şeyi okuyoruz, ancak perde arkasında
 Swift her seferinde değerini hesaplamak için bazı kodlar çalıştırıyor.
 
 Yine de ona yazamayız çünkü Swift'e bunun nasıl ele alınması gerektiğini söylemedik.
 Bunu düzeltmek için hem bir getter hem de bir setter sağlamamız gerekiyor.
 Sırasıyla "okuyan kod" ve "yazan kod" için süslü isimler.
*/

/*
 Bu durumda getter yeterince basittir, çünkü sadece mevcut kodumuzdur. Ancak setter daha ilginçtir.
 Bir çalışan için vacationRemaining değerini ayarlarsanız, vacationAllocated değerinin artırılmasını
 veya azaltılmasını mı istiyorsunuz, yoksa vacationAllocated aynı kalmalı ve bunun yerine vacationTaken değerini mi değiştirmeliyiz?
 Bu ikisinden ilkinin doğru olduğunu varsayacağım, bu durumda property şu şekilde görünecektir:
 
 var vacationRemaining: Int {
 get {
 vacationAllocated - vacationTaken
 }
 
 set {
 vacationAllocated = vacationTaken + newValue
 }
 }
 */

// get ve set'in bir değeri okurken veya yazarken çalıştırılacak ayrı kod parçalarını nasıl işaretlediğine dikkat edin.
// Daha da önemlisi, newValue'ya dikkat edin - bu bize Swift tarafından otomatik olarak sağlanır
// ve kullanıcının özelliğe atamaya çalıştığı değeri saklar.

/*
Hem getter hem de setter'ı yerleştirdikten sonra, şimdi vacationRemaining'i değiştirebiliriz:
 
var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)
*/

// ====================================================================================================
// Değeri değişmediğinde özelliği düzenli olarak okuyorsanız, stored property kullanmak
// computed property kullanmaktan çok daha hızlı olacaktır. Öte yandan, özelliğiniz çok nadiren okunuyorsa
// ve belki de hiç okunmuyorsa, computed property kullanmak sizi değerini hesaplamak
// ve bir yerde saklamak zorunda kalmaktan kurtarır.
// Bağımlılıklar söz konusu olduğunda - özelliğinizin değerinin diğer özelliklerinizin değerlerine bağlı olup olmadığı -
// o zaman tablolar değişir: bu, computed property' nin yararlı olduğu bir yerdir, çünkü döndürdükleri değerin
// her zaman en son program durumunu dikkate aldığından emin olabilirsiniz.
// ====================================================================================================


// Swift, özellikler değiştiğinde çalışan özel kod parçaları olan özellik gözlemcileri (property observers) oluşturmamıza izin verir.
// Bunlar iki şekilde olabilir: özellik değiştiğinde çalışan didSet gözlemcisi ve özellik değişmeden önce çalışan willSet gözlemcisi.
// Özellik gözlemcilerine neden ihtiyaç duyulabileceğini görmek için aşağıdaki gibi bir kod düşünün:
struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1
// Bu, bir Game struct oluşturur ve puanını birkaç kez değiştirir. Skor her değiştiğinde, bir print() satırı onu takip eder,
// böylece değişiklikleri takip edebiliriz. Ancak bir hata var: sonunda skor yazdırılmadan değişiyor, bu bir hata.

/*
 
 Özellik gözlemcileri ile bu sorunu print() çağrısını didSet kullanarak doğrudan özelliğe ekleyerek çözebiliriz,
 böylece her değiştiğinde - nerede değişirse değişsin - her zaman bazı kodlar çalıştırırız.
 
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

*/

// Eğer isterseniz, Swift otomatik olarak didSet içinde oldValue sabitini sağlar,
// böylece neyi değiştirdiğinize bağlı olarak özel işlevselliğe sahip olmanız gerekir.
// Ayrıca, özellik değişmeden önce bazı kodları çalıştıran bir willSet varyantı da vardır,
// bu da buna dayalı olarak farklı bir işlem yapmak istemeniz durumunda atanacak yeni değeri sağlar.
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
// Evet, bir diziye ekleme yapmak hem willSet hem de didSet'i tetikleyecektir,
// bu nedenle bu kod çalıştırıldığında çok sayıda metin yazdıracaktır.


// Başlatıcı (initializer) sona erdiğinde tüm özelliklerin bir değeri olmalıdır.
struct Player {
    let name: String
    let number: Int
}

let player = Player(name: "Megan R", number: 15)

// Gelen parametrelerin adları ile atanan özelliklerin adları arasında ayrım yapmaya dikkat etmeniz gerekir.
struct Playerr {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}
// "name parametresini name özelliğime ata" demek istediğimizi netleştirmek için özelliklere parametre atamak için self kullandım.

// Elbette, özel başlatıcılarımızın Swift'in bize sağladığı varsayılan üye bazında başlatıcı gibi çalışması gerekmez.
// Örneğin, bir oyuncu adı sağlamanız gerektiğini, ancak forma numarasının rastgele olduğunu söyleyebiliriz:
struct Playeer {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let playeer = Playeer(name: "Megan R")
print(playeer.number)

// Altın kuralı unutmayın: başlatıcı sona erdiğinde tüm özellikler bir değere sahip olmalıdır.
// Eğer başlatıcı içinde number için bir değer vermemiş olsaydık, Swift kodumuzu oluşturmayı reddedecekti.

// How do Swift’s memberwise initializers work? (Swiftin üye bazında başlatıcıları nasıl çalışır?)
// İlk olarak, özelliklerinizden herhangi biri varsayılan değerlere sahipse,
// bunlar varsayılan parametre değerleri olarak başlatıcıya dahil edilecektir. Yani, eğer şöyle bir yapı oluşturursam:
struct User {
    var name: String
    var yearsActive = 0
}
/*
struct Employee {
    var name: String
    var yearsActive = 0
}

let roslin = Employee(name: "Laura Roslin")
let adama = Employee(name: "William Adama", yearsActive: 45)
*/

/*
 Swift'in yaptığı ikinci akıllıca şey, kendi initializer'ınızı oluşturduğunuzda memberwise initializer'ı kaldırmaktır.
 Örneğin, anonim çalışanlar oluşturan özel bir başlatıcıya sahip olsaydım, şöyle görünürdü:
 
 struct Employee {
     var name: String
     var yearsActive = 0
     
     init() {
         self.name = "Anonymous"
         print("Creating an anonymous employee…")
     }
 }
 
 Bu durumda, artık memberwise initializer'a güvenemezdim, bu yüzden buna artık izin verilmeyecekti:
 let roslin = Employee(name: "Laura Roslin")

 Bu bir kaza değil, kasıtlı bir özelliktir: kendi başlatıcımızı oluşturduk ve Swift kendi üyeli başlatıcısını yerinde bırakırsa,
 kendi başlatıcımıza koyduğumuz önemli çalışmayı kaçırabilir.

 Bu nedenle, yapınız için özel bir başlatıcı eklediğiniz anda, varsayılan üyeli başlatıcı ortadan kalkar.
 Eğer kalmasını istiyorsanız, özel başlatıcınızı aşağıdaki gibi bir uzantıya taşıyın:
 
 struct Employee {
     var name: String
     var yearsActive = 0
 }

 extension Employee {
     init() {
         self.name = "Anonymous"
         print("Creating an anonymous employee…")
     }
 }

 // creating a named employee now works
 let roslin = Employee(name: "Laura Roslin")

 // as does creating an anonymous employee
 let anon = Employee()
 
 */

// self'i kullanmanın en yaygın nedeni, parametre adlarının türünüzün özellik adlarıyla
// eşleşmesini isteyeceğiniz bir başlatıcı içinde kullanmaktır:
struct Student {
    var name: String
    var bestFriend: String

    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class…")
        self.name = name
        self.bestFriend = bestFriend
    }
}

// Elbette bunu kullanmak zorunda değilsiniz, ancak parametre adlarına bir tür önek eklemek biraz beceriksizce olur:
struct Studentt {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}

// Başlatıcıların dışında, self kullanmanın ana nedeni bir closure içinde olmamız ve
// Swift'in ne olduğunu anladığımızdan emin olmak için bunu gerektirmesidir.
// Bu yalnızca bir sınıfa ait bir closure içinden self'e erişirken gereklidir ve Swift bunu eklemediğiniz sürece kodunuzu oluşturmayı reddedecektir.

