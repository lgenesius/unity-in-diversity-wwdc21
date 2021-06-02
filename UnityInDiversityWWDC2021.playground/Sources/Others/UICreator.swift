import Foundation
import UIKit


public class UICreator {
    
    // MARK: - Create View
    public func createView(width: CGFloat, height: CGFloat, backgroundColor: UIColor = .white, cornerRadius: CGFloat = 20, borderWidth: CGFloat = 0, borderColor: CGColor? = nil, alpha: CGFloat = 1) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.layer.borderWidth = borderWidth
        view.alpha = alpha
        view.layer.borderColor = (borderColor != nil) ? borderColor! : nil
        
        return view
    }
    
    // MARK: - Create Label
    public func createLabel(text: String, textColor: UIColor = .black, size: CGFloat, weight: UIFont.Weight = .regular, alpha: CGFloat = 1) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.alpha = alpha
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    // MARK: - Create Button
    public func createButton(title: String, backgroundColor: UIColor, width: CGFloat, height: CGFloat, alpha: CGFloat = 0) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.alpha = alpha
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return button
    }
    
    //MARK: - Create ImageView
    public func createImageView(name: String, width: CGFloat, height: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name) as UIImage?
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return imageView
    }
}
