//
//  AvatarsView.swift
//  VKClient
//
//  Created by Dmitry Belov on 26.11.2021.
//

import UIKit

@IBDesignable class AvatarsView: UIView {

    // инициализация при вызове из кода для @IBDesignable ?
    override init(frame: CGRect) {
        super.init(frame: frame)
        tapOnView()
        setupAvatarView()
    }
    
    // инициализация при использовании в storyboard @IBDesignable ?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tapOnView()
        setupAvatarView()
    }
    
    // обработка тапа по аватару
    func tapOnView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1 // сколько нажатий нужно
        //recognizer.numberOfTouchesRequired = 1 // сколько пальцев надо прижать
        self.addGestureRecognizer(recognizer) //добавить наблюдение
    }
    
    // анимация при тапе на аватар
    @objc func onTap(gestureRecognizer: UITapGestureRecognizer) {
        let original = self.transform // начальное состояние вьюхи
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.1,
                       options: [ .autoreverse],
                       animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8) // меняем размер вью анимировано
        }, completion: { _ in
            self.transform = original // возврат состояния вью на сохраненное значение
            //self.transform = .identity // возврат состояния вьюхи
        })
    }
    
    let avatarImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    @IBInspectable var widthOfShadow: CGFloat = 5 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var colorOfShadow: UIColor = .clear {
        didSet {
            self.layer.shadowColor = colorOfShadow.cgColor
            setNeedsDisplay()
        }
    }
    @IBInspectable var opacityOfShadow: CGFloat = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func setupAvatarView(){
        // настройка основной вью, где тень
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        backgroundColor = UIColor.white
        layer.cornerRadius = CGFloat(self.frame.width / 2)
        layer.masksToBounds = false
        layer.shadowColor = colorOfShadow.cgColor
        layer.shadowOpacity = Float(opacityOfShadow)
        layer.shadowRadius = widthOfShadow
        layer.shadowOffset = CGSize.zero
        
        // настройка аватарки
        avatarImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.layer.cornerRadius = CGFloat(self.frame.width / 2)
        avatarImage.layer.masksToBounds = true
        
        self.addSubview(avatarImage)
    }
    

}
