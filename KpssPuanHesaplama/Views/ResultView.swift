//
//  ResultView.swift
//  KpssPuanHesaplama
//
//  Created by Tahir Atakan Can on 10.07.2024.
//

import SwiftUI
import SwiftData
import Lottie

struct ResultView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Result.tarih, order: .reverse) private var results: [Result]
    @Binding var selectionTabItem: Int
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(results){ result in
                        VStack(alignment: .leading) {
                            Text(result.sinavAdi)
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
                                Text(result.tarih.formatted(date:.complete, time: .omitted))
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
                .overlay{
                    GeometryReader { geo in
                        
                            if results.isEmpty {
                                ContentUnavailableView {
                                    Label("Sonuç Bulunamadı", systemImage: "magnifyingglass")
                                } description: {
                                    VStack {
                                        Text("Henüz sonuç bulunamadı. Puan hesaplamaya başlamak için lütfen başlangıç sekmesini kullanın.")
                                        LottieView(animation: .named("Animation - 1726122307615"))
                                            .looping()
                                            .frame(height: geo.size.height * 0.5 )
                                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    }
                                } actions: {
                                    Button("KPSS Puan Hesaplaması Yap"){
                                        selectionTabItem = 0
                                    }
                                }
                                
                            }
                        
                    }
                }
            }
            .navigationTitle("Hesaplamalar")
            .toolbar {
                EditButton()
            }
            
        }
    }
}

#Preview {
    ResultView(selectionTabItem: .constant(1))
}

