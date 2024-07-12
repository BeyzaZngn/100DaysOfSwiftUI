//
//  ContentView.swift
//  WordScramble
//
//  Created by Beyza Zengin on 11.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        
       /* List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
        }.listStyle(.grouped) */
        
        
        // List'in yapabildiği ve Form'un yapamadığı bir şey,
        // ForEach'e ihtiyaç duymadan satırlarını tamamen dinamik içerikten oluşturmaktır.
        List(0..<5) {
            Text("Dynamic row \($0)")
        }.listStyle(.grouped)
        
        List(people, id: \.self) {
            Text($0)
        }
        /*
         Bu ForEach ile aynı şekilde çalışır, bu nedenle statik ve dinamik satırları karıştırmak
         isteseydik bunun yerine bunu yazabilirdik:
         
         List {
             Text("Static Row")

             ForEach(people, id: \.self) {
                 Text($0)
             }

             Text("Static Row")
         }
        */
        
     /*   if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
        } */
        
      /*  if let fileContents = try? String(contentsOf: fileURL) {
            // we loaded the file into a string!
        } */
        
        
        // Swift bize components(separatedBy:) adında, tek bir dizeyi başka bir dizenin bulunduğu
        // her yerde parçalayarak bir dizeler dizisine dönüştürebilen bir yöntem sunar.
        // Örneğin, bu ["a", "b", "c"] dizisini oluşturacaktır:
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        // randomElement() yöntemi diziden rastgele bir öğe döndürür.
        let letter = letters.randomElement()
        
        // trimmingCharacters(in: .whitespacesAndNewlines) dizenin başta ve sondaki boşluklarını kırpar.
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

        
        /*
        
         Bir dizede yanlış yazılmış sözcük olup olmadığını kontrol etmek toplam dört adımdan oluşur.
         İlk olarak, kontrol edilecek bir kelime ve bu dizeyi kontrol etmek için kullanabileceğimiz
         bir UITextChecker örneği oluşturuyoruz:
         
         let word = "swift"
         let checker = UITextChecker()
         
         İkinci olarak, denetleyiciye dizemizin ne kadarını kontrol etmek istediğimizi söylememiz gerekir. 
         Bir kelime işlem uygulamasında bir yazım denetimi olduğunu düşünürseniz, tüm belge yerine yalnızca
         kullanıcının seçtiği metni denetlemek isteyebilirsiniz.
         
         let range = NSRange(location: 0, length: word.utf16.count)

         Üçüncü olarak, metin denetleyicimizden kelimemizdeki yazım hatalarını nerede bulduğunu bildirmesini isteyebilir,
         kontrol edilecek aralığı, aralık içinde başlanacak bir konumu ("Sonrakini Bul" gibi şeyler yapabilmemiz için),
         sona ulaştığında etrafından dolanıp dolanmayacağını ve sözlük için hangi dili kullanacağını iletebiliriz:
         
         let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

         Bu durumda, Objective-C aralığı boş olarak geri dönerse - yani, dize doğru yazıldığı için bir yazım hatası yoksa 
         - o zaman NSNotFound özel değerini geri alırız.

         Böylece, bir hata olup olmadığını görmek için yazım sonucumuzu bu şekilde kontrol edebiliriz:
         
         let allGood = misspelledRange.location == NSNotFound

        */

    }
}

#Preview {
    ContentView()
}
