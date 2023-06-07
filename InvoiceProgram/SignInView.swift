//
//  SignInView.swift
//  InvoiceProgram
//
//  Created by Jonas Backas on 2023-06-07.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

    var email = ""

    struct SignInView: View {
        @EnvironmentObject var viewLoginUser: LoginUser
        @State var emailText = ""
        @State  var password = ""
        @State private var userIslogggedIn = false
        @State var user : User?
        @State var users =  [User]()
    
        
        var body: some View {
            NavigationView{
            
            ZStack{
                Color.black
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 600, height: 1000)
                    .rotationEffect(.degrees(650))
                    .offset(y:-350)
                
                
                
                VStack(spacing: 20){
                    Text("Välkommen")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(y: -70)
                    
                    
                    
                    Text("Början till att äga din dröm")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .offset(y: -100)
                    
                    TextField("email",text: $emailText)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: emailText.isEmpty){
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                            
                            
                        }
                    
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    SecureField("password",text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty){
                            Text("Lösenord")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    Button { //register()
                        email = emailText
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewLoginUser.signIn(email:email, password: password)
                        
                    }label: {
                        Text("logga in")
                            .bold()
                            .frame(width: 200, height: 40)
                        
                            .background(
                                RoundedRectangle(cornerRadius: 10,style: .continuous)
                                    .fill(.linearGradient(colors: [.blue , .black], startPoint: .top, endPoint: .bottomTrailing))
                                
                            )
                    }
                    .padding()
                    
                    NavigationLink("Skapa ett konto här", destination: SignUpView())
                    
                    Text( "DreamIT to live IT")
                        .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .offset(y: 130)
                        .frame(alignment: .center)
                        .padding()
                    
                }
                
                .frame(width:350, height: 1)
                .foregroundColor(.white)
                
            }
            
            .frame(width: 50)
            
            .onAppear(){
                
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIslogggedIn.toggle()
                    }
                }
            }
            
        }
        .ignoresSafeArea()
    }
    
}
