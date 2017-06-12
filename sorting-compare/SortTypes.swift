//
//  SortTypes.swift
//  sorting-compare
//

import Foundation

enum SortTypes : Int{
    case bubble = 0
    case insertion
    case merge
    case quick
    func getMetod() -> (inout [Int])->Void{
        switch self {
        case .bubble : return Sorter.bubbleSort
        case .insertion : return Sorter.insertionSort
        case .merge : return Sorter.mergeRecSort
        case .quick : return Sorter.quickSort
        }
    }
    
    func toString()->String{
        switch self {
        case .bubble : return "Bubble sort"
        case .insertion : return "Insertion sort"
        case .merge : return "Merge sort"
        case .quick : return "Quick sort"
        }
    }
    
    static var count : Int {return 4}
}
