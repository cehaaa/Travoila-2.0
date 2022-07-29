//
//  Newtrip.swift
//  Travoila
//
//  Created by Patrick Louis on 15/05/22.
//
import SwiftUI

struct NewTripView: View {
    
    @State var tripTitle: String = ""
    @State var tripDestination: String = ""
    
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    
    @State var totalBudgetEstimation: String = ""
    @State var listRowColor: Color = Color.gray.opacity(0.08)
    
    @Binding var trips: [Trip]
    @Binding var isNoTrip: Bool
    @Binding var currentTrip: Trip

    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Form {
                Section ( header: Text("Trip Title")) {
                    TextField("Trip Title", text: $tripTitle)
                        .listRowBackground(listRowColor)
                }
                
                Section ( header: Text("Trip Destination")) {
                    TextField("Trip Destination", text: $tripDestination)
                        .listRowBackground(listRowColor)
                }
                
                Section(header: Text("Date")){
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        .listRowBackground(listRowColor)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                        .listRowBackground(listRowColor)
                }
                
                Section(header: Text("Total Budget Estimation")){
                    TextField("IDR 0",text: $totalBudgetEstimation)
                        .listRowBackground(listRowColor)
                        .keyboardType(.default)
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
            
            Button(action: {
                createNewTrip()
            }){
                Text("Save")
                    .bold()
                    .frame(width: 340, height: 50)
                    .background(Color("CustomColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
            }
            .frame(minWidth:0,  maxWidth: .infinity)
        }
        .navigationTitle("New Trip")
    }
    
    func createNewTrip(){
        trips.append(
            Trip(id: 0, title: tripTitle, destination: tripDestination, startDate: startDate, endDate: endDate, totalBudgetEstimation: Int(totalBudgetEstimation) ?? 0, allocations: [] )
        )
        
        currentTrip = trips.last ?? Trip(id: 0, title: "Default", destination: "Default", startDate: Date(), endDate: Date(), totalBudgetEstimation: 20000, allocations: [])
        
        isNoTrip = false
        
        mode.wrappedValue.dismiss()
    }
}

struct NewTripView_Previews: PreviewProvider {
    
    @State private static var dummyData: [Trip] = []
    @State private static var isNoTrip: Bool = true
    @State private static var currentTrip = Trip(id: 0, title: "Default", destination: "Default", startDate: Date(), endDate: Date(), totalBudgetEstimation: 20000, allocations: [])
    
    static var previews: some View {
        NewTripView(trips: $dummyData, isNoTrip: $isNoTrip, currentTrip: $currentTrip)
    }
}
