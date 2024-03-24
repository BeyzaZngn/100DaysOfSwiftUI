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
