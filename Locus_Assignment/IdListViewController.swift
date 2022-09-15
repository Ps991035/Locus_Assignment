//
//  IdListViewController.swift
//  Locus_Assignment
//
//  Created by Pritesh Singh on 15/09/22.
//

import UIKit

class IdListViewController: UIViewController {
    
    
    @IBOutlet weak var tvData: UITableView!
    var options = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvData.delegate = self
        tvData.dataSource = self
    }
    
    

}

extension IdListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row].id
        return cell
        
    }
    
    
    
    
    
}
