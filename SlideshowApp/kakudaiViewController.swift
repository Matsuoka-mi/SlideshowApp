//
//  kakudaiViewController.swift
//  SlideshowApp
//
//  Created by book mac on 2021/10/18.
//

import UIKit

class kakudaiViewController: UIViewController {

    @IBOutlet weak var bigView: UIImageView!    //UIImageViewをOutlet接続　名前をbigViewに。
    
  //  bigView.image = UIImage(named: "bus")
    
    var gazou: Float = 0    //画像再生用の数字
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        switch self.gazou{
        case 1 :
            bigView.image = UIImage(named: "test")
     
            
        case 2 :
            bigView.image = UIImage(named: "room")
     
            
            
        default:
            bigView.image = UIImage(named: "bus")
     
            self.gazou = 0
        }
        
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


