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
        
        //화면생성시 이미지피커 터치 이벤트 호출
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(imgTap)
        
        //화면 생성시 이미지선택 델리게이트 호출
        imagePicker.delegate = self
        self.nextButton.isEnabled = false
        
    }
    //MARK: - Action
 
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
        UserInformation.shared.id = nil
         UserInformation.shared.password = nil
    }
    //MARK: - Func
    //다음 버튼 활성화
   
    @IBAction func passwordCheck(_ sender: UITextField) {
        if self.password.text! == self.CheckPassword.text! {
            self.nextButton.isEnabled = true
        }else{
            self.nextButton.isEnabled = false
        }
    }
    
    
    //ActionButton
    @IBAction func signUpButton(_ sender: UIButton) {
        //textfield값 프로퍼티에 저장
        UserInformation.shared.id = self.id.text
        UserInformation.shared.password = self.password.text
        
    }
 
    @IBAction func cencelButton(){
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //imageview touch event 추가
    @objc func imageTapped(img: AnyObject){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    //앨범 불러오기
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
