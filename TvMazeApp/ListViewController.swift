import UIKit
import Alamofire
import AlamofireImage

class ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var showListTableView = UITableView()
    var showListData = [ShowBriefModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Go Movies"
        
        showListTableView.register(ShowListTableViewCell.self, forCellReuseIdentifier: "ShowListCell")
        
        showListTableView.separatorStyle = .none
        showListTableView.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)
        showListTableView.delegate = self
        showListTableView.dataSource = self
        
        view.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)
        view.addSubview(showListTableView)
        
        getShowList(sucessHandler: { (models) in
            
            self.showListData = models
            self.showListTableView.reloadData()
            
            
        }) { (error) in
            print("salam")
            
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        showListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: showListTableView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: showListTableView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: view.frame.size.width - 20),
            NSLayoutConstraint(item: showListTableView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: showListTableView, attribute: .bottom, relatedBy: .equal, toItem: self.bottomLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
            ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return showListData.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height / 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowListCell", for: indexPath) as! ShowListTableViewCell
        //        cell.selectionStyle = .none
        
        let def = showListData[indexPath.section].summary
        do {
            let str = try NSAttributedString(data: (def?.data(using: String.Encoding.unicode, allowLossyConversion: true)!)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
            
            cell.descriptionTextView.text = str.string
        } catch {
            print(error)
            cell.descriptionTextView.text = def
        }
        
        cell.nameLabel.text = showListData[indexPath.section].name
        
        var genresString = ""
        if (showListData[indexPath.section].genres?.count)! > 0{
            for index in 0 ... ((showListData[indexPath.section].genres?.count)! - 1){
                genresString += (showListData[indexPath.section].genres?[index])!
                
                if index < ((showListData[indexPath.section].genres?.count)! - 1){
                    genresString += ", "
                }
            }
            
        }
        
        cell.genresLabel.text = genresString
        
        cell.scoreLabel.text = String(showListData[indexPath.section].rating!)
        cell.showDurationLabel.text = String(showListData[indexPath.section].runtime!)
        
        let imageurl = showListData[indexPath.section].image
        
        Alamofire.request(imageurl!).responseImage(completionHandler: { (response) in
            if response.error == nil{
                let img = UIImage(data: response.data!)
                cell.showImage.image = img
            }
        }).validate(contentType: ["image/*"])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)
        return v
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("1")
        let vc: detailViewController = detailViewController()
        vc.id = showListData[indexPath.section].id!
        vc.navBarName = showListData[indexPath.section].name!
        navigationController?.pushViewController(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

