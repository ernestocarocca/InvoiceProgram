//
//  InvoiceDetails.swift
//  InvoiceProgram
//
//  Created by Ernesto Carocca on 2023-02-09.
//

import SwiftUI

struct InvoiceDetails: View  {
    var invoice: Invoice
    let dateFormatter = DateFormatter()
    
    var body: some View {
        let lastPayDayString = convertDateToString(invoice.lastPayDate)
        // This VStack contains the header of the invoice view, with the company name and logo.
        VStack{
            
            VStack{
                
                Text("DreamIT")
                    .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            .offset(y: 80)
            .font(.system(size: 35 ,weight: .bold))
            .bold()
            .ignoresSafeArea()
            
            VStack{
                VStack{
                    
                    Text("FAKTURA")
                    
                    Text("Kund:" + "\(invoice.client?.name ?? "")" )
                        .foregroundColor(.blue)
                    
                    Text("faktura datum" + "\(invoice.date)")
                        .foregroundColor(.white)
                }
                .bold()
                .padding()
                .foregroundColor(.white)
                
                VStack{
                    Text("Moms" + " \(invoice.total - invoice.amount)" +  " kr")
                    Text("ink moms " + "\(invoice.amount) " +  "  kr")
                    
                }
                .bold()
                .foregroundColor(.white)
                
                VStack{
                    Text("FÖRFALLO DATUM" + lastPayDayString )
                        .foregroundColor(.black)
                }
                
                
            }
            
            .foregroundColor(.white)
            .bold()
            .padding()
            .frame(width: 360, height: 180)
            .font(.system(size: 20 ,weight: .bold))
            
            .background(
                
                RoundedRectangle(cornerRadius: 30,style: .continuous)
                
                    .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)))
            
            .offset(y: 190)
            
            
            VStack{
                Text("FAKTURA TEXT")
                    .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .bold()
                    .padding()
                    .font(.system(size: 15 ,weight: .bold))
                
                
                Text("Uppdrag : " + "\(invoice.invoiceJobAssignment)")
                    .foregroundColor(.white)
                
                
            }
            .offset(y: 250)
            Spacer()
            
            VStack{
                
                Text(" BELOPP ATT BETALA:" + "\(invoice.total)" + "kr")
                    .foregroundColor(.green)
                    .bold()
                    .frame(width:350, height: 50)
                    .font(.system(size: 15 ,weight: .bold))
                    .background(
                        
                        
                        RoundedRectangle(cornerRadius: 30,style: .continuous)
                        
                            .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)))
            }
            .padding()
            .offset(y:-70)
            
            
        }
        
        .background(.black)
        .ignoresSafeArea()
           
    }
    
}

func convertDateToString(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}



