//
//  Like.swift
//  VKClient
//
//  Created by Dmitry Belov on 29.11.2021.
//

import UIKit

@IBDesignable class Like: UIControl {
    
    // инициализация при вызове из кода
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLikeControl()
    }
    
    // инициализация при использовании в storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLikeControl()
    }
    var countLikes = 0
    var userLiked = false
    
    @IBInspectable var colorNoLike: UIColor = UIColor.white {
        didSet {
            likeImgView.tintColor = colorNoLike
            labelLikes.textColor = colorNoLike
        }
    }
    
    @IBInspectable var colorYesLike: UIColor = UIColor.red
    
    // картинка сердечка
    let likeImgView = UIImageView(image: UIImage(systemName: "heart"))
    
    // количество лайков
    let labelLikes = UILabel(frame: CGRect(x: 23, y: -1, width: 40, height: 20))
    
    // настройка контрола
    func setupLikeControl() {
        likeImgView.tintColor = colorNoLike
        likeImgView.layer.shadowColor = UIColor.gray.cgColor
        likeImgView.layer.shadowOpacity = 0.9
        likeImgView.layer.shadowRadius = 10
        likeImgView.layer.shadowOffset = CGSize.zero
        
        // количество лайков
        labelLikes.text = String(countLikes)
        labelLikes.textColor = colorNoLike
        labelLikes.font = .systemFont(ofSize: 18)
        
        // добавляем иконку и текст на view
        self.addSubview(likeImgView)
        self.addSubview(labelLikes)
    }
    // момент первого нажатия (вернуть t​rue,​ если отслеживание прикосновения должно продолжиться, и f​alse​ в обратном случае)
override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    
    // статичные внешние параметры, можно добавить в анимацию
    if userLiked {
        userLiked = false
        countLikes -= 1
        labelLikes.text = String(countLikes)
        labelLikes.textColor = colorNoLike
        likeImgView.tintColor = colorNoLike
        likeImgView.image =  UIImage(systemName: "heart")
    } else {
        userLiked = true
        countLikes += 1
        labelLikes.text = String(countLikes)
        labelLikes.textColor = colorYesLike
        likeImgView.tintColor = colorYesLike
        likeImgView.image =  UIImage(systemName: "heart.fill")
    }
    return false
}
    
    
}
