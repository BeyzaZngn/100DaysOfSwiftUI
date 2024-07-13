//
//  ContentView.swift
//  WordScrambleMain
//
//  Created by Beyza Zengin on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        
        NavigationStack {
            
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            // onSubmit() işlevine parametre kabul etmeyen ve hiçbir şey döndürmeyen bir işlev
            // verilmesi gerekir; bu da az önce yazdığımız addNewWord() yöntemiyle tam olarak eşleşir.
            .onSubmit(addNewWord)
        }.onAppear(perform: startGame)
        
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        
        // "OK" butonu oluşturmadan otomatik "OK" oluşturan uyarı kodu:
        /*
         .alert(errorTitle, isPresented: $showingError) { } message: {
             Text(errorMessage)
         }
        */
        
    }
    
    func addNewWord() {
        // büyük/küçük harf farkı olan yinelenen sözcükler eklemediğimizden emin olmak için
        // sözcüğü küçük harfle yazın ve kırpın.
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // kalan dize boşsa çık.
        guard answer.count > 0 else { return }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        
    }
    
    func startGame() {
        // 1. Uygulama paketimizde start.txt için URL'yi bulun.
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. start.txt dosyasını bir dizeye yükleyin.
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Dizeyi bir dizi dizeye böl, satır sonlarında böl.
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Rastgele bir kelime seçin veya mantıklı bir varsayılan olarak "silkworm" kullanın
                rootWord = allWords.randomElement() ?? "silkworm"

                // Eğer buradaysak her şey yolunda gitmiştir, bu yüzden çıkabiliriz.
                return
            }
        }

        // Eğer *buradaysak* bir sorun var demektir - bir çökme tetikleyin ve hatayı bildirin.
        fatalError("Could not load start.txt from bundle.")
    }
    
    
    /*
     Bu metot tek parametre olarak bir string kabul edecek ve kelimenin daha önce
     kullanılıp kullanılmadığına bağlı olarak true ya da false döndürecektir. Zaten bir
     usedWords dizimiz var, bu nedenle kelimeyi contains() yöntemine geçirebilir ve sonucu
     şu şekilde geri gönderebiliriz:
    */
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    
    /*
     Kök kelimenin değişken bir kopyasını oluşturursak, kullanıcının girdiği kelimenin her bir
     harfi üzerinde döngü yaparak o harfin kopyamızda olup olmadığını görebiliriz. Eğer varsa,
     onu kopyadan çıkarırız (böylece iki kez kullanılamaz), sonra devam ederiz. Kullanıcının
     kelimesinin sonuna başarıyla ulaşırsak, kelime iyidir, aksi takdirde bir hata vardır ve 
     false döndürürüz.
    */
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    
    /*
     Son yöntemimiz, dizeleri yanlış yazılmış sözcükler için taramaktan sorumlu olan bir UITextChecker
     örneği oluşturacaktır. Daha sonra dizemizin tüm uzunluğunu taramak için bir NSRange oluşturacağız,
     ardından metin denetleyicimizde rangeOfMisspelledWord() işlevini çağıracağız, böylece yanlış
     kelimeleri arayacak. Bu bittiğinde, yanlış yazılmış kelimenin nerede bulunduğunu bize söyleyen
     başka bir NSRange geri alacağız, ancak kelime tamamsa, bu aralığın konumu NSNotFound özel
     değeri olacaktır.
    */
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    
    /* Aldığı parametrelere göre başlığı ve mesajı ayarlayan, ardından showingError Boolean'ını
     true değerine çeviren bir yöntem ekleyebiliriz:
    */
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
  
}

#Preview {
    ContentView()
}


/*

Projemize bir dosya eklemeyi unutmamız gibi, bunun gibi sorunlar için, uygulamamızın bozuk bir
durumda devam etmesini sağlamaya çalışmanın bir anlamı yoktur. Hemen sonlandırmak ve bize neyin
yanlış gittiğine dair net bir açıklama vermek çok daha iyidir, böylece sorunu düzeltebiliriz
ve fatalError() tam olarak bunu yapar.
 
*/


/*
 
 SwiftUI, bir görünüm gösterildiğinde bir kapanışı çalıştırmak için bize özel bir 
 görünüm değiştirici verir, böylece startGame()'i çağırmak ve işleri harekete geçirmek
 için bunu kullanabiliriz:
 
 .onAppear(perform: startGame)
 
 */
