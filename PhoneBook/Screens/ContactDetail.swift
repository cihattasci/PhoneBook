//
//  ContactDetail.swift
//  PhoneBook
//
//  Created by Cihat Tascı on 15.09.2023.
//

import SwiftUI

struct ContactDetail: View {
    let contact: String
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            PersonProfile(name: contact)
            HStack{
                TopButton(icon: "message.fill", name: "mesaj")
                TopButton(icon: "phone.fill", name: "ara")
                TopButton(icon: "video.fill", name: "görüntülü")
                TopButton(icon: "envelope.fill", name: "e-posta")
                TopButton(icon: "dollarsign", name: "öde")
            }
            ScrollView{
                PhoneLine()
                FaceTime()
                NotePart()
                CustomMultiList(texts: ["Mesaj Gönder", "Kişiyi Paylaş", "Hızlı Aramaya Ekle"])
                CustomList(text: "Acil Durum Kişileri'ne Ekle", color: .accentColor, isMulti: false)
                CustomList(text: "Konumunu Paylaş", color: .accentColor, isMulti: false)
                CustomList(text: "Bu Arayanı Engelle", color: .red, isMulti: false)
            }
            
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("")
                    } label: {
                        Text("Düzenle")
                    }
                    
                }
            }
        }
    }
}

struct PersonProfile: View {
    let name: String
    
    var body: some View {
        VStack{
            Text(name.prefix(1).uppercased())
                .foregroundColor(.primary)
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .background(.gray)
                .cornerRadius(40)
                .bold()
            Text(name)
                .foregroundColor(.primary)
                .font(.largeTitle)
                .padding(.bottom, 5)
        }
    }
}

struct TopButton: View {
    let icon: String
    let name: String
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Button {
            print("")
        } label: {
            VStack{
                Image(systemName: icon).foregroundColor(.accentColor).font(.title3)
                Text(name).font(.caption).foregroundColor(.accentColor).padding(.top, 1)
            }
            .frame(width: width/5-10, height: 60)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
        
    }
}

struct PhoneLine: View {
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Button {
            print("")
        } label: {
            VStack(alignment: .leading){
                Text("telefon")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.bottom, -4)
                    .foregroundColor(.primary)
                Text("+90 (123) 456 78 90")
                    .padding(.leading)
            }
            .frame(width: width - 17, height: 60)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
    }
}

struct FaceTime: View {
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        HStack{
            Text("FaceTime")
                .padding(.horizontal)
            Spacer()
            HStack{
                Button {
                    print("")
                } label: {
                    Image(systemName: "video.fill")
                        .frame(width: 40, height: 40)
                        .background(.ultraThinMaterial)
                        .cornerRadius(30)
                }
                
                Button {
                    print("")
                } label: {
                    Image(systemName: "phone.fill")
                        .frame(width: 40, height: 40)
                        .background(.ultraThinMaterial)
                        .cornerRadius(30)
                }
            }
            .padding(.horizontal)
        }
        .frame(width: width - 17, height: 60)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct NotePart: View {
    @State private var text: String = ""
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            Text("Notlar")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal)
            TextField("", text: $text, axis: .horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Spacer()
        }
        .frame(width: width - 17, height: 120)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct CustomList: View {
    let text: String
    let color: Color
    let isMulti: Bool
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading){
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .foregroundColor(color)
            }
            .frame(width: width - 17, height: 47)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
    }
}

struct CustomMultiList: View {
    let texts: [String]
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(texts.indices, id: \.self) { i in
                Button(action: {}) {
                    Text(texts[i])
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        .foregroundColor(.accentColor)
                }
                if i != texts.count - 1 { Divider() }
            }
        }
        .padding(.vertical, 10)
        .frame(width: width - 17, height: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(contact: "")
    }
}
