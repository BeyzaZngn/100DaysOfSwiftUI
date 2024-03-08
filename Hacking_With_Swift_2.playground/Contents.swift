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

