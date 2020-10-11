//
//  InputFormData.swift
//  ACChecker
//
//  Created by Abdelrahman Alsaidi on 11/10/2020.
//

import Foundation
import UIKit

class InputFormData: NSObject, FormDataSource {
    typealias BindModel = Input

    var basicRows: [BaseRow] = []

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(at section: Int) -> Int {
        switch section {
        case 0: return basicRows.count
        default: fatalError()
        }
    }

    func row(at indexPath: IndexPath) -> BaseRow {
        switch indexPath.section {
        case 0: return basicRows[indexPath.row]
        default: fatalError()
        }
    }

    var bindModel: Input

    init(_ input: Input) {
        self.bindModel = input

        basicRows.append(DoubleRow(title: "Current AC Temp",
                                   icon: "",
                                   kvcKey: "current_ac",
                                   value: input.current_ac ?? 0,
                                   placeholder: ""))

        basicRows.append(TimeIntervalRow(title: "Required Seconds Interval",
                                   icon: "",
                                   kvcKey: "required_interval",
                                   value: input.required_interval,
                                   placeholder: ""))


        basicRows.append(StringRow(title: "Current City",
                                   icon: "",
                                   kvcKey: "current_city",
                                   value: input.current_city ?? "",
                                   placeholder: ""))

    }

    override init() { fatalError("not implemented") }
}
