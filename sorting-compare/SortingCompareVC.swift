//
//  SortingCompareVC.swift
//  sorting-compare
//

import UIKit

class SortingCompareVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let countsForMesurens = [10, 20, 30]
    var results = [SortTypes:  [ArrayTypes : Double]]()
    let sortTypes = [SortTypes.bubble, SortTypes.merge, SortTypes.insertion, SortTypes.quick]
    let count = 50
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func runGCD(_ sender: Any) {
        let serialQueue = DispatchQueue(label:"serialQueue")
        
        for i in 0..<countsForMesurens.count {
            for j in 0..<sortTypes.count{
                let sortTypeIndexPath = IndexPath(row: i, section: sortTypes[j].rawValue)
                if  let sortTypeCell = self.tableView(self.myTableView, cellForRowAt: sortTypeIndexPath) as? ResultsTVCell{
                    
                    let sortedArray = Util.getSortetArray(size: countsForMesurens[i])
                    let reverseSortedArray = Util.getReverseSortedArray(size: countsForMesurens[i])
                    let weakSortedArray = Util.getWeakSortedArray(size: countsForMesurens[i])
                    let unsortedArray = Util.getUnsortedArray(size: countsForMesurens[i])
                    var resultForRow = [ArrayTypes : Double]()
                    
                    serialQueue.async{
                        resultForRow[ArrayTypes.sorted]  = Measurer.getAverageResult(sortType: self.sortTypes[j], array: sortedArray, countOfMeasures: self.count)
                        resultForRow[ArrayTypes.reverseSorted] = Measurer.getAverageResult(sortType: self.sortTypes[j], array: reverseSortedArray, countOfMeasures: self.count)
                        resultForRow[ArrayTypes.weakSorted] = Measurer.getAverageResult(sortType: self.sortTypes[j], array: weakSortedArray, countOfMeasures: self.count)
                        resultForRow[ArrayTypes.unsorted] = Measurer.getAverageResult(sortType: self.sortTypes[j], array: unsortedArray, countOfMeasures: self.count)
                        
                        DispatchQueue.main.async {
                            self.setResults(resultsCell : sortTypeCell,
                                            arraySize : self.countsForMesurens[i],
                                            resultForRow : resultForRow)
                            self.myTableView.reloadRows(at: [sortTypeIndexPath], with: UITableViewRowAnimation.automatic)
                            //myTableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableViewRowAnimation#>)
                            debugPrint(self.sortTypes[j].toString() + " arraySize \(self.countsForMesurens[i]) \(resultForRow) ")
                        }
                    }
                }
            }
        }
    }
    
    private func setResults(resultsCell : ResultsTVCell, arraySize : Int, resultForRow : [ArrayTypes : Double]){
        resultsCell.lblSorted.text = String(resultForRow[ArrayTypes.sorted] ?? 0)
        resultsCell.lblReverse.text = String(resultForRow[ArrayTypes.reverseSorted]  ?? 0)
        resultsCell.lblWeak.text = String(resultForRow[ArrayTypes.weakSorted]  ?? 0)
        resultsCell.lblUnsorted.text = String(resultForRow[ArrayTypes.unsorted]  ?? 0)
        resultsCell.lblSize.text = String(arraySize)
        //resultsCell.setNeedsLayout()
    }
    
    
    @IBAction func runOperation(_ sender: Any) {
        
    }
    
    @IBAction func cancelOparation(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return countsForMesurens.count
    }
    
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String?{
        return sortTypes[section].toString()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTVC", for: indexPath)
        if let myCell = cell as?  ResultsTVCell,
            let currentResult = results[sortTypes[indexPath.row]] {
            //myCell.lblSize.text = currentResult
            myCell.lblSorted.text = String(describing: currentResult[ArrayTypes.sorted])
            myCell.lblReverse.text = String(describing: currentResult[ArrayTypes.reverseSorted])
            myCell.lblWeak.text = String(describing: currentResult[ArrayTypes.weakSorted])
            myCell.lblUnsorted.text = String(describing: currentResult[ArrayTypes.unsorted])
        }
        return cell
    }

    
  


}

