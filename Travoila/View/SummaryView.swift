//
//  SummaryView.swift
//  Travoila
//
//  Created by christian gouw on 18/05/22.
//

import SwiftUI

struct SummaryView: View {
    
    @State var newAllocation: Bool = false
    @State var chooseCategory: Bool = false
    
    @State var selectCategory: Bool = false
    @State var selectedCategory: String = "Category"
    @State var budgetAllocation: String = ""
    
    @Binding var trips: [Trip]
    @Binding var currentTrip: Trip
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading ) {
                HStack() {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Total Expenses")
                            .font(.callout)
                        Text("IDR. 5,170")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Total Budget")
                            .font(.callout)
                        Text("IDR. \(currentTrip.totalBudgetEstimation)")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top, 20.0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 50.0)
            
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("Budget Allocation")
                    
                    Spacer()
                    
                    Button(action: {
                        self.newAllocation = true
                    }){
                        Label("New Allocation", systemImage: "plus")
                            .foregroundColor(Color("CustomColor"))
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(currentTrip.allocations?.count  ?? 0 <= 0){
                VStack(spacing: 100.0) {
                    Image("SummaryEmpty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 200, alignment: .center)
                        .padding(.top, 100.0)
                    
                    Text("You have not set any budget category allocation")
                        .multilineTextAlignment(.center)
                        .frame(width: 280, height: 50)
                        .font(.system(size: 16,weight: .thin))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            } else {
                
                VStack {
                    ScrollView {
                        
                        ForEach(currentTrip.allocations!, id: \.id) { allocation in
                            VStack(spacing: 10) {
                                VStack {
                                    HStack(alignment: .center) {
                                        HStack (spacing: 10){
                                            Image(allocation.category)
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                            
                                            
                                            Text(allocation.category)
                                                .fontWeight(.bold)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 5) {
                                            Text("IDR \(allocation.amount) left")
                                                .font(.system(size: 14))
                                            
                                            Text("of IDR \(allocation.amount)")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12))
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                }
                            }
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.horizontal, 20)
        .navigationTitle(currentTrip.title)
        .sheet(isPresented: $newAllocation){
            NavigationView {
                VStack {
                    Form {
                        Section(header: Text("Category")){
                            HStack {
                                Text(selectedCategory)
                                Spacer()
                                Text("Select")
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        self.selectCategory = true
                                    }
                            }
                        }
                        Section(header: Text("Budget Allocation"), footer: HStack(alignment: .top) {
                            Text("Your remaining budget")
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 10.0) {
                                Text("IDR 0")
                                    .font(.callout)
                                    .foregroundColor(.black)
                                
                                Text("of IDR 15,000,000")
                            }
                        }) {
                            TextField("IDR", text: $budgetAllocation)
                        }
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
                                            .onTapGesture {
                                                selectedCategory = "Transportation"
                                                selectCategory = false
                                            }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Food & Beverage")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .onTapGesture {
                                                selectedCategory = "Food & Beverage"
                                                selectCategory = false
                                            }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Activity")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .onTapGesture {
                                                selectedCategory = "Activity"
                                                selectCategory = false
                                            }
                                    }
                                }
                                
                                HStack(alignment: .center) {
                                    VStack(spacing: 12.0) {
                                        Image("Accomodation")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .onTapGesture {
                                                selectedCategory = "Accomodation"
                                                selectCategory = false
                                            }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Shopping")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .onTapGesture {
                                                selectedCategory = "Shopping"
                                                selectCategory = false
                                            }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 12.0) {
                                        Image("Emergency Fund")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .onTapGesture {
                                                selectedCategory = "Emergency Fund"
                                                selectCategory = false
                                            }
                                    }
                                }
                                
                                HStack {
                                    VStack(spacing: 12.0) {
                                        Image("Others")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .onTapGesture {
                                                selectedCategory = "Others"
                                                selectCategory = false
                                            }
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
                .navigationTitle("New Allocation")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            self.newAllocation = false
                        }){
                            Text("Cancel")
                                .foregroundColor(Color("CustomColor"))
                        },
                    
                    trailing:
                        Button(action: {
                            createNewAllocation()
                        }){
                            Text("Save")
                                .foregroundColor(Color("CustomColor"))
                        }
                )
                
            }
        }
    }
    
    
    func createNewAllocation(){
        currentTrip.allocations?.append(
            Allocation(id: currentTrip.allocations!.count + 1, category: selectedCategory, amount: Int(budgetAllocation) ?? 0, expanses: [])
        )
        
        newAllocation = false
        
        selectedCategory = "Category"
        budgetAllocation = ""
    }
    
}

struct SummaryView_Previews: PreviewProvider {
    
    @State private static var dummyData: [Trip] = []
    @State private static var currentTrip = Trip(id: 0, title: "Default", destination: "Default", startDate: Date(), endDate: Date(), totalBudgetEstimation: 20000, allocations: [])
    
    static var previews: some View {
        SummaryView(trips: $dummyData, currentTrip: $currentTrip)
    }
}
