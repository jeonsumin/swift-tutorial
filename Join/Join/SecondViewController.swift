//
//  SecondViewController.swift
//  Join
//
//  Created by Terry on 2020/02/10.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    //MARK: - storyboard IBOutet
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var CheckPassword: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    //MARK: - didLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
//        ckeckPassword()
        // Do any additional setup after loading the view.
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(imgTap)
        
        imagePicker.delegate = self 
        
    }
    //MARK: - Action
    //단순한 입력폼, 단순한 팝업
      @IBAction func didmissModal(){
          self.dismiss(animated: true, completion: nil)
      }
    //MARK: - Func
    func ckeckPassword(){
        if self.password.text == self.CheckPassword.text {
            print("같음")
        }else{
            print("다름")
        }
    }
    
    @objc func imageTapped(img: AnyObject){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
         if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
             self.img.image = originalImage
         }
         self.dismiss(animated: true, completion: nil)
         
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
