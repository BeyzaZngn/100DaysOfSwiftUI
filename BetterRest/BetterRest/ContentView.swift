//
//  ContentView.swift
//  BetterRest
//
//  Created by Beyza Zengin on 9.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            
            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
                .labelsHidden()
            // displayedComponents: .hourAndMinute yazarsak sadece saat ve dakika gözükür.
               
            // Bu, gelecekteki tüm tarihlere izin verir, ancak geçmişte hiçbirine izin vermez,
            // bunu "mevcut tarihten herhangi bir şeye kadar" olarak okuyun.
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            
            /*
            
             Bugün sabah 8'i temsil eden bir tarih istiyorsak, şöyle bir kod yazabiliriz:
             
             var components = DateComponents()
             components.hour = 8
             components.minute = 0
             let date = Calendar.current.date(from: components)
             
             date(from:) yöntemi aslında isteğe bağlı bir tarih döndürür, bu nedenle "bu başarısız
             olursa, bana geçerli tarihi geri ver" demek için nil birleştirme kullanmak iyi bir fikirdir,
             bunun gibi:
             
             let date = Calendar.current.date(from: components) ?? .now
             
             ---
             let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
             let hour = components.hour ?? 0
             let minute = components.minute ?? 0
             ---
             
             Örneğin, bir tarihten sadece saati almak isteseydik bunu yazardık:
             Text(Date.now, format: .dateTime.hour().minute())
             
             Ya da gün, ay ve yıl bilgisini istiyorsak bunu yazmamız gerekir:
             Text(Date.now, format: .dateTime.day().month().year())

             formatted() yöntemini doğrudan tarihlerde kullanabilir ve hem tarihin hem de saatin nasıl
             biçimlendirilmesini istediğimize ilişkin yapılandırma seçeneklerini aşağıdaki gibi
             iletebiliriz:
             
            */
            Text(Date.now.formatted(date: .long, time: .shortened))

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
