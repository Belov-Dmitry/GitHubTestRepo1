//
//  NewsFeed.swift
//  VKClient
//
//  Created by Dmitry Belov on 13.02.2022.

import Foundation
import UIKit

// MARK: - NewsContainer
class NewsContainer: Codable {
    let response: NewsResponse

    init(response: NewsResponse) {
        self.response = response
    }
}

// MARK: - Response
class NewsResponse: Codable {
    let items: [NewsFeed]
    let groups: [NewsGroup]
    let profiles: [Profile]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups, profiles
        case nextFrom = "next_from"
    }

    init(items: [NewsFeed], groups: [NewsGroup], profiles: [Profile]) {
        self.items = items
        self.groups = groups
        self.profiles = profiles
        self.nextFrom = ""
    }
}

// MARK: - Group
class NewsGroup: Codable {
    let isMember, id: Int
    let photo100: String
    let isAdvertiser, isAdmin: Int
    let photo50, photo200: String
    let type, screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }

    init(isMember: Int, id: Int, photo100: String, isAdvertiser: Int, isAdmin: Int, photo50: String, photo200: String, type: String, screenName: String, name: String, isClosed: Int) {
        self.isMember = isMember
        self.id = id
        self.photo100 = photo100
        self.isAdvertiser = isAdvertiser
        self.isAdmin = isAdmin
        self.photo50 = photo50
        self.photo200 = photo200
        self.type = type
        self.screenName = screenName
        self.name = name
        self.isClosed = isClosed
    }
}

// MARK: - NewsFeed
class NewsFeed: Codable {
    let comments: Comments
    let canSetCategory: Bool?
    let isFavorite: Bool
    let shortTextRate: Double
    let likes: Likes
    let reposts: Reposts
    let type, postType: PostTypeEnum
    let date, sourceID: Int
    let text: String
    let canDoubtCategory: Bool?
    let attachments: [Attachment]
    let markedAsAds, postID: Int
    let postSource: PostSource
    let views: Views
    let carouselOffset: Int?

    enum CodingKeys: String, CodingKey {
        case comments
        case canSetCategory = "can_set_category"
        case isFavorite = "is_favorite"
        case shortTextRate = "short_text_rate"
        case likes, reposts, type
        case postType = "post_type"
        case date
        case sourceID = "source_id"
        case text
        case canDoubtCategory = "can_doubt_category"
        case attachments
        case markedAsAds = "marked_as_ads"
        case postID = "post_id"
        case postSource = "post_source"
        case views
        case carouselOffset = "carousel_offset"
    }

    init(comments: Comments, canSetCategory: Bool?, isFavorite: Bool, shortTextRate: Double, likes: Likes, reposts: Reposts, type: PostTypeEnum, postType: PostTypeEnum, date: Int, sourceID: Int, text: String, canDoubtCategory: Bool?, attachments: [Attachment], markedAsAds: Int, postID: Int, postSource: PostSource, views: Views, carouselOffset: Int?) {
        self.comments = comments
        self.canSetCategory = canSetCategory
        self.isFavorite = isFavorite
        self.shortTextRate = shortTextRate
        self.likes = likes
        self.reposts = reposts
        self.type = type
        self.postType = postType
        self.date = date
        self.sourceID = sourceID
        self.text = text
        self.canDoubtCategory = canDoubtCategory
        self.attachments = attachments
        self.markedAsAds = markedAsAds
        self.postID = postID
        self.postSource = postSource
        self.views = views
        self.carouselOffset = carouselOffset
    }
}

// MARK: - Attachment
class Attachment: Codable {
    let type: AttachmentType
    let photo: Photo?
    let link: Link?
    let video: Video?

    init(type: AttachmentType, photo: Photo?, link: Link?, video: Video?) {
        self.type = type
        self.photo = photo
        self.link = link
        self.video = video
    }
}

// MARK: - Link
class Link: Codable {
    let photo: Photo
    let isFavorite: Bool
    let title: String
    let url: String
    let linkDescription, target: String

    enum CodingKeys: String, CodingKey {
        case photo
        case isFavorite = "is_favorite"
        case title, url
        case linkDescription = "description"
        case target
    }

    init(photo: Photo, isFavorite: Bool, title: String, url: String, linkDescription: String, target: String) {
        self.photo = photo
        self.isFavorite = isFavorite
        self.title = title
        self.url = url
        self.linkDescription = linkDescription
        self.target = target
    }
}

// MARK: - Photo
class Photo: Codable {
    let albumID, id, date: Int
    let text: String
    let userID: Int
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let postID: Int?
    let accessKey: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text
        case userID = "user_id"
        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case postID = "post_id"
        case accessKey = "access_key"
    }

    init(albumID: Int, id: Int, date: Int, text: String, userID: Int, sizes: [Size], hasTags: Bool, ownerID: Int, postID: Int?, accessKey: String?) {
        self.albumID = albumID
        self.id = id
        self.date = date
        self.text = text
        self.userID = userID
        self.sizes = sizes
        self.hasTags = hasTags
        self.ownerID = ownerID
        self.postID = postID
        self.accessKey = accessKey
    }
}

// MARK: - Size
class Size: Codable {
    let width, height: Int
    let url: String
    let type: SizeType?
    let withPadding: Int?

    enum CodingKeys: String, CodingKey {
        case width, height, url, type
        case withPadding = "with_padding"
    }

    init(width: Int, height: Int, url: String, type: SizeType?, withPadding: Int?) {
        self.width = width
        self.height = height
        self.url = url
        self.type = type
        self.withPadding = withPadding
    }
}

enum SizeType: String, Codable {
    case k = "k"
    case l = "l"
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}

enum AttachmentType: String, Codable {
    case link = "link"
    case photo = "photo"
    case video = "video"
}

// MARK: - Video
class Video: Codable {
    let ownerID: Int
    let title: String
    let canAdd, duration: Int
    let image: [Size]
    let isFavorite: Bool
    let views: Int
    let type: AttachmentType
    let canLike, canComment: Int
    let firstFrame: [Size]
    let date, id, height: Int
    let trackCode: String
    let width, canAddToFaves: Int
    let accessKey: String
    let comments, canSubscribe, canRepost: Int
    let videoDescription: String

    enum CodingKeys: String, CodingKey {
        case ownerID = "owner_id"
        case title
        case canAdd = "can_add"
        case duration, image
        case isFavorite = "is_favorite"
        case views, type
        case canLike = "can_like"
        case canComment = "can_comment"
        case firstFrame = "first_frame"
        case date, id, height
        case trackCode = "track_code"
        case width
        case canAddToFaves = "can_add_to_faves"
        case accessKey = "access_key"
        case comments
        case canSubscribe = "can_subscribe"
        case canRepost = "can_repost"
        case videoDescription = "description"
    }

    init(ownerID: Int, title: String, canAdd: Int, duration: Int, image: [Size], isFavorite: Bool, views: Int, type: AttachmentType, canLike: Int, canComment: Int, firstFrame: [Size], date: Int, id: Int, height: Int, trackCode: String, width: Int, canAddToFaves: Int, accessKey: String, comments: Int, canSubscribe: Int, canRepost: Int, videoDescription: String) {
        self.ownerID = ownerID
        self.title = title
        self.canAdd = canAdd
        self.duration = duration
        self.image = image
        self.isFavorite = isFavorite
        self.views = views
        self.type = type
        self.canLike = canLike
        self.canComment = canComment
        self.firstFrame = firstFrame
        self.date = date
        self.id = id
        self.height = height
        self.trackCode = trackCode
        self.width = width
        self.canAddToFaves = canAddToFaves
        self.accessKey = accessKey
        self.comments = comments
        self.canSubscribe = canSubscribe
        self.canRepost = canRepost
        self.videoDescription = videoDescription
    }
}

// MARK: - Comments
class Comments: Codable {
    let count, canPost: Int
    let groupsCanPost: Bool?

    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
        case groupsCanPost = "groups_can_post"
    }

    init(count: Int, canPost: Int, groupsCanPost: Bool?) {
        self.count = count
        self.canPost = canPost
        self.groupsCanPost = groupsCanPost
    }
}

// MARK: - Likes
class Likes: Codable {
    let canLike, canPublish, count, userLikes: Int

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case canPublish = "can_publish"
        case count
        case userLikes = "user_likes"
    }

    init(canLike: Int, canPublish: Int, count: Int, userLikes: Int) {
        self.canLike = canLike
        self.canPublish = canPublish
        self.count = count
        self.userLikes = userLikes
    }
}

// MARK: - PostSource
class PostSource: Codable {
    let platform: String?
    let type: PostSourceType

    init(platform: String?, type: PostSourceType) {
        self.platform = platform
        self.type = type
    }
}

enum PostSourceType: String, Codable {
    case api = "api"
    case vk = "vk"
}

enum PostTypeEnum: String, Codable {
    case post = "post"
}

// MARK: - Reposts
class Reposts: Codable {
    let count, userReposted: Int

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }

    init(count: Int, userReposted: Int) {
        self.count = count
        self.userReposted = userReposted
    }
}

// MARK: - Views
class Views: Codable {
    let count: Int

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Profile
class Profile: Codable {
    let canAccessClosed: Bool
    let screenName: String
    let online, id: Int
    let photo100: String
    let lastName: String
    let photo50: String
    let onlineInfo: OnlineInfo
    let sex: Int
    let isClosed: Bool
    let firstName: String

    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case screenName = "screen_name"
        case online, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case onlineInfo = "online_info"
        case sex
        case isClosed = "is_closed"
        case firstName = "first_name"
    }

    init(canAccessClosed: Bool, screenName: String, online: Int, id: Int, photo100: String, lastName: String, photo50: String, onlineInfo: OnlineInfo, sex: Int, isClosed: Bool, firstName: String) {
        self.canAccessClosed = canAccessClosed
        self.screenName = screenName
        self.online = online
        self.id = id
        self.photo100 = photo100
        self.lastName = lastName
        self.photo50 = photo50
        self.onlineInfo = onlineInfo
        self.sex = sex
        self.isClosed = isClosed
        self.firstName = firstName
    }
}

// MARK: - OnlineInfo
class OnlineInfo: Codable {
    let visible, isMobile, isOnline: Bool

    enum CodingKeys: String, CodingKey {
        case visible
        case isMobile = "is_mobile"
        case isOnline = "is_online"
    }

    init(visible: Bool, isMobile: Bool, isOnline: Bool) {
        self.visible = visible
        self.isMobile = isMobile
        self.isOnline = isOnline
    }
}

