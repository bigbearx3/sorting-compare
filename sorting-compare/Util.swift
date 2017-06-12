//
//  Util.swift
//  sorting-compare
//

import Foundation

class Util{
    static private func getRandomArray(size : Int) -> [Int]{
        var array = Array(repeating: 0, count: size)
        var i = 0
        while i < array.count{
            array[i] = Int(arc4random_uniform(100000))
                i += 1
        }
        return array
    }
    
    static func getSortetArray(size : Int) -> [Int]{
        return getRandomArray(size : size).sorted()
    }
    
    static func getReverseSortedArray(size : Int) -> [Int]{
        return getRandomArray(size : size).reversed()
    }
    
    static func getWeakSortedArray(size : Int) -> [Int]{
        var array = Array(repeating: 0, count: size)
        var i = 0
        while i < array.count{
            array[i] = i + Int(arc4random_uniform(1000))
                i += 1
        }
        return array
    }
    
    static func getUnSortedArray(size : Int) -> [Int]{
        return getRandomArray(size : size)
    }
    
}
