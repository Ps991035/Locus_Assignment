//
//  SingleChoiceTableViewCell.swift
//  Locus_Assignment
//
//  Created by Pritesh Singh on 14/09/22.
//

import UIKit

class SingleChoiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tvOptions: UITableView!
    
    var options = [Options]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tvOptions.delegate = self
        tvOptions.dataSource = self
        tvOptions.register(UINib(nibName: "LSOptionTableViewCell", bundle: nil), forCellReuseIdentifier: "LSOptionTableViewCell")
        
    }
    
    func setData(_ options: [Options]?){
        self.options = options ?? []
        self.reloadTableView()
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tvOptions.reloadData()
        }
    }
    
}


extension SingleChoiceTableViewCell: UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LSOptionTableViewCell", for: indexPath) as? LSOptionTableViewCell else { return UITableViewCell() }
        
        cell.setData(options[indexPath.row].title , options[indexPath.row].isSelected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        for (index,_) in options.enumerated(){
            options[index].isSelected = false
        }
        
        options[indexPath.row].isSelected = true
        self.reloadTableView()
        
    }
    
}
