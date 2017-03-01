//
//  ViewController.swift
//  ChessBoard
//
//  Created by 汤军 on 17/2/27.
//  Copyright © 2017年 TJarry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var content: ContentView = {
        let content = ContentView()
        content.backgroundColor = .red
        let WH = self.view.frame.size.width
        let y: CGFloat = 100
        content.frame = CGRect.init(x: 0, y: y, width: WH, height: WH)
        return content
    }()
    lazy var textFiled: UITextField = {
        let textFiled = UITextField.init(frame: CGRect.init(x: 20, y: self.content.frame.maxY + 20, width: 200, height: 30))
        textFiled.placeholder = "please input..."
        textFiled.backgroundColor = .lightGray
        let accessoryView = KeyboardAccessoryView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        accessoryView.backgroundColor = .orange
        weak var ws = self
        accessoryView.doneClickBlock = {
            ws?.view.endEditing(true)
        }
        textFiled.inputAccessoryView = accessoryView
        return textFiled
    }()
    lazy var knight: Knight = {
        let knight = Knight()
        knight.backgroundColor = .orange
        knight.setImage(UIImage.init(named: "knight"), for: .normal)
        knight.setTitleColor(.white, for: .normal)
        return knight
    }()
    
    lazy var confirmButton: UIButton = {
        let confirmButton = UIButton.init(frame: CGRect.init(x: self.textFiled.frame.maxX + 10, y: self.textFiled.frame.minY, width: 60, height: 30))
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        confirmButton.adjustsImageWhenHighlighted = false
        confirmButton.setTitle("confirm", for: .normal)
        confirmButton.backgroundColor = .orange
        confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        return confirmButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(content)
        
        self.view.addSubview(textFiled)
        
        self.view.addSubview(confirmButton)
    }
}

extension ViewController{
    
    func confirm(){
        
        //1.check
        let step = textFiled.text ?? ""
        
        if step.characters.count > 2 || step.characters.count == 1{
            //wrong input
            self.present(UIAlertController.alerWith(message: "wrong input"), animated: true, completion: nil)
            return
        }else if step.characters.count == 0{
            //blank input
            self.present(UIAlertController.alerWith(message: "blank input"), animated: true, completion: nil)
            return
        }
        
        //2.search
        let c = step.substring(to: step.index(before: step.endIndex))
        let r = step.substring(from: step.index(after: step.startIndex))
        
        //is c and r on content View?
        if let rank = Int(r), let _ = Locate.columns.index(of: c), let _ = Locate.ranks.index(of: rank){
            
            // add
            if knight.superview  == nil{
                let locate = Locate.locate(column: c, rank: rank)!
                knight.locate = locate
                knight.frame = content.buttonItemFrame(locate: locate)
                self.view.addSubview(knight)
            }else{ //move
                //is c and rank on forwardsStep?
                if knight.isForwardStepsContainsStep(step: step) {
                    //3.move
                    let locate = Locate.locate(column: c, rank: rank)!
                    knight.locate = locate
                    weak var ws = self
                    UIView.animate(withDuration: 0.3, animations: { 
                        ws!.knight.frame = ws!.content.buttonItemFrame(locate: locate)
                    })
                }else{
                    self.present(UIAlertController.alerWith(message: "wrong input"), animated: true, completion: nil)
                }
            }
        }else{
            self.present(UIAlertController.alerWith(message: "wrong input"), animated: true, completion: nil)
        }
    }

}


