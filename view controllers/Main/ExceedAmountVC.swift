//
//  ExceedAmountVC.swift
//  UFUF
//
//  Created by 박지수 on 12/10/2019.
//  Copyright © 2019 박지수. All rights reserved.
//

import UIKit

class ExceedAmountVC: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmBtnClick(_ sender: Any) {
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
