//
//  LoginUser.swift
//  InvoiceProgram
//
//  Created by Ernesto Carocca on 2023-02-01.
//

import SwiftUI
import Firebase

class LoginUser: ObservableObject {
    @State var user: User?
    let auth = Auth.auth()
    
    @Published var signedIn = false
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
    
        auth.signIn(withEmail: email, password: password){[weak self]result, error in
            guard result != nil, error == nil else{
                return
            }
            // Success
            DispatchQueue.main.async {
                
                self?.signedIn = true
                
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){[weak self] result, error in
            guard result != nil, error == nil else{
                return
                
            } // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    // signout func
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
        
    }
}
