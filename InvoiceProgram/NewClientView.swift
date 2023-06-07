//
//  NewClientView.swift
//  InvoiceProgram
//
//  Created by Ernesto Carocca on 2023-02-15.
//
import Foundation
import SwiftUI
import Firebase

var clientAddress = ""
var clientYourRefName = ""
var organizationNumber = 0
var vatNumber = 0
var clientName = ""


struct NewClientView: View {
    @State var clients =  [Client]()
    var db = Firestore.firestore()
    
    @State var client: Client?
    var body: some View {
        VStack{
            
            NavigationView{
                
                List{
                    ForEach(clients) { client in
                        NavigationLink( destination: clientDetailsView(client: client)){
                            Text(client.name ?? "")
                            
                            Image("clintsuite")
                                .resizable()
                                .scaledToFill()
                            
                        }
                        .background(
                            
                            RoundedRectangle(cornerRadius: 30,style: .continuous)
                            
                                .foregroundStyle(.linearGradient(colors: [.black, .white], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    }
                    
                }
                
                .navigationBarItems(trailing: NavigationLink(destination: CreateClientView()){
                    Image(systemName: "person.3.sequence.fill")
                        .foregroundColor(.green)
                        .padding()
                })
            }
            .onAppear{
                getChosenClient()
                listenToClientInFirestore()
                
            }
        }
    }
    

    struct clientDetailsView: View {
        var client: Client
        var body: some View {
            Form{
                Text("FÖRETAG" + " \(client.name ?? "")")
                    .foregroundColor(.black)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 30,style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)))
                
                Text("FÖRETAG ADRESS" + " \(client.CompanyAdres ?? "")")
                    .foregroundColor(.black)
                Text("REFERENS" + " \(client.referens ?? "")")
                    .foregroundColor(.black)
                Text("ORGNUMMER" + " \(client.organizationNumber ?? "")")
                    .foregroundColor(.black)
            }
            
        }
        
        
    }
    
    
    func getChosenClient(){
        for client in clients {
            //   print(user.email)
            // print(email)
            if(client.name == clientName){
                print("hittade!!")
                print(client.name ?? "")
                self.client = client
            }
        }
        
    }
    
    
    func listenToClientInFirestore() {
        
        db.collection("clients").addSnapshotListener { snapshot, err in
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("Error getting document \(err)")
            } else {
                clients.removeAll()
                for document in snapshot.documents {
                    
                    print(document)
                    let result = Result {
                        try document.data(as: Client.self)
                        
                    }
                    switch result  {
                    case .success(let client)  :
                        clients.append(client)
                    case .failure(let error) :
                        print("Error decoding item: \(error)")
                    }
                    
                }
                
            }
        }
    }
}

struct NewCientView_Previews: PreviewProvider {
    static var previews: some View {
        NewClientView( client: Client())
    }
}


struct circlenavigationCrateClient: View{
    var color: Color
    var navigationText: String
    var body: some View{
        ZStack {
            Circle()
                .frame(width: 50, height: 60)
                .foregroundColor(color)
                .padding(40)
                .ignoresSafeArea()
            
            Text("NY KUND")
                .foregroundColor(.white)
                .font(.system(size: 10,weight: .bold))
                .bold()
        }
           
    }
}
