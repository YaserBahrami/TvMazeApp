import UIKit
import Alamofire

class detailViewController: UIViewController {

    
    var id:Int = 1
    var coverImage = UIImageView()
    var detailView = UIView()
    var showImage = UIImageView()
    var nameLabel = UILabel()
    var genresLabel = UILabel()
    var statusLabel = UILabel()
    var premieredLabel = UILabel()
    var ratingLabel = UILabel()
    var summaryTextView = UITextView()
    var timeLabel = UILabel()
    var daysLabel = UILabel()
    var runtimeLabel = UILabel()
    
    var directorLabel = UILabel()
    var writerLabel = UILabel()
    
    var castListTextView = UITextView()
    
    
    var navBarName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navBarName

        view.backgroundColor = UIColor.white
        
        fetchData()
        
        view.addSubview(coverImage)
        view.addSubview(detailView)
        view.addSubview(showImage)
        
        detailView.addSubview(nameLabel)
        detailView.addSubview(genresLabel)
        detailView.addSubview(statusLabel)
        detailView.addSubview(premieredLabel)
        detailView.addSubview(ratingLabel)
        detailView.addSubview(summaryTextView)
        detailView.addSubview(timeLabel)
        detailView.addSubview(daysLabel)
        detailView.addSubview(runtimeLabel)
        detailView.addSubview(directorLabel)
        detailView.addSubview(writerLabel)
        detailView.addSubview(castListTextView)
        
        summaryTextView.isEditable = false
        castListTextView.isEditable = false
        
        nameLabel.font = UIFont.init(name: "Helvetica", size: 16)
        genresLabel.font = UIFont.init(name: "Helvetica", size: 12)
        genresLabel.textColor = UIColor.lightGray

        premieredLabel.font = UIFont.init(name: "Helvetica", size: 14)
        premieredLabel.textColor = UIColor.gray
        
        summaryTextView.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)

        castListTextView.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)

        summaryTextView.font = UIFont.init(name: "Helvetica", size: 14)

        castListTextView.font = UIFont.init(name: "Helvetica", size: 14)

        runtimeLabel.font = UIFont.init(name: "Helvetica", size: 14)
        statusLabel.font = UIFont.init(name: "Helvetica", size: 14)
        directorLabel.font = UIFont.init(name: "Helvetica", size: 14)
        writerLabel.font = UIFont.init(name: "Helvetica", size: 14)
        
        
        timeLabel.font = UIFont.init(name: "Helvetica", size: 14)
        daysLabel.font = UIFont.init(name: "Helvetica", size: 14)
        
        
        detailView.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)
        
        showImage.contentMode = .scaleAspectFill
        showImage.clipsToBounds = true
        showImage.layer.cornerRadius = 5
        
    }
    
    func fetchData(){
        getShowDetail(id: id, sucessHandler: { (model) in
            self.directorLabel.text = "Director : Sheypoor"
            self.writerLabel.text = "Writer : Yaser"
            self.premieredLabel.text = model.premiered
            self.ratingLabel.text = "imdb: \(model.rating!) / 10"
            self.timeLabel.text = "On air time: " + model.time!
            self.nameLabel.text =  model.name
            self.runtimeLabel.text = "Duration: \(model.runtime!) min"
            self.statusLabel.text = "Status: " + model.status!
            var days = "On air days: "
            
            if (model.days?.count)! > 0{
                for index in 0 ... ((model.days?.count)! - 1){
                    days += (model.days?[index])!
                    
                    if index < ((model.days?.count)! - 1){
                        days += ", "
                    }
                }
            }
            self.daysLabel.text = days
            
            let def = model.summary! + "\n"
            do {
                let str = try NSAttributedString(data: (def.data(using: String.Encoding.unicode, allowLossyConversion: true)!), options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                
                self.summaryTextView.text = str.string
            } catch {
                print(error)
                self.summaryTextView.text = def
            }
            
            
            getCastNames(id: self.id, errorHander: { (str) in
                self.castListTextView.text = "Stars: " + str!
            })
            
            var genresString = ""
            if (model.genres?.count)! > 0{
                for index in 0 ... ((model.genres?.count)! - 1){
                    genresString += (model.genres?[index])!
                    
                    if index < ((model.genres?.count)! - 1){
                        genresString += ", "
                    }
                }
            }
            self.genresLabel.text = genresString
            
            Alamofire.request(model.image!).responseImage(completionHandler: { (response) in
                if response.error == nil{
                    let img = UIImage(data: response.data!)
                    self.showImage.image = img
                }
            }).validate(contentType: ["image/*"])
            
            Alamofire.request("https://s3-us-west-1.amazonaws.com/patreon-reward-images/625790.png").responseImage(completionHandler: { (response) in
                if response.error == nil{
                    let img = UIImage(data: response.data!)
                    self.coverImage.image = img
                }
            }).validate(contentType: ["image/*"])
            
            
            
            
        }) { (error) in
            print("\(error!)")
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        showImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        premieredLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryTextView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        runtimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        writerLabel.translatesAutoresizingMaskIntoConstraints = false
        castListTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: coverImage, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: coverImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: self.view.layer.frame.height / 3.5),
            NSLayoutConstraint(item: coverImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: self.view.layer.frame.width),
            NSLayoutConstraint(item: coverImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: detailView, attribute: .top, relatedBy: .equal, toItem: coverImage, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: detailView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: self.view.layer.frame.height - self.view.layer.frame.height / 3.5),
            NSLayoutConstraint(item: detailView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: self.view.layer.frame.width),
            NSLayoutConstraint(item: detailView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: showImage, attribute: .top, relatedBy: .equal, toItem: coverImage, attribute: .bottom, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: showImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: self.view.layer.frame.height / 3.2),
            NSLayoutConstraint(item: showImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: self.view.layer.frame.width / 2.7),
            NSLayoutConstraint(item: showImage, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 20)
            ])
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: detailView, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        nameLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: genresLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: genresLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        genresLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: premieredLabel, attribute: .top, relatedBy: .equal, toItem: genresLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: premieredLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        premieredLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: runtimeLabel, attribute: .top, relatedBy: .equal, toItem: premieredLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: runtimeLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        runtimeLabel.sizeToFit()
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: statusLabel, attribute: .top, relatedBy: .equal, toItem: runtimeLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: statusLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        statusLabel.sizeToFit()
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: statusLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: timeLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        timeLabel.sizeToFit()
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: daysLabel, attribute: .top, relatedBy: .equal, toItem: timeLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: daysLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        daysLabel.sizeToFit()
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: directorLabel, attribute: .top, relatedBy: .equal, toItem: daysLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: directorLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        directorLabel.sizeToFit()
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: writerLabel, attribute: .top, relatedBy: .equal, toItem: directorLabel, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: writerLabel, attribute: .left, relatedBy: .equal, toItem: showImage, attribute: .right, multiplier: 1, constant: 20)
            ])
        writerLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: summaryTextView, attribute: .top, relatedBy: .equal, toItem: showImage, attribute: .bottom, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: summaryTextView, attribute: .bottom, relatedBy: .equal, toItem: castListTextView, attribute: .top, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: summaryTextView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: view.layer.frame.size.width - 20),
            NSLayoutConstraint(item: summaryTextView, attribute: .centerX, relatedBy: .equal, toItem: detailView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: summaryTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150)
            ])
       
        summaryTextView.sizeToFit()
       
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: castListTextView, attribute: .top, relatedBy: .equal, toItem: summaryTextView, attribute: .bottom, multiplier: 1, constant: 5),
            NSLayoutConstraint(item: castListTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60),
            NSLayoutConstraint(item: castListTextView, attribute: .bottom, relatedBy: .equal, toItem: self.bottomLayoutGuide, attribute: .top, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: castListTextView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: view.layer.frame.size.width - 20),
            NSLayoutConstraint(item: castListTextView, attribute: .centerX, relatedBy: .equal, toItem: detailView, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        
        
        
        
    }


}
