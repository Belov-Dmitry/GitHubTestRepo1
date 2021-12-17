//
//  AnimationView.swift
//  VKClient
//
//  Created by Dmitry Belov on 03.12.2021.
//

import UIKit

@IBDesignable class AnimationView: UIView {

    // инициализация при вызове из кода
    override init(frame: CGRect) {
        super.init(frame: frame)
        animationView()
    }
    
    // инициализация при использовании в storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        animationView()
    }

let circle1: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
let circle2: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 10, height: 10))
let circle3: UIView = UIView(frame: CGRect(x: 60, y: 0, width: 10, height: 10))
    
    func animationView(){
        // настройка основной вью
        //frame = CGRect(x: 0, y: 0, width: 80, height: 20)
        
        //точки
        circle1.backgroundColor = .white
        circle1.layer.cornerRadius = self.circle1.frame.width / 2
        
        circle2.backgroundColor = .white
        circle2.layer.cornerRadius = self.circle2.frame.width / 2
        
        circle3.backgroundColor = .white
        circle3.layer.cornerRadius = self.circle3.frame.width / 2
        
        //анимация точек
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       options: [.repeat, .autoreverse],
                       animations: {self.circle1.alpha = 0})
        
        UIView.animate(withDuration: 1,
                       delay: 0.3,
                       options: [.repeat, .autoreverse],
                       animations: {self.circle2.alpha = 0})
        
        UIView.animate(withDuration: 1,
                       delay: 0.6,
                       options: [.repeat, .autoreverse],
                       animations: {self.circle3.alpha = 0})

        self.addSubview(circle1)
        self.addSubview(circle2)
        self.addSubview(circle3)
    }
}



