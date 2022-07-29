//
//  OnBoardingView.swift
//  Travoila
//
//  Created by christian gouw on 11/05/22.
//

import SwiftUI

struct OnBoardingView: View {
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack(alignment: .center, spacing: 50) {
                    VStack(alignment: .center) {
                        Text("Travoila!")
                            .font(.system(size: 48, weight: .semibold))
                            .foregroundColor(Color("CustomColor"))
                        
                        Text("Managing Your Budget Trip Effectively")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color.gray)
                        
                    }
                    .frame(minWidth:0,  maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 50) {
                        HStack( alignment: .center, spacing: 20){
                            Image("Wallet")
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading, spacing: 5){
                                Text("Personal Trip Assistant")
                                    .font(.headline)
                                Text("Help travellers in managing their budgets. Say no more to overbudget trip!")
                                    .font(.system(size: 13, weight: .light))
                                    .foregroundColor(Color.gray)
                            }
                        }
                        
                        
                        HStack( alignment: .center, spacing: 20){
                            Image("Exclamation")
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading, spacing: 5){
                                Text("Budget Reminder")
                                    .font(.headline)
                                Text("Set your own preference in limiting budget and be notified by the app to keep on your track.")
                                    .font(.system(size: 13, weight: .light))
                                    .foregroundColor(Color.gray)
                            }
                        }
                        
                        
                        HStack( alignment: .center, spacing: 20){
                            Image("Time")
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading, spacing: 5){
                                Text("Track Travel History")
                                    .font(.headline)
                                Text("Set your own preference in limiting budget and be notified by the app to keep on your track.")
                                    .font(.system(size: 13, weight: .light))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink( destination:
                                        TabContainerView()
                        .navigationBarBackButtonHidden(true)
//                        .navigationTitle("Budget Trips")
//                        .navigationBarTitleDisplayMode(.large)
                    ){
                        Text("Get Started")
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            .padding(.vertical, 15.0)
                            .frame(minWidth:0,  maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 0)
                                    .background(Color("CustomColor").cornerRadius(10)))
                        
                            .frame(minWidth:0,  maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 45)
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(.vertical, 50)
                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
