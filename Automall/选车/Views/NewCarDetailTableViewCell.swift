//
//  NewCarDetailTableViewCell.swift
//  Automall
//
//  Created by 刘思麟 on 2017/2/4.
//  Copyright © 2017年 SCW. All rights reserved.
//

import UIKit

class NewCarDetailTableViewCell1: UITableViewCell {

    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var moneyLB: UILabel!
    
    @IBOutlet weak var referenceMoneyLB: UILabel!
    
    @IBOutlet weak var tagLB: UILabel!
    //TODO:
    @IBAction func tell(_ sender: UIButton) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.referenceMoneyLB.attributedText = NSAttributedString.init(string: "66万", attributes: [NSStrikethroughStyleAttributeName:1,NSUnderlineColorAttributeName:UIColor.brown])
        // Initialization code
    }
}

class NewCarDetailTableViewCell2: UITableViewCell {
    
    @IBOutlet weak var showDetailBT: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

class NewCarDetailTableViewCell3ImgsModel: NSObject {
    private var thisImgs:[String] = []
    var cellHeight:Float = 0.0
    
    lazy private var thisIsShowAll:Bool = false
    var isShowAll:Bool
        {
        get{
            return thisIsShowAll
        }
        set(newValue){
            thisIsShowAll = newValue
            if thisIsShowAll {
                cellHeight = Float(thisImgs.count * 160 + 88)
            }else
            {
                if thisImgs.count > 0 {
                    cellHeight = Float(160 + 88)
                }else{
                    cellHeight = 88
                }
            }
        }
    }
    
    public var imgs:[String]{
        get{
            return thisImgs
        }
        set(newImgs)
        {
            thisImgs = newImgs
            if thisImgs.count > 0 {
                cellHeight = Float(160 + 88)
            }else{
                cellHeight = 88
            }
        }
    }
}


class NewCarDetailTableViewCell3: UITableViewCell {
    
    private let VSpare:CGFloat  = 5
    
    static let minHeight = 88
    
    public lazy var cellHeight : Float = Float(minHeight)
    
    let lineLayer = CAShapeLayer()
    
    lazy private var isShowAll = false
    
    lazy private var thisModel:NewCarDetailTableViewCell3ImgsModel = NewCarDetailTableViewCell3ImgsModel()
    public var cellModel:NewCarDetailTableViewCell3ImgsModel{
        get{
            return thisModel
        }
        set(newModel)
        {
            thisModel = newModel
            thisModel.isShowAll = isShowAll
            pastImgs()
        }
        
    }
    
    @IBOutlet weak var imgsView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lineLayer.path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 1)).cgPath
        lineLayer.borderWidth = 0.5
        lineLayer.fillColor = UIColor.red.cgColor
        bottomView.layer.addSublayer(lineLayer)
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.updateCarImgs(gesture:)))
        bottomView.addGestureRecognizer(gesture)
        imgsView.clipsToBounds = true
    }
    
    func updateCarImgs(gesture:UITapGestureRecognizer) {
        
        let tableV:UITableView = {
            
            var tableVV:UIResponder = self
            while true {
                if tableVV.isKind(of: UITableView.classForCoder())
                {
                    return tableVV as! UITableView
                }
                tableVV = tableVV.next!
            }
            return tableVV as! UITableView
        }()
        
//        cellModel.isShowAll = !(thisModel.isShowAll)
        isShowAll = !isShowAll
        
        let indexPath : IndexPath = tableV.indexPath(for: self)!
        
//        tableV.beginUpdates()
//        tableV.reloadRows(at: [indexPath], with: .none)
//        tableV.endUpdates()
        tableV.reloadData()
    }
    
    func pastImgs(){
        for (index,str) in (thisModel.imgs.enumerated()) {
            let imgV:UIImageView = UIImageView.init(frame: CGRect.init(x: CGFloat(12), y: (CGFloat(index) * 160 ) + VSpare, width:SCREEN_WIDTH - 24 , height: CGFloat(150)))
            imgV.sd_setImage(with: URL.init(string: HTTPNewCarImageRoot.appending(str)), placeholderImage: UIImage.init(named: "che_img_2.png"))
            self.imgsView.addSubview(imgV)
        }
//        imgsView.setHeight(CGFloat(thisModel.imgs.count * 160))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

class NewCarDetailTableViewCell4: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
