//
//  Measurer.swift
//  sorting-compare
//

import Foundation

class Measurer{
    /*func run(size : Int, count) -> [SortTypes : Double]{
        var array  = Util.
        while i < count{
            var array = Util.getReverseSortedArray(size: <#T##Int#>)
            getMesure(metod: SortTypes.bubble, array: <#T##[Int]#>)
        }
    }*/
    
    private func getAverageResult(sortType : SortTypes, array : [Int], countOfMeasures : Int)->Double{
        var result = 0.0
        for _ in 0..<countOfMeasures{
            result += getMesure(metod : sortType.getMetod(), array: array)
        }
        return result/Double(countOfMeasures)
    }
    
    private func getMesure(metod : (inout [Int])->Void , array : [Int]) -> Double{
        var tempArray = array
        let start = Date()
        metod(&tempArray)
        let end = Date()
        return end.timeIntervalSince(start)
    }


}
