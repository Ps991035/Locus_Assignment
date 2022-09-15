//
//  CameraTableViewCell.swift
//  Locus_Assignment
//
//  Created by Pritesh Singh on 14/09/22.
//

import UIKit

protocol CameraTableViewCellDelegate: AnyObject{
    
    func imageClicked(_ image: UIImage?, _ indexPath: IndexPath?)
    func shouldEnlargeImageView(_ image: UIImage?)
    func imageDeleted(_ indexPath: IndexPath?)
}

class CameraTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblImageTitle: UILabel!
    
    
    weak var controller: UIViewController?
    weak var cameraDelegate: CameraTableViewCellDelegate?
    
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btnCancel.isHidden = true
        imgPic.layer.cornerRadius = 20
        setupGesture()
    }
    
    func setupData(_ image: UIImage?,_ title: String?){
        
        self.imgPic.image = image
        self.lblImageTitle.text = title
        
        if image == nil{
            btnCancel.isHidden = true
        }
        else{
            btnCancel.isHidden = false
        }
        
    }
    
    func setupGesture(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapOnCamera))
        imgPic.addGestureRecognizer(tapGestureRecognizer)
        imgPic.isUserInteractionEnabled = true
        imgPic.contentMode = .scaleAspectFill
        
    }
    
    @objc func didTapOnCamera(){
        
        if imgPic.image == nil{
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self.controller?.present(picker,animated: true)
        }
        else{
            cameraDelegate?.shouldEnlargeImageView(imgPic?.image)
        }
        
    }
    
    @IBAction func btnCancelImage(_ sender: Any) {
        
        imgPic.image = nil
        btnCancel.isHidden = true
        cameraDelegate?.imageDeleted(indexPath)
        
    }
}

extension CameraTableViewCell: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true,completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        cameraDelegate?.imageClicked(image,indexPath)
        
        imgPic.image = image
        btnCancel.isHidden = false
    }
    
    
}
