//
//  ChatCellView.swift
//  GitHubUsers_Clean
//
//  Created by Darshan on 06/08/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import UIKit

class ChatCellView: UITableViewCell {

    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet var constraintBubbleImageView_T: NSLayoutConstraint!
    @IBOutlet var constraintBubbleImageView_L: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ message: ShowMessages.GetMessages.ViewModel.DisplayedMessage) {
        
        lblText.text = message.textMessage
        
        
        let bubbleImage = UIImage(named: message.isMe ? "chat_bubble_sent" : "chat_bubble_received")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
                            resizingMode: .stretch)
            .withRenderingMode(UIImage.RenderingMode.alwaysTemplate)

        self.bubbleImageView.image = bubbleImage
        self.bubbleImageView.tintColor = UIColor(named: message.isMe ? "chat_bubble_color_sent" : "chat_bubble_color_received")
        
        constraintBubbleImageView_T.isActive = message.isMe
        constraintBubbleImageView_L.isActive = !message.isMe
        
    }

}
