//
//  ContentView.swift
//  ChessBoard
//
//  Created by 汤军 on 17/2/27.
//  Copyright © 2017年 TJarry. All rights reserved.
//

import UIKit



extension UIAlertController{
    
    class func alerWith(message: String) -> UIAlertController{
        
        let alert = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction.init(title: "OK", style: .cancel) { (action) in
            
        }
        alert.addAction(confirmAction)
        return alert
    }
}

class KeyboardAccessoryView: UIView{
    
    var doneClickBlock:(() -> ())?
    
    lazy var done: UIButton = {
        let done = UIButton()
        done.backgroundColor = .orange
        done.setTitle("done", for: .normal)
        done.addTarget(self, action: #selector(doneClicked), for: .touchUpInside)
        return done
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(done)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        done.frame = CGRect.init(x: self.frame.size.width - 100, y: 3, width: 100, height: (self.frame.size.height - 3*2))
    }
    
    func doneClicked(){
        if let block = doneClickBlock {
            block()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ContentView{
    func buttonItemFrame(columnIndex: Int,rankIndex: Int) -> CGRect{
        
        let W = self.frame.size.width / CGFloat(Locate.columns.count)
        let H = self.frame.size.height / CGFloat(Locate.ranks.count)
        let x = CGFloat(columnIndex) * W
        let y = self.frame.size.height - CGFloat(rankIndex + 1)*H
        return CGRect.init(x: x, y: y, width: W, height: H)
    }
    
    //the relative frame on controllers view
    func buttonItemFrame(locate: Locate) -> CGRect {
        
        if let columnIndex = Locate.columns.index(of: locate.column),let rankIndex = Locate.ranks.index(of: locate.rank){
            let W = self.frame.size.width / CGFloat(Locate.columns.count)
            let H = self.frame.size.height / CGFloat(Locate.ranks.count)
            let x = self.frame.origin.x + CGFloat(columnIndex) * W
            let y = self.frame.origin.y + self.frame.size.height - CGFloat(rankIndex + 1)*H
            return CGRect.init(x: x, y: y, width: W, height: H)
        }else{
            return CGRect.zero
        }
    }
}

class ContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let column = Locate.columns.count
        let rank = Locate.ranks.count
        var i = 0
        for r in 0..<rank {
            for c in 0..<column {
                i += 1
                let button = ContentViewButtonItem()
                button.tag = i
                let locate = Locate.locate(columnIndex: c, rankIndex: r)
                button.locate = locate
                button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
                button.setTitleColor(.orange, for: .normal)
                button.setTitle("\(locate.column)\(locate.rank)", for: .normal)
                self.addSubview(button)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for (index,button) in self.subviews.enumerated() {
            
            if index < Locate.ranks.count*Locate.columns.count{
                let rank = (index)/Locate.ranks.count
                let column = (index)%Locate.columns.count
                
                button.frame = buttonItemFrame(columnIndex: column, rankIndex: rank)
                if (rank + column) % 2 == 0{
                    button.backgroundColor = .white
                }else{
                    button.backgroundColor = .black
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonItem(with column: String,rank: Int) -> ContentViewButtonItem?{
        
        if let tag = self.buttonItemTag(withColumn: column, rank: rank){
            return self.viewWithTag(tag) as! ContentViewButtonItem?
        }else{
            return nil
        }
    }
    
    func buttonItemTag(withColumn column: String,rank: Int) -> Int?{
        if let columnIndex = Locate.columns.index(of: column),let rankIndex = Locate.ranks.index(of: rank){
            return rankIndex*Locate.columns.count + columnIndex
        }else{
            return nil
        }
    }
    
    
    func jumpToLocate(locate: Locate){
        
    }
}

class ContentViewButtonItem: UIButton{
    
    var locate: Locate?
}



