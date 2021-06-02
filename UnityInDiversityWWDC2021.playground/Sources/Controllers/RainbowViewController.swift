import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class RainbowViewController: UIViewController {
    // MARK: - Attribute
    private var creator = UICreator()
    private var selectedColor = 0
    private var countComplete = 0
    private var speech = Speech()
    
    // MARK: - Outlets
    private var guideView: UIView!
    private var guideLabel: UILabel!
    
    private var firstColorRainbow:UIView!
    private var secondColorRainbow:UIView!
    private var thirdColorRainbow:UIView!
    private var fourthColorRainbow:UIView!
    private var fifthColorRainbow:UIView!
    private var sixthColorRainbow:UIView!
    
    private var defaultBottomView: UIView!
    
    private var firstDragableColor:UIView!
    private var secondDragableColor:UIView!
    private var thirdDragableColor:UIView!
    private var fourthDragableColor:UIView!
    private var fifthDragableColor:UIView!
    private var sixthDragableColor:UIView!
    
    private var draggedView: UIView!
    
    private var frederick: UILabel!
    private var frederickView: UIView!
    private var frederickNameLabel: UILabel!
    private var frederickMessage: UILabel!
    
    private var linda: UILabel!
    private var lindaView: UIView!
    private var lindaName: UILabel!
    private var lindaMessage: UILabel!
    
    private var nextButton: UIButton!
    
    // MARK: - Life Cycles
    public override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.frame.size = CGSize(width: 600, height: 700)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        initElements()
        setViewInteraction()
        setDragInteraction()
        setDragDelay()
        setDropInteraction()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Init Elements Methods
    private func initElements() {
        guideView = creator.createView(width: 490, height: 45)
        view.addSubview(guideView)
        
        guideLabel = creator.createLabel(text: Text.Informations.Rainbow.dragDropRectangle, size: 15)
        guideView.addSubview(guideLabel)
        
        activateGuideConstraint()
        initRainbowDropView()
        initColorDragView()
    }
    
    private func activateGuideConstraint() {
        NSLayoutConstraint.activate([
            guideView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            guideView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guideLabel.topAnchor.constraint(equalTo: guideView.topAnchor, constant: 10),
            guideLabel.centerXAnchor.constraint(equalTo: guideView.centerXAnchor),
            guideLabel.centerYAnchor.constraint(equalTo: guideView.centerYAnchor)
        ])
    }
    
    private func initRainbowDropView() {
        firstColorRainbow = creator.createView(width: 450, height: 35, backgroundColor: UIColor.darkGray , cornerRadius: 0)
        view.addSubview(firstColorRainbow)
        
        secondColorRainbow = creator.createView(width: 450, height: 35, backgroundColor: UIColor.gray , cornerRadius: 0)
        view.addSubview(secondColorRainbow)
        
        thirdColorRainbow = creator.createView(width: 450, height: 35, backgroundColor: UIColor.darkGray , cornerRadius: 0)
        view.addSubview(thirdColorRainbow)
        
        fourthColorRainbow = creator.createView(width: 450, height: 35, backgroundColor: UIColor.gray , cornerRadius: 0)
        view.addSubview(fourthColorRainbow)
        
        fifthColorRainbow = creator.createView(width: 450, height: 35, backgroundColor: UIColor.darkGray , cornerRadius: 0)
        view.addSubview(fifthColorRainbow)
        
        sixthColorRainbow = creator.createView(width: 450, height: 35, backgroundColor: UIColor.gray , cornerRadius: 0)
        view.addSubview(sixthColorRainbow)
        
        defaultBottomView = creator.createView(width: 450, height: 35, backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), cornerRadius: 0)
        view.addSubview(defaultBottomView)
        defaultBottomView.isHidden = true
        
        activateRainbowDropConstraint()
    }
    
    private func activateRainbowDropConstraint() {
        NSLayoutConstraint.activate([
            firstColorRainbow.topAnchor.constraint(equalTo: guideView.bottomAnchor, constant: 30),
            firstColorRainbow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondColorRainbow.topAnchor.constraint(equalTo: firstColorRainbow.bottomAnchor, constant: 5),
            secondColorRainbow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdColorRainbow.topAnchor.constraint(equalTo: secondColorRainbow.bottomAnchor, constant: 5),
            thirdColorRainbow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthColorRainbow.topAnchor.constraint(equalTo: thirdColorRainbow.bottomAnchor, constant: 5),
            fourthColorRainbow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fifthColorRainbow.topAnchor.constraint(equalTo: fourthColorRainbow.bottomAnchor, constant: 5),
            fifthColorRainbow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sixthColorRainbow.topAnchor.constraint(equalTo: fifthColorRainbow.bottomAnchor, constant: 5),
            sixthColorRainbow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            defaultBottomView.topAnchor.constraint(equalTo: sixthColorRainbow.bottomAnchor, constant: -15),
            defaultBottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func initColorDragView() {
        firstDragableColor = creator.createView(width: 100, height: 100, backgroundColor: UIColor.red, cornerRadius: 0)
        view.addSubview(firstDragableColor)
        
        secondDragableColor = creator.createView(width: 100, height: 100, backgroundColor: UIColor.green, cornerRadius: 0)
        view.addSubview(secondDragableColor)
        
        thirdDragableColor = creator.createView(width: 100, height: 100, backgroundColor: UIColor.yellow, cornerRadius: 0)
        view.addSubview(thirdDragableColor)
        
        fourthDragableColor = creator.createView(width: 100, height: 100, backgroundColor: UIColor.purple, cornerRadius: 0)
        view.addSubview(fourthDragableColor)
        
        fifthDragableColor = creator.createView(width: 100, height: 100, backgroundColor: UIColor.orange, cornerRadius: 0)
        view.addSubview(fifthDragableColor)
        
        sixthDragableColor = creator.createView(width: 100, height: 100, backgroundColor: UIColor.blue, cornerRadius: 0)
        view.addSubview(sixthDragableColor)
        
        activateColorDragConstraint()
    }
    
    private func activateColorDragConstraint() {
        NSLayoutConstraint.activate([
            firstDragableColor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            firstDragableColor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            secondDragableColor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            secondDragableColor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            thirdDragableColor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            thirdDragableColor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthDragableColor.bottomAnchor.constraint(equalTo: thirdDragableColor.topAnchor, constant: -40),
            fourthDragableColor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fifthDragableColor.bottomAnchor.constraint(equalTo: firstDragableColor.topAnchor, constant: -40),
            fifthDragableColor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            sixthDragableColor.bottomAnchor.constraint(equalTo: secondDragableColor.topAnchor, constant: -40),
            sixthDragableColor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
    }
    
}

// MARK: - Init Drag and Drop Elements Methods
extension RainbowViewController {
    private func setViewInteraction() {
        firstDragableColor.isUserInteractionEnabled = true
        secondDragableColor.isUserInteractionEnabled = true
        thirdDragableColor.isUserInteractionEnabled = true
        fourthDragableColor.isUserInteractionEnabled = true
        fifthDragableColor.isUserInteractionEnabled = true
        sixthDragableColor.isUserInteractionEnabled = true
    }
    
    private func setDragInteraction() {
        let dragInteraction1 = UIDragInteraction(delegate: self)
        let dragInteraction2 = UIDragInteraction(delegate: self)
        let dragInteraction3 = UIDragInteraction(delegate: self)
        let dragInteraction4 = UIDragInteraction(delegate: self)
        let dragInteraction5 = UIDragInteraction(delegate: self)
        let dragInteraction6 = UIDragInteraction(delegate: self)
        
        firstDragableColor.addInteraction(dragInteraction1)
        dragInteraction1.isEnabled = true
        
        secondDragableColor.addInteraction(dragInteraction2)
        dragInteraction2.isEnabled = true

        thirdDragableColor.addInteraction(dragInteraction3)
        dragInteraction3.isEnabled = true

        fourthDragableColor.addInteraction(dragInteraction4)
        dragInteraction4.isEnabled = true

        fifthDragableColor.addInteraction(dragInteraction5)
        dragInteraction5.isEnabled = true

        sixthDragableColor.addInteraction(dragInteraction6)
        dragInteraction6.isEnabled = true
    }
    
    private func setDragDelay() {
        firstDragableColor.gestureRecognizers?.forEach { (recognizer) in
            if let longPressRecognizer = recognizer as? UILongPressGestureRecognizer {
                longPressRecognizer.minimumPressDuration = 0.01
            }
        }
        
        secondDragableColor.gestureRecognizers?.forEach { (recognizer) in
            if let longPressRecognizer = recognizer as? UILongPressGestureRecognizer {
                longPressRecognizer.minimumPressDuration = 0.01
            }
        }
        
        thirdDragableColor.gestureRecognizers?.forEach { (recognizer) in
            if let longPressRecognizer = recognizer as? UILongPressGestureRecognizer {
                longPressRecognizer.minimumPressDuration = 0.01
            }
        }
        
        fourthDragableColor.gestureRecognizers?.forEach { (recognizer) in
            if let longPressRecognizer = recognizer as? UILongPressGestureRecognizer {
                longPressRecognizer.minimumPressDuration = 0.01
            }
        }
        
        fifthDragableColor.gestureRecognizers?.forEach { (recognizer) in
            if let longPressRecognizer = recognizer as? UILongPressGestureRecognizer {
                longPressRecognizer.minimumPressDuration = 0.01
            }
        }
        
        sixthDragableColor.gestureRecognizers?.forEach { (recognizer) in
            if let longPressRecognizer = recognizer as? UILongPressGestureRecognizer {
                longPressRecognizer.minimumPressDuration = 0.01
            }
        }
    }
    
    private func setDropInteraction() {
        firstColorRainbow.addInteraction(UIDropInteraction(delegate: self))
        secondColorRainbow.addInteraction(UIDropInteraction(delegate: self))
        thirdColorRainbow.addInteraction(UIDropInteraction(delegate: self))
        fourthColorRainbow.addInteraction(UIDropInteraction(delegate: self))
        fifthColorRainbow.addInteraction(UIDropInteraction(delegate: self))
        sixthColorRainbow.addInteraction(UIDropInteraction(delegate: self))
    }
}

// MARK: - Element Drag Delegate
extension RainbowViewController: UIDragInteractionDelegate {
    
    public func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        if let uiView = interaction.view {
            self.draggedView = uiView
            let provider = NSItemProvider(object: uiView.backgroundColor.self!)
            let item = UIDragItem.init(itemProvider: provider)
            item.localObject = uiView
            return [item]
        }
        return []
    }
}

// MARK: - Element Drop Delegate
extension RainbowViewController: UIDropInteractionDelegate {
    
    public func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        
        let location = session.location(in: self.view)
        var dropOperation: UIDropOperation?
        self.selectedColor = 0
        
        if session.canLoadObjects(ofClass: UIColor.self) {
            if firstColorRainbow.frame.contains(location) {
                dropOperation = self.checkDropLocation(uiView: firstColorRainbow, selectedColor: 1)
            }
            else if secondColorRainbow.frame.contains(location) {
                dropOperation = self.checkDropLocation(uiView: secondColorRainbow, selectedColor: 2)
            }
            else if thirdColorRainbow.frame.contains(location) {
                dropOperation = self.checkDropLocation(uiView: thirdColorRainbow, selectedColor: 3)
            }
            else if fourthColorRainbow.frame.contains(location) {
                dropOperation = self.checkDropLocation(uiView: fourthColorRainbow, selectedColor: 4)
            }
            else if fifthColorRainbow.frame.contains(location) {
                dropOperation = self.checkDropLocation(uiView: fifthColorRainbow, selectedColor: 5)
            }
            else if sixthColorRainbow.frame.contains(location) {
                dropOperation = self.checkDropLocation(uiView: sixthColorRainbow, selectedColor: 6)
            }
            else {
                dropOperation = .cancel
                selectedColor = 0
            }
        }
        else {
            dropOperation = .cancel
            selectedColor = 0
        }
        
        return UIDropProposal(operation: dropOperation!)
    }
    
    private func checkDropLocation(uiView: UIView, selectedColor: Int) -> UIDropOperation? {
        if uiView.backgroundColor == UIColor.gray || uiView.backgroundColor == UIColor.darkGray {
            self.selectedColor = selectedColor
            return .copy
        }
        else {
            return .forbidden
        }
    }
    
    public func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        if session.canLoadObjects(ofClass: UIColor.self) {
            session.loadObjects(ofClass: UIColor.self) { (items) in
                if let colors = items as? [UIColor] {
                    switch self.selectedColor {
                    case 1:
                        self.performDisplayAfterDrop(rainbowView: self.firstColorRainbow, draggedColor: colors.last)
                        break
                    case 2:
                        self.performDisplayAfterDrop(rainbowView: self.secondColorRainbow, draggedColor: colors.last)
                        break
                    case 3:
                        self.performDisplayAfterDrop(rainbowView: self.thirdColorRainbow, draggedColor: colors.last)
                        break
                    case 4:
                        self.performDisplayAfterDrop(rainbowView: self.fourthColorRainbow, draggedColor: colors.last)
                        break
                    case 5:
                        self.performDisplayAfterDrop(rainbowView: self.fifthColorRainbow, draggedColor: colors.last)
                        break
                    case 6:
                        self.performDisplayAfterDrop(rainbowView: self.sixthColorRainbow, draggedColor: colors.last)
                        break
                    default:
                        print("EXIT")
                    }
                }
            }
        }
    }
    
    private func performDisplayAfterDrop(rainbowView: UIView, draggedColor: UIColor?) {
        UIView.animate(withDuration: 1) {
            rainbowView.backgroundColor = draggedColor!
        }
        draggedView.isHidden = true
        self.countComplete += 1
        
        if self.countComplete == 6 {
            makeRainbow()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.moralMessage()
            }
            
        }
    }

}

// MARK: - Make Rainbow Methods
extension RainbowViewController {
    private func makeRainbow() {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseOut,animations: {
            self.guideLabel.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                self.guideLabel.alpha = 1
                self.guideLabel.text = Text.Informations.Rainbow.congrats
            }, completion: { (_) in
                sleep(1)
            })
        }
        
        updateRainbowDropConstraint()
        defaultBottomView.isHidden = false
        
        UIView.animate(withDuration: 1){ self.view.layoutIfNeeded() }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.60) {
            self.setRainbowDropRoundTop()
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
        
        removeDragColorFromSuperview()
    }
    
    private func updateRainbowDropConstraint() {
        NSLayoutConstraint.activate([
            self.secondColorRainbow.topAnchor.constraint(equalTo: self.firstColorRainbow.bottomAnchor, constant: -15),
            self.thirdColorRainbow.topAnchor.constraint(equalTo: self.secondColorRainbow.bottomAnchor, constant: -15),
            self.fourthColorRainbow.topAnchor.constraint(equalTo: self.thirdColorRainbow.bottomAnchor, constant: -15),
            self.fifthColorRainbow.topAnchor.constraint(equalTo: self.fourthColorRainbow.bottomAnchor, constant: -15),
            self.sixthColorRainbow.topAnchor.constraint(equalTo: self.fifthColorRainbow.bottomAnchor, constant: -15)
        ])
    }
    
    private func setRainbowDropRoundTop() {
        self.roundedTop(targetView: self.firstColorRainbow, desiredCurve: 50)
        self.roundedTop(targetView: self.secondColorRainbow, desiredCurve: 50)
        self.roundedTop(targetView: self.thirdColorRainbow, desiredCurve: 50)
        self.roundedTop(targetView: self.fourthColorRainbow, desiredCurve: 50)
        self.roundedTop(targetView: self.fifthColorRainbow, desiredCurve: 50)
        self.roundedTop(targetView: self.sixthColorRainbow, desiredCurve: 50)
        self.roundedTop(targetView: self.defaultBottomView, desiredCurve: 50)
    }
    
    private func roundedTop(targetView:UIView?, desiredCurve:CGFloat?){

        let offset:CGFloat =  targetView!.frame.width/desiredCurve!
        let bounds: CGRect = targetView!.bounds
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x:bounds.origin.x - offset / 2,y: bounds.origin.y, width : bounds.size.width + offset, height :bounds.size.height)

        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        targetView!.layer.mask = maskLayer
    }
    
    private func removeDragColorFromSuperview() {
        firstDragableColor.removeFromSuperview()
        secondDragableColor.removeFromSuperview()
        thirdDragableColor.removeFromSuperview()
        fourthDragableColor.removeFromSuperview()
        fifthDragableColor.removeFromSuperview()
        sixthDragableColor.removeFromSuperview()
    }
    
}

// MARK: - Moral Message Methods
extension RainbowViewController {
    
    private func moralMessage() {
        initFrederick()
        initLinda()
        initNextButton()
        animateMoralMessage()
        
    }
    
    private func initFrederick() {
        frederickView = creator.createView(width: 450, height: 100, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(frederickView)
        
        frederick = creator.createLabel(text: Text.Characters.Emojis.frederick, size: 60, alpha: 0)
        view.addSubview(self.frederick)
        
        frederickNameLabel = creator.createLabel(text: Text.Characters.Names.frederick, size: 17, alpha: 0)
        view.addSubview(frederickNameLabel)
        
        frederickMessage = creator.createLabel(text: Text.Messages.Frederick.message, size: 19, weight: .semibold, alpha: 0)
        frederickView.addSubview(frederickMessage)
        
        activateFrederickConstraint()
    }
    
    private func activateFrederickConstraint() {
        NSLayoutConstraint.activate([
            self.frederickView.topAnchor.constraint(equalTo: self.defaultBottomView.bottomAnchor, constant: 40),
            self.frederickView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
            self.frederick.trailingAnchor.constraint(equalTo: self.frederickView.leadingAnchor, constant: 30),
            self.frederick.topAnchor.constraint(equalTo: self.defaultBottomView.bottomAnchor, constant: 20),
            self.frederickNameLabel.bottomAnchor.constraint(equalTo: self.frederickView.topAnchor, constant: 2),
            self.frederickNameLabel.leadingAnchor.constraint(equalTo: self.frederick.trailingAnchor, constant: 5),
            self.frederickMessage.centerYAnchor.constraint(equalTo: self.frederickView.centerYAnchor),
            self.frederickMessage.centerXAnchor.constraint(equalTo: self.frederickView.centerXAnchor),
            self.frederickMessage.leadingAnchor.constraint(equalTo: self.frederickView.leadingAnchor, constant: 30),
            self.frederickMessage.trailingAnchor.constraint(equalTo: self.frederickView.trailingAnchor, constant: -5),
        ])
    }
    
    private func initLinda() {
        lindaView = creator.createView(width: 450, height: 150, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(lindaView)

        linda = creator.createLabel(text: Text.Characters.Emojis.linda, size: 60, alpha: 0)
        view.addSubview(self.linda)

        lindaName = creator.createLabel(text: Text.Characters.Names.linda, size: 17, alpha: 0)
        view.addSubview(lindaName)

        lindaMessage = creator.createLabel(text: Text.Messages.Linda.rainbowMessage1, size: 19, weight: .semibold, alpha: 0)
        lindaView.addSubview(lindaMessage)

        activateLindaConstraint()
    }
    
    private func activateLindaConstraint() {
        NSLayoutConstraint.activate([
            self.lindaView.topAnchor.constraint(equalTo: self.frederickView.bottomAnchor, constant: 30),
            self.lindaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            self.linda.leadingAnchor.constraint(equalTo: self.lindaView.trailingAnchor, constant: -30),
            self.linda.topAnchor.constraint(equalTo: self.frederickView.bottomAnchor, constant: 10),
            self.lindaName.bottomAnchor.constraint(equalTo: self.lindaView.topAnchor, constant: 2),
            self.lindaName.trailingAnchor.constraint(equalTo: self.linda.leadingAnchor, constant: 5),
            self.lindaMessage.centerYAnchor.constraint(equalTo: self.lindaView.centerYAnchor),
            self.lindaMessage.centerXAnchor.constraint(equalTo: self.lindaView.centerXAnchor),
            self.lindaMessage.leadingAnchor.constraint(equalTo: self.lindaView.leadingAnchor, constant: 10),
            self.lindaMessage.trailingAnchor.constraint(equalTo: self.lindaView.trailingAnchor, constant: -30),
        ])
    }
    
    private func initNextButton() {
        nextButton = creator.createButton(title: Text.Buttons.letsGo, backgroundColor: UIColor.orange, width: 200, height: 50)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: lindaView.bottomAnchor, constant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func nextButtonAction(sender: UIButton!) {
        goToEggViewController()
    }
    
    private func animateMoralMessage() {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut,animations: {
            self.guideLabel.alpha = 0
            
        }) { (_) in
            UIView.animate(withDuration: 1, animations: {
                self.guideLabel.alpha = 1
                self.guideLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
                self.guideLabel.text = Text.Informations.Rainbow.whatCanWeLearn
                
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                    self.frederickView.alpha = 1
                    self.frederick.alpha = 1
                    self.frederickNameLabel.alpha = 1
                }, completion: { (_) in
                    UIView.animate(withDuration: 1, delay: 0.5, animations: {
                        self.speech.frederickSpeak(phrase: self.frederickMessage.text!)
                        self.frederickMessage.alpha = 1
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.5, delay: 3, animations: {
                                self.lindaView.alpha = 1
                                self.linda.alpha = 1
                                self.lindaName.alpha = 1
                            }, completion: { (_) in
                                UIView.animate(withDuration: 1, delay: 0.5, animations: {
                                    self.speech.speakFullWord(phrase :self.lindaMessage.text!)
                                    self.lindaMessage.alpha = 1
                                }, completion: { (_) in
                                    UIView.animate(withDuration: 0.5, delay: 3, animations: {
                                        self.lindaMessage.alpha = 0
                                    }, completion: { (_) in
                                        UIView.animate(withDuration: 1, delay: 0.5, animations: {
                                            self.lindaMessage.text = Text.Messages.Linda.rainbowMessage2
                                            self.speech.speakFullWord(phrase :self.lindaMessage.text!)
                                            self.lindaMessage.alpha = 1
                                        }, completion: { (_) in
                                            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                                                self.lindaMessage.alpha = 0
                                            }, completion: { (_) in
                                                UIView.animate(withDuration: 1, delay: 0.5, animations: {
                                                    self.lindaMessage.text = Text.Messages.Linda.rainbowShallMove
                                                    self.lindaMessage.alpha = 1
                                                    self.nextButton.alpha = 1
                                                    self.speech.speakFullWord(phrase :self.lindaMessage.text!)
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                    })
                })
            })
        }
    }

    private func goToEggViewController() {
        let eggVC = EggViewController()
        eggVC.modalPresentationStyle = .fullScreen
        self.present(eggVC, animated: true, completion: nil)
    }
    
}
