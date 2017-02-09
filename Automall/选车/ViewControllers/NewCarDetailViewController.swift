//
//  NewCarDetailViewController.swift
//  Automall
//
//  Created by 刘思麟 on 2017/2/4.
//  Copyright © 2017年 SCW. All rights reserved.
//

import UIKit

class NewCarDetailViewController: ParentsViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    public enum Mystye {
        case new
        case impor
    }
    
    private var thisModel:NewCarFilterModel?
    
    lazy var recommendDataArray:NSMutableArray = NSMutableArray()
    
    public lazy var thisstye:Mystye = .new
    
    func setStyle(stye:NSInteger){
        if stye == 0 {
            thisstye = .new
        }
        if stye == 1 {
            thisstye = .impor
        }
    }
    
    lazy var imgsArray:[String] = []
    
    private var thisImgHttpStr:String = String()
    
    public var imgHttpStr:String
        {
        get{
            return thisImgHttpStr;
        }
        set(newStr)
        {
            thisImgHttpStr = newStr;
        }
    }
    
    private let cell3:NewCarDetailTableViewCell3 = Bundle.main.loadNibNamed("NewCarDetailTableViewCell", owner: nil, options: nil)?[2] as! NewCarDetailTableViewCell3
    
    public var model:NewCarFilterModel?{
        get{
            return thisModel
        }
        set(newModel){
            thisModel = newModel
            if ((thisModel?.godcar022003) != nil){
                cycleScrollView.imageURLStringsGroup = [HTTPNewCarImageRoot.appending((thisModel?.godcar022003)!)]
            }
            cycleScrollView.autoScroll = false
//            tableView.reloadData();
        }
    }
    //MARK: Views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footertView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBAction func buyCar(_ sender: Any) {
        
        let VC:InstallmentVC = InstallmentVC()
        self.navigationController?.pushViewController(VC, animated: true);
    }
    
    var cycleScrollView:SDCycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 150), imageNamesGroup: ["guanjia_img_1@2x","guanjia_img_2@2x","guanjia_img_3@2x"])
        
    let topHeaderView:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 100))

    func requestImgs() {
        var str:String = String()
        switch thisstye {
        case Mystye.new:
            str = "new"
            break
        default:
            str = "imp"
        }
        SelectCarNetManager.getDetailImgsPre(str, withID: NSString.init(format: "%ld", (thisModel?.godcar001001)!) as String!) { (respons) in
            let arr : NSArray = respons as! NSArray
            
            for dic in arr{
                
                let di:NSDictionary = dic as! NSDictionary
                self.imgsArray.append(di.allValues.first as! String)
            }
            self.tableView.reloadSections(IndexSet.init(integer: 2), with: .none)
        }
    }
    
    
    //MARK:initialize
    func initializeFrame(){
        
        topHeaderView.setHeight(cycleScrollView.height())
        collectionView.showsHorizontalScrollIndicator = false
        tableView.tableHeaderView = topHeaderView
    }
    
    func initializeUI(){
//        self.view.addSubview(tableView)
        topHeaderView.addSubview(cycleScrollView)
        self.removeGestureForEndEditing()
        
        collectionView.register(UINib.init(nibName: "OrderDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrderDetailCollectionViewCell")
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 90, height: 116)
        layout.minimumLineSpacing = 13
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    //MARK:private-Method
    
    private func requestRecommendData()
    {
        SelectCarNetManager.getRequestForNewCarsRecommendseccess { (response) in
            self.recommendDataArray = NewCarRecommendModel.mj_objectArray(withKeyValuesArray: response)
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarH = self.tabBarController?.tabBar.bounds.size.height;
        self.bottom.constant = -tabBarH!;
        initializeUI()
        initializeFrame()
        self.requestRecommendData()
        self.requestImgs()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.bottom.constant = 0;
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        self.footertView.setY(self.view.height() - 64)
        tableView.tableFooterView = footertView;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 2:
            return 20
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 2:
            let model : NewCarDetailTableViewCell3ImgsModel = cell3.cellModel
//            model.imgs = [(thisModel?.godcar022003)!]
            return CGFloat(model.cellHeight)
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = Bundle.main.loadNibNamed("NewCarDetailTableViewCell", owner: nil, options: nil)?.first as! NewCarDetailTableViewCell1
            cell.titleLB.text = thisModel?.godcar001005
            cell.moneyLB.text = thisModel?.godcar020003.appending("万")
            return cell
        case 1:
            let cell = Bundle.main.loadNibNamed("NewCarDetailTableViewCell", owner: nil, options: nil)?[1] as! NewCarDetailTableViewCell2
            cell.showDetailBT.addTarget(self, action: #selector(showDetail), for: .touchUpInside)
            return cell
        case 2:
            let model : NewCarDetailTableViewCell3ImgsModel = NewCarDetailTableViewCell3ImgsModel()
            if ((thisModel?.godcar022003) != nil){
                model.imgs = self.imgsArray
            }
            cell3.cellModel = model
            
            
            return cell3
        default: break
            
        }
        return UITableViewCell()
    }
    
    @objc private func showDetail()
    {
        let parementsVC:ParameterOfCarViewController = UIStoryboard.init(name: "CarMall", bundle: nil).instantiateViewController(withIdentifier: "ParameterOfCarViewController") as! ParameterOfCarViewController
        parementsVC.model = self.thisModel
        self.navigationController?.pushViewController(parementsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recommendDataArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:OrderDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderDetailCollectionViewCell", for: indexPath) as! OrderDetailCollectionViewCell
        let model:NewCarRecommendModel = self.recommendDataArray[indexPath.row] as! NewCarRecommendModel
        let imgStr:String = HTTPNewCarImageRoot.appending(model.godcar047003)
        cell.imgV.sd_setImage(with: URL.init(string: imgStr), placeholderImage: nil)
        cell.titleLB.text = model.godcar001005
        cell.moneyLB.text = model.godcar001013.appending("万元")
        return cell
    }
}

