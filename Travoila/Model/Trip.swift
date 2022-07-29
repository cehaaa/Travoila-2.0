//
//  Trip.swift
//  Travoila
//
//  Created by christian gouw on 18/05/22.
//

import Foundation

struct Trip {
    var id: Int
    var title: String;
    var destination: String;
    var startDate: Date;
    var endDate: Date;
    var totalBudgetEstimation: Int;
    var allocations: [Allocation]?
}
