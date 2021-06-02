import Foundation
import AVFoundation
import UIKit

public class EndingViewController: UIViewController {
    // MARK: - Attribute
    private var creator = UICreator()
    private let speech = Speech()
    
    // MARK: - Outlets
    private var chatView: UIView!
    private var linda: UILabel!
    private var nameLabel: UILabel!
    
    private var nextButton: UIButton!
    
    private var chatting: UILabel!
    private var chatting2: UILabel!
    private var chatting3: UILabel!
    
    private var thankYouLabel: UILabel!
    
    private var bgmLabel: UILabel!
    
    // MARK: - Life Cycles
    public override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 600, height: 700)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        initElements()
        animateElements()
    }
    
    // MARK: - Init Element Methods
    private func initElements() {
        chatView = creator.createView(width: 500, height: 450, backgroundColor: UIColor.white, borderWidth: 5, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(chatView)
        
        linda = creator.createLabel(text: Text.Characters.Emojis.linda, size: 150, alpha: 0)
        view.addSubview(linda)
        
        nameLabel = creator.createLabel(text: Text.Characters.Names.linda, size: 23, alpha: 0)
        view.addSubview(nameLabel)
        
        chatting = creator.createLabel(text: Text.Informations.Ending.whatCanWeConclude, size: 23, alpha: 0)
        chatView.addSubview(chatting)
        
        chatting2 = creator.createLabel(text: Text.Informations.Ending.unityInDiversity, size: 27, weight: .bold, alpha: 0)
        chatView.addSubview(chatting2)
        
        chatting3 = creator.createLabel(text: Text.Informations.Ending.support, size: 23, weight: .bold, alpha: 0)
        chatView.addSubview(chatting3)
        
        thankYouLabel = creator.createLabel(text: Text.Informations.Ending.thankYou, textColor: .orange, size: 23, weight: .bold, alpha: 0)
        view.addSubview(thankYouLabel)
        
        bgmLabel = creator.createLabel(text: Text.Credits.bgm, textColor: UIColor.orange, size: 17, weight: .semibold, alpha: 0)
        view.addSubview(bgmLabel)
        
        activateConstraint()
    }
    
    private func activateConstraint() {
        NSLayoutConstraint.activate([
            chatView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            linda.bottomAnchor.constraint(equalTo: chatView.bottomAnchor, constant: 80),
            linda.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: linda.bottomAnchor, constant: -10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatting.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            chatting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatting.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 20),
            chatting.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -20),
            chatting2.centerXAnchor.constraint(equalTo: chatView.centerXAnchor),
            chatting2.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 20),
            chatting2.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -20),
            chatting2.topAnchor.constraint(equalTo: chatting.bottomAnchor, constant: 40),
            chatting3.centerXAnchor.constraint(equalTo: chatView.centerXAnchor),
            chatting3.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 20),
            chatting3.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -20),
            chatting3.topAnchor.constraint(equalTo: chatting2.bottomAnchor, constant: 40),
            thankYouLabel.centerXAnchor.constraint(equalTo: chatView.centerXAnchor),
            thankYouLabel.topAnchor.constraint(equalTo: linda.bottomAnchor, constant: 30),
            bgmLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bgmLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Element Animation Methods
    private func animateElements() {
        UIView.animate(withDuration: 0.5, animations: {
            self.chatView.alpha = 1
            self.linda.alpha = 1
            self.nameLabel.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 0.5, animations: {
                self.chatting.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 1, delay: 2, animations: {
                    self.chatting2.alpha = 1
                    self.speech.speakFullWord(phrase: self.chatting2.text!)
                }, completion: { (_) in
                    UIView.animate(withDuration: 1, delay: 4, animations: {
                        self.chatting3.alpha = 1
                    }, completion: { (_) in
                        UIView.animate(withDuration: 1, delay: 2, animations: {
                            self.thankYouLabel.alpha = 1
                            self.bgmLabel.alpha = 1
                        })
                    })
                })
            })
        }
    }
}
