//
//  SigninVC.swift
//  nanujang
//
//  Created by 박지수 on 01/09/2019.
//  Copyright © 2019 nanujang. All rights reserved.
//

import UIKit

class SigninVC: UIViewController {

    @IBOutlet weak var signinBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signinBtnAction(_ sender: Any) {
        //화면 이동
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "MainNC")
//
//    self.navigationController?.show(viewController, sender: nil)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "MainNC")
        present(viewcontroller, animated: true)
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
