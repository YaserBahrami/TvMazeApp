import UIKit

class ShowListTableViewCell: UITableViewCell {
    var showImage = UIImageView()
    var detailView = UIView()
    var nameLabel = UILabel()
    var genresLabel = UILabel()
    var showDurationLabel = UILabel()
    var sepratorView = UIView()
    var descriptionTextView = UITextView()
    var scoreLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.init(red: 240/255, green: 244/255, blue: 244/255, alpha: 1)
        
        contentView.addSubview(detailView)
        contentView.addSubview(showImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(genresLabel)
        contentView.addSubview(showDurationLabel)
        contentView.addSubview(sepratorView)
        contentView.addSubview(descriptionTextView)
        contentView.addSubview(scoreLabel)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        
        showImage.translatesAutoresizingMaskIntoConstraints = false
        detailView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        showDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        sepratorView.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        detailView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        detailView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        detailView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        detailView.backgroundColor = UIColor.white
        detailView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        detailView.layer.cornerRadius = 5
        
        showImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        showImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        showImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        showImage.widthAnchor.constraint(equalToConstant: contentView.layer.frame.size.width * 0.4).isActive = true
        showImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        
        showImage.contentMode = .scaleAspectFill
        showImage.clipsToBounds = true
        showImage.layer.cornerRadius = 5
        
        nameLabel.leftAnchor.constraint(equalTo: showImage.rightAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.init(name: "Helvetica", size: 14)
        
        
        genresLabel.leftAnchor.constraint(equalTo: showImage.rightAnchor, constant: 20).isActive = true
        genresLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 15).isActive = true
        genresLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        genresLabel.textAlignment = .left
        genresLabel.font = UIFont.init(name: "Helvetica", size: 10)
        genresLabel.textColor = UIColor.lightGray
        
        showDurationLabel.leftAnchor.constraint(equalTo: showImage.rightAnchor, constant: 20).isActive = true
        showDurationLabel.topAnchor.constraint(equalTo: genresLabel.topAnchor, constant: 15).isActive = true
        showDurationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        showDurationLabel.textAlignment = .left
        showDurationLabel.font = UIFont.init(name: "Helvetica", size: 10)
        
        
        sepratorView.backgroundColor = UIColor.lightGray
        sepratorView.leftAnchor.constraint(equalTo: showImage.rightAnchor, constant: 20).isActive = true
        sepratorView.topAnchor.constraint(equalTo: showDurationLabel.topAnchor, constant: 15).isActive = true
        sepratorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        sepratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        
        descriptionTextView.isEditable = false
        descriptionTextView.leftAnchor.constraint(equalTo: showImage.rightAnchor, constant: 20).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: sepratorView.topAnchor, constant: 2).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        descriptionTextView.textAlignment = .left
        descriptionTextView.font = UIFont.init(name: "Helvetica", size: 10)
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.textColor = UIColor.lightGray
        
        
        
        scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        scoreLabel.leftAnchor.constraint(equalTo: showImage.rightAnchor, constant: -20).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        scoreLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        scoreLabel.layer.cornerRadius = 20
        scoreLabel.clipsToBounds = true
        scoreLabel.textAlignment = .center
        scoreLabel.backgroundColor = UIColor.init(red: 255/255, green: 204/255, blue: 47/255, alpha: 1)
        scoreLabel.textColor = UIColor.white
        scoreLabel.font = UIFont(name: "Helvetica", size: 14)

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
