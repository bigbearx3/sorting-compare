//
//  SortingCompareVC.swift
//  sorting-compare
//

import UIKit

class SortingCompareVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let countsForMesurens = [100, 1000, 10000]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runMesure(){
        //let measurer = Measurer()
        /*var resultOfMesureSmall = measurer.run(count : 100)
        var resultOfMesureMiddle = measurer.run(count : 1000)
        var resultOfMesureLadge = measurer.run(count : 10000)*/
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return SortTypes.count

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return countsForMesurens.count
    }
    
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String?
    {
        return SortTypes(rawValue: section)?.toString() ?? "Unknown"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTVC", for: indexPath)
        //if let myCell = cell as?  ResultsTVCell
        /*if let myCell = cell as?  ContactTVCellImpl {
         {   let curentContactCellPresenter = presenter.getContactCellPresenter(byIndex: indexPath.row, view: myCell)
            myCell.presenter = curentContactCellPresenter
            curentContactCellPresenter.initView()*/
        //    return myCell
        //}
        return cell
    }

    
  


}

