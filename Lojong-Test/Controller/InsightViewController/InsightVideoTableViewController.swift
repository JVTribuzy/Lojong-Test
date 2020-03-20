//
//  InsightVideoTableViewCOntroller.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 17/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class InsightVideoTableViewController: UITableViewController {
    
    var model: LojongVideoDataController = {
        return LojongVideoDataController.shared
    }()
    
    // MARK: - TableViewController Lifecycle
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        self.tableView = InsightVideoTableView(frame: .zero, style: style)
        
        self.setupNotification()
        
        self.setupTableView()
        
        self.model.downloadVideo()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - TableView Settings
extension InsightVideoTableViewController {
    func setupTableView(){
        tableView.register(InsightCustomVideoTableViewCell.self, forCellReuseIdentifier: "videoCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.insightVideos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! InsightCustomVideoTableViewCell
        
        let video = model.insightVideos[indexPath.row]
        
        cell.fill(video)
//        cell.titleLabel.text = "EP. \(String(describing: model.insightVideos[indexPath.row].content.order)): \(String(describing: model.insightVideos[indexPath.row].content.name.uppercased()))"
//
//        cell.videoPreviewImage.image = model.insightVideos[indexPath.row].imageView.image
//        self.tableView.reloadRows(at: [indexPath], with: .automatic)
////        let auxiliarImageView: UIImageView = UIImageView()
//
////        auxiliarImageView.downloadJSONImage(url: URL(string: self.model.insightVideos[indexPath.row].image_url)!)
////
////        if cell.videoPreviewImage.image == nil{
////            cell.videoPreviewImage.downloadJSONImage(url: URL(string: self.model.insightVideos[indexPath.row].image_url)!)
////        }else if auxiliarImageView.image != cell.videoPreviewImage.image{
////            cell.videoPreviewImage.downloadJSONImage(url: URL(string: self.model.insightVideos[indexPath.row].image_url)!)
////        }
//
//        print(cell.videoPreviewImage)
//        cell.descriptionLabel.text = "\(model.insightVideos[indexPath.row].content.description)"
        
        
        
        return cell
        
        
    }
}



// MARK: - Notifications
extension InsightVideoTableViewController{
    func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(videosChangedNotificationReceived(_:)), name: .LojongVideosChanged, object: nil)
    }
    
    @objc private func videosChangedNotificationReceived(_ notification: Notification){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}
