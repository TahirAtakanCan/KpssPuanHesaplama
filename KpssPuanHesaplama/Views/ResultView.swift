//
//  ResultView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData

struct ResultView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var results: [Result]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        ForEach(results){ result in
                            VStack(alignment: .leading) {
                                Text(result.sınavAdi)
                                    .bold()
                                    .font(.headline)
                                HStack {
                                    HStack(alignment: .top){
                                        Text("Genel Yetenek:")
                                        Text(result.gyNet.formatted())
                                    }
                                    Spacer()
                                    HStack(alignment: .top){
                                        Text("ÖABT:")
                                        Text((result.oabtNet ?? 0).formatted())
                                    }
                                }
                                
                                HStack {
                                    HStack{
                                        Text("Genel Kültür:")
                                        Text(result.gyNet.formatted())
                                    }
                                    Spacer()
                                    HStack{
                                        Text("Eğitim Bilimleri:")
                                        Text((result.ebNet ?? 0).formatted())
                                    }
                                }
                                
                                HStack {
                                    Text("Puan:")
                                    Text(result.sonuc.formatted())
                                        .bold()
                                        .italic()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text(result.tarih.formatted(date:.complete, time:.omitted))
                                        .italic()
                                        .font(.footnote)
                                }
                                
                            }
                        }
                        .onDelete{ indexSet in
                            for index in indexSet{
                                modelContext.delete(results[index])
                            }
                        }
                    }
                }
                }
                .navigationTitle("Hesaplamalar")
            }
        }
    }
                                
#Preview {
    ResultView()
}
