//
//  Measurer.swift
//  sorting-compare
//

import Foundation

class Measurer{ 
    
    static func getAverageResult(sortType : SortTypes, array : [Int], countOfMeasures : Int)->Double{
        var result = 0.0
        for _ in 0..<countOfMeasures{
            result += doMesure(metod : sortType.getMetod(), array: array)
        }
        return result/Double(countOfMeasures)
    }
    
    static private func doMesure(metod : (inout [Int])->Void , array : [Int]) -> Double{
        var tempArray = array
        let start = Date()
        metod(&tempArray)
        let end = Date()
        return end.timeIntervalSince(start)
    }


}
