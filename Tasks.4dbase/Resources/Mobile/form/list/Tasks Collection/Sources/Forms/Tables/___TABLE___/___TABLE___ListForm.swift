//
//  ___TABLE___ListForm.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___

import UIKit
import QMobileUI

/// Generated list form for ___TABLE___ table.
@IBDesignable
class ___TABLE___CustomProgressBarList: UIView {

    @IBInspectable var percent: CGFloat = 0.90
    @IBInspectable var barColor: UIColor = UIColor.blue
    @IBInspectable var bgColor: UIColor = UIColor.clear
    @IBInspectable var thickness: CGFloat = 20
    @IBInspectable var bgThickness: CGFloat = 20
    @IBInspectable var isHalfBar: Bool = false
    @IBInspectable var oldpercent: CGFloat = 0
    let nilPercent: CGFloat = -1

    var arc = CAShapeLayer()
    let arc2 = CAShapeLayer()

    @objc dynamic public var graphnumber: NSNumber? {
        get {
            return (percent / 100) as NSNumber
        }
        set {
            oldpercent = self.percent
            guard let number = newValue else {
                self.percent = nilPercent
                return
            }
            percent = (CGFloat(number.doubleValue)) / 100
            setNeedsDisplay()
            
        }
    }

    override func draw(_ rect: CGRect) {
        let X = self.bounds.midX
        let Y = self.bounds.midY
        var strokeStart: CGFloat = 0
        var strokeEnd: CGFloat = percent
        let degrees = 270.0
        let radians = CGFloat(degrees * Double.pi / 180)
        
        layer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
        var size = self.frame.size.width
        if self.frame.size.height < size {
            size = self.frame.size.height
        }
        size -= 0
        if self.isHalfBar {
            strokeStart = 0.2
            strokeEnd = (strokeEnd / 1.2) + 0.18
            let degrees = 55.0
            let radians = CGFloat(degrees * Double.pi / 180)
            layer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
        }
        let path = UIBezierPath(ovalIn: CGRect(x: (X - (68/2)), y: (Y - (68/2)), width: 120, height: 120)).cgPath
        self.addOval(self.bgThickness, path: path, strokeStart: strokeStart, strokeEnd: 1.0, strokeColor: self.bgColor, fillColor: UIColor.clear, shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSize.zero)
        self.addOval2(self.thickness, path: path, strokeStart: strokeStart, strokeEnd: strokeEnd, strokeColor: self.barColor, fillColor: UIColor.clear, shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSize.zero)
    }

    // swiftlint:disable:next function_parameter_count
    func addOval(_ lineWidth: CGFloat, path: CGPath, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize) {

        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.cgColor
        arc.fillColor = fillColor.cgColor
        arc.shadowColor = UIColor.black.cgColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffsset
        arc.opacity = 0.2
        arc.lineCap = .round
        layer.addSublayer(arc)
    }

    // swiftlint:disable:next function_parameter_count
    func addOval2(_ lineWidth: CGFloat, path: CGPath, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize) {
        arc2.lineWidth = lineWidth
        arc2.path = path
        arc2.strokeStart = strokeStart
        arc2.strokeEnd = strokeEnd
        arc2.strokeColor = strokeColor.cgColor
        arc2.fillColor = fillColor.cgColor
        arc2.shadowColor = UIColor.black.cgColor
        arc2.shadowRadius = shadowRadius
        arc2.shadowOpacity = shadowOpacity
        arc2.shadowOffset = shadowOffsset
        arc2.lineCap = .round
        layer.addSublayer(arc2)
    }
}

class ___TABLE___ListForm: ListFormCollection {

    // Do not edit name or override tableName
    public override var tableName: String {
        return "___TABLE___"
    }

    // MARK: Events
    override func onLoad() {
        // Do any additional setup after loading the view.
        
        // SearchBar text style
        let blueColor = UIColor(red: 89/255, green: 77/255, blue: 148/255, alpha: 1.0)
        let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = blueColor
        textFieldInsideUISearchBar?.font = UIFont(name: "HelveticaNeue-Thin", size: 15)
        
        // SearchBar placeholder style
        let textFieldInsideUISearchBarLabel = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideUISearchBarLabel?.textColor = blueColor
        textFieldInsideUISearchBarLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 15)
        self.refreshControl?.tintColor = blueColor
        searchBar.placeholder = "Search by task name"
    }

    override func onWillAppear(_ animated: Bool) {
        // Called when the view is about to made visible. Default does nothing
        configureLayout()
    }

    override func onDidAppear(_ animated: Bool) {
        // Called when the view has been fully transitioned onto the screen. Default does nothing
    }

    override func onWillDisappear(_ animated: Bool) {
        // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
    }

    override func onDidDisappear(_ animated: Bool) {
        // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
    }

}

// MARK: Layout
extension ___TABLE___ListForm: UICollectionViewDelegateFlowLayout {
    
    fileprivate func configureLayout() {
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
            layout.minimumInteritemSpacing = 4
            layout.minimumLineSpacing = 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize =  collectionView.frame.size
        return CGSize(width: collectionViewSize.width / 2 - 8, height: collectionViewSize.width / 2 + 20)
    }
    
}
