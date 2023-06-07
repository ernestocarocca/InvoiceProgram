//
//  InvoiceListView.swift
//  InvoiceProgram
//
//  Created by Ernesto Carocca on 2023-02-08.
//

import SwiftUI

struct SalaryView: View {
    var body: some View {
        ZStack {
            
                    Image("salaray")
                        .resizable()
                        .scaledToFill()
                        
                        .ignoresSafeArea()
                    // Lägg till dina andra vyer ovanpå bakgrundsbilden här.
            VStack{
                Text("Min lön gäller faktura 105 " )
                Text("Lön ink skatt:  68 500" )
                Text("sociala avgifter" )
                Text("sociala avgifter: 21 522")
                Text("Skatt: 20 550" )
                Text(" Betalas ut den 25 Mars 2023")
            }
                .foregroundColor(.white)
                .font(.system(size: 25))
                .bold()
                .padding()
                .background(  RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)))
                .foregroundColor(.yellow)
                .bold()
                .font(.headline)
               
                }

            }
        
}


struct SalaryView_Previews: PreviewProvider {
    static var previews: some View {
        SalaryView()
    }
}
