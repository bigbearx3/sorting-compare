//
//  ArrayTypes.swift
//  sorting-compare
//

import Foundation

enum ArrayTypes{
    case sorted
    case reverseSorted
    case weakSorted
    case unsorted
    func getArray(withSize : Int) -> (Int)->[Int]{
        switch self {
        case .sorted : return Util.getSortetArray
        case .reverseSorted : return Util.getReverseSortedArray
        case .weakSorted : return Util.getWeakSortedArray
        case .unsorted : return Util.getUnsortedArray
        }
    }
}
