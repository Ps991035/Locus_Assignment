//
//  ViewController.swift
//  Locus_Assignment
//
//  Created by PRITESH SINGH on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = ViewModel()
    private var items = [Model]()
    
    @IBOutlet weak var tvItems: UITableView!
    @IBOutlet weak var imgFullSize: UIImageView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchItemData()
        items = viewModel.getItemData()
        
        tvItems.isHidden = false
        btnDone.isHidden = true
        
        setupTableView()
        
    }
    
    private func setupTableView(){
        
        tvItems.delegate = self
        tvItems.dataSource = self
        
        tvItems.register(UINib(nibName: "CameraTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraTableViewCell")
        
        tvItems.register(UINib(nibName: "SingleChoiceTableViewCell", bundle: nil), forCellReuseIdentifier: "SingleChoiceTableViewCell")
        
        tvItems.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
    }
    
    
    @IBAction func btnSubmit(_ sender: Any) {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IdListViewController") as? IdListViewController {
            vc.options = items
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func btnDone(_ sender: Any) {
        
        self.imgFullSize.isHidden = true
        self.tvItems.isHidden = false
        self.btnDone.isHidden = true
    }
    
}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type = items[indexPath.row].type
        
        if type == "PHOTO"{
            
            guard let cell = tvItems.dequeueReusableCell(withIdentifier: "CameraTableViewCell", for: indexPath) as? CameraTableViewCell else { return UITableViewCell() }
            
            cell.indexPath = indexPath
            cell.setupData(items[indexPath.row].image,items[indexPath.row].title)
            cell.cameraDelegate = self
            cell.controller = self
            
            return cell
        }
        
        else if type == "SINGLE_CHOICE"{
            
            var options = [Options]()
            
            for option in items[indexPath.row].options ?? [] {
                options.append(Options(title: option, isSelected: false))
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleChoiceTableViewCell", for: indexPath) as? SingleChoiceTableViewCell else { return UITableViewCell() }
            
            cell.setData(options)
            
            return cell
            
        }
        
        else if type == "COMMENT"{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let type = items[indexPath.row].type
        
        if type == "PHOTO"{
            return UIScreen.main.bounds.width
        }
        else if type == "SINGLE_CHOICE"{
            return CGFloat(40 + ((items[indexPath.row].options?.count ?? 0) * 50))
        }
        else if type == "COMMENT"{
            return 150
        }
        
        return 100
    }
    
    
}

extension ViewController: CameraTableViewCellDelegate{
   
    func imageDeleted(_ indexPath: IndexPath?) {
        items[indexPath?.row ?? 0].image = nil
    }
    
    
    func imageClicked(_ image: UIImage?, _ indexPath: IndexPath?) {
        items[indexPath?.row ?? 0].image = image
    }
    
    func shouldEnlargeImageView(_ image: UIImage?) {
        self.imgFullSize.isHidden = false
        self.btnDone.isHidden = false
        self.tvItems.isHidden = true
        self.imgFullSize.image = image
    }
    
}
