//
//  Expense.swift
//  Travoila
//
//  Created by Patrick Louis on 19/05/22.
//

import SwiftUI

struct ExpenseView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button (action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
            //            .fullScreenCover(isPresented: $showSheet, content: {
            //                SecondScreen()
            //            })
            .sheet(isPresented: $showSheet, content: {
                // DO NOT ADD CONDITIONAL LOGIC
                SecondScreen()
            })
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var expenseTitle: String = ""
    @State var expenseAmount: String = ""
    @State var selectCategory: Bool = false
    @State var expenseDate: Date = Date()
    @State var expenseNote: String = ""
    
    //    @ObservedObject var input = NumbersOnly()
    @State var listRowColor: Color = Color.gray.opacity(0.08)
    
    var body: some View {
        VStack {
            VStack {
                Form {
                    Section ( header: Text("Title")) {
                        TextField("Input Title", text: $expenseTitle)
                            .listRowBackground(listRowColor)
                    }
                    
                    Section ( header: Text("Amount")) {
                        TextField("IDR", text: $expenseAmount)
                            .listRowBackground(listRowColor)
                    }
                    
                    Section(header: Text("Category")){
                        HStack {
                            Text("Category")
                            Spacer()
                            Text("Select")
                                .foregroundColor(Color("CustomColor"))
                                .onTapGesture {
                                    self.selectCategory = true
                                }
                        }
                        .listRowBackground(listRowColor)
                    }
                    
                    Section(header: Text("Date")){
                        DatePicker("Expense Date", selection: $expenseDate, displayedComponents: .date)
                            .listRowBackground(listRowColor)
                    }
                    
                    Section(header: Text("Note")){
                        TextField("Optional",text: $expenseNote)
                            .listRowBackground(listRowColor)
                            .keyboardType(.default)
                    }
                }
                
                .sheet(isPresented: $selectCategory){
                    NavigationView {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 30.0) {
                                HStack(alignment: .center) {
                                    VStack(spacing: 12.0) {
                                        Image("Transportation")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Food & Beverage")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Activity")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                                
                                HStack(alignment: .center) {
                                    VStack(spacing: 12.0) {
                                        Image("Accomodation")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Shopping")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Emergency Fund")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                }
                                
                                HStack {
                                    VStack(spacing: 12.0) {
                                        Image("Others")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                    }
                                    
                                }
                                
                            }
                            .padding(.horizontal, 20.0)
                        }
                        .frame(alignment: .topLeading)
                        .padding(.top, 20.0)
                        .navigationTitle("Choose Category")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(
                            leading:
                                Button(action: {
                                    self.selectCategory = false
                                }){
                                    Text("Back")
                                        .foregroundColor(Color("CustomColor"))
                                }
                        )
                    }
                }
                
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear {
                    UITableView.appearance().backgroundColor = .systemGroupedBackground
                }
                
                Button(action: {
                    
                    // SummaryView() > ini nanti alternatif 2 button aja
                }){
                    Text("Save")
                        .bold()
                        .frame(width: 340, height: 50)
                        .background(Color("CustomColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                }
                .frame(minWidth:0,  maxWidth: .infinity)
            }
            .navigationTitle("Add Expense")
        }
        //        ZStack (alignment: .topLeading) {
        //            Color.white
        //                .ignoresSafeArea()
        //
        //
        //            Button (action: {
        //                presentationMode.wrappedValue.dismiss()
        //            }, label: {
        //                Image(systemName: "xmark")
        //                    .foregroundColor(.gray)
        //                    .font(.largeTitle)
        //                    .padding(20)
        //            })
        //        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
