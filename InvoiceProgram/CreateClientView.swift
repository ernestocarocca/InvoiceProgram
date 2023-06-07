//
//  CreateClientView.swift
//  InvoiceProgram
//
//  Created by Jonas Backas on 2023-06-07.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

struct CreateClientView: View{
    var db = Firestore.firestore()
    
    @State var clientName = ""
    @State var clientAddress = ""
    @State var clientYourRefName = ""
    @State  var organizationNumber = ""
    @State var vatNumber = ""
    
    var body: some View{
        
        ZStack(){
            
            
            Image("ClientPhoto")
                .resizable()
                .scaledToFill()
            
            
            VStack{
                
                TextField("kund ",text: $clientName)
                    .padding()
                    .background(  RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .foregroundColor(.black)
                    .bold()
                    .font(.headline)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                
                
                TextField("Adress", text: $clientAddress)
                    .padding()
                    .background(  RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .foregroundColor(.black)
                    .bold()
                    .font(.headline)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Referens", text: $clientYourRefName)
                    .padding()
                    .background(  RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .foregroundColor(.black)
                    .bold()
                    .font(.headline)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Orgnummer", text: $organizationNumber)
                    .padding()
                    .background(  RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .foregroundColor(.yellow)
                    .bold()
                    .font(.headline)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Momsnummer", text: $vatNumber)
                    .padding()
                    .background(  RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .foregroundColor(.black)
                    .bold()
                    .font(.headline)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                
                Button(action:{
                    addNewClient()
                    makeEmptyString()
                },
                       label: {Text("Spara Kund".uppercased())
                        .padding()
                        .frame(width:200  ,height: 55)
                        .background(
                            RoundedRectangle(cornerRadius: 10,style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.black, .white], startPoint: .topLeading, endPoint: .bottomTrailing)))
                        .font(.headline)
                })
                
            }
        }
        .ignoresSafeArea()
        
    }
    
    func makeEmptyString() {
        clientName = ""
        vatNumber = ""
        clientAddress = ""
        clientYourRefName = ""
        organizationNumber = ""
        
    }
    
    func addNewClient() {
        
        let client = Client( name: clientName, organizationNumber: organizationNumber, CompanyAdres: clientAddress, vat: vatNumber, referens: clientYourRefName)
        
        
        
        do{
            _ = try    db.collection("clients").addDocument(from: client)
            
        }catch {
            print("Error saving to DB")
        }
        
    }
    
}

