//
//  ViewController.swift
//  SlideshowApp
//
//  Created by book mac on 2021/10/13.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!  //UIImageViewをOutlet接続　名前をimageViewに。
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var gazouNo: UILabel!
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    var botanNo: Int = 0    //ボタンの再生と停止　０が再生　１が停止
    
    var gazo: Float = 0     //kakudaiViewControllerのgazouを入れる
    
  //  var gazou: Float = 0    //画像再生用の数字
    
 //   @IBAction func play(_ sender: UIButton) {
 //       play.setTitle("停止", forState: .Normal)
 //   }
    
    @IBOutlet weak var botan: UIButton!
    @IBOutlet weak var play: UIButton!      //再生ボタン
    
    @IBOutlet weak var susumu: UIButton!    //進むのボタン
    
    @IBOutlet weak var modoru: UIButton!  //戻るのボタン
    
    
    
    @IBAction func Tap(_ sender: Any) {
        performSegue(withIdentifier: "TapView", sender: nil)
    }
    
    
    
    @IBAction func back(_ segue: UIStoryboardSegue){
        
    }
  //  @IBAction func motonogamen(_ segue: UIStoryboardSegue){
        
  //  }
    
    @IBAction func play(_ sender: Any) {
        if botanNo == 0 {   //もし０ならボタンの表示は再生だから停止にする
            botanNo = 1        //停止にしたから１にする
            play.setTitle("停止", for: .normal)
            susumu.isEnabled = false
            modoru.isEnabled = false
            
            if self.timer == nil{
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo:  nil, repeats: true)
                
            }
        }else if botanNo == 1 { //もし１ならボタンの表示は停止だから再生にする
            botanNo = 0         //再生にしたから０にする
            play.setTitle("再生", for: .normal)
             susumu.isEnabled = true
            modoru.isEnabled = true
            
            self.timer_sec = 0
            
            
            //timer が　nil で無いなら、停止してnil にする
            if self.timer != nil{
                self.timer.invalidate()
                self.timer = nil
                
            }
            
        }
    }
 
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //    gazouNo.text = "\(gazou)"
    

        imageView.image = UIImage(named: "bus")
      //最初に出す写真はバス

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のkakudaiViewControllerを取得する
            let kakudaiViewController:kakudaiViewController = segue.destination as! kakudaiViewController
        
            // 遷移先のkakudaiViewControllerで宣言しているgazouにgazoの値を代入して渡す
         
        
        kakudaiViewController.gazou = gazo
        
        // hyouziViewController.name = textfield.text!
        }
    
    
        
    
    
    @IBAction func TapView(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 2         //２秒ずつ増やす
    
        
    
        self.gazo += 1             //timer_secが２増えるごとにgazouを１増やす
        
        switch self.gazo{
        case 1 :
            imageView.image = UIImage(named: "test")        //gazouが１の時はtest写真
     
            
        case 2 :
            imageView.image = UIImage(named: "room")       //gazouが２の時はroom写真
     
            
            
        default:
            imageView.image = UIImage(named: "bus")       //gazouがそれ以外の時はバス写真
     
            self.gazo = 0       //gazouを０にする
        }
        
    }
    

    
    @IBAction func susumu(_ sender: Any) {
        
        self.gazo += 1             //susumuボタンを押すごとにgazou を１増やす
       
        
        //gazou の変数の中にcase ごとに１や２などの時の処理とそれ以外の時の処理を書いている
        
        switch self.gazo{
        case 1 :
            imageView.image = UIImage(named: "test")
     
            
        case 2 :
            imageView.image = UIImage(named: "room")
     
            
            
        default:
            imageView.image = UIImage(named: "bus")
     
            self.gazo = 0
        }
        
        
    }
    
    @IBAction func modoru(_ sender: Any) {
        
        self.gazo -= 1             //modoruボタンを押すごとにgazouを１減らす
        
        
        //gazou の変数の中にcase ごとに１や２などの時の処理とそれ以外の時の処理を書いている
        
        switch self.gazo{
        case 1 :
           
            imageView.image = UIImage(named: "test")

        case 0 :
            imageView.image = UIImage(named: "bus")
         
            
        default:
            imageView.image = UIImage(named: "room")
            
            self.gazo = 2
        
    }
    }
    
    
    
    @IBAction func teishi(_ sender: Any) {
        if self.timer != nil{
        self.timer.invalidate()
            self.timer = nil
            
        }
    }

   

}

