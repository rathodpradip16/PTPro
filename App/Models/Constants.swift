//
//  Constants.swift
//  App
//
//  Created by RADICAL START on 18/03/19.
//  Copyright © 2019 RADICAL START. All rights reserved.
//

import Foundation
import UIKit
import Apollo



let FULLWIDTH  = UIScreen.main.bounds.width

let FULLHEIGHT = UIScreen.main.bounds.height

let OFFLINEY = FULLHEIGHT - 150

//MARK: - Default language

let DEFAULT_LANGUAGE = "English"
//BASE URL

enum Environment: String {
    case development = "dev"
    case production = "production"
    case localhost = "localhost"
}

#if DEBUG
let environment = Environment.development
#else
let environment = Environment.production
#endif

var BASE_URL : String {
    get {
        switch environment {
        case .development:
            return "http://ptpro.paperbirdtech.com:3000"
        case .production:
            return "http://ptpro.paperbirdtech.com:3000"
        case .localhost:
            return "http://ptpro.paperbirdtech.com:3000"
        }
    }
}




let IMAGE_AVATAR_MEDIUM = "\(BASE_URL)/images/avatar/medium_"
let IMAGE_AVATAR_SMALL = "\(BASE_URL)/images/avatar/medium_"
let IMAGE_AVATAR_URL = "\(BASE_URL)/images/avatar/"
let IMAGE_LISTING_MEDIUM = "\(BASE_URL)/images/upload/x_medium_"
let IMAGE_LISTING_SMALL = "\(BASE_URL)/images/upload/x_medium_"
let POPULAR_LOCATION_IMAGE = "\(BASE_URL)/images/popularLocation/"
let amenitiesIcons = "\(BASE_URL)/images/amenities/"
let IMAGE_UPLOAD_PHOTO = "\(BASE_URL)/uploadPhoto"
let LISTINGIMAGE_UPLOAD = "\(BASE_URL)/uploadListPhoto"
let WHY_HOST_IMG = "\(BASE_URL)/images/whyhost/"
let SAFETY_URL = "\(BASE_URL)/safety/"
let SHARE_URL = "\(BASE_URL)/rooms/"
let ABOUT_URL = "\(BASE_URL)/about"
let TERMS_URL = "\(BASE_URL)/privacy"
let HELP_URL = "\(BASE_URL)/contact"
let Banner_URL = "\(BASE_URL)/images/banner/"
let GUEST = "guest"
let HOST = "host"


//MARK: - Font
//let APP_FONT = "Circular-Book"
//let APP_FONT_MEDIUM = "Circular-Medium"
//let APP_FONT_BOLD = "Circular-Bold"

let APP_FONT = "BeVietnamPro-Regular"
let APP_FONT_MEDIUM = "BeVietnamPro-Medium"
let APP_FONT_SEMIBOLD = "BeVietnamPro-SemiBold"
let APP_FONT_BOLD = "BeVietnamPro-Bold"

//MARK: Device Models
let IS_IPHONE_XR = UIDevice().userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 1792 || UIScreen.main.nativeBounds.height == 2688)
let IS_IPHONE_X = UIDevice().userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 2436)
let IS_IPHONE_PLUS = UIDevice().userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 2208 || UIScreen.main.nativeBounds.height == 1920)
let IS_IPHONE_678 = UIDevice().userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 1334)
let IS_IPHONE_5 = UIDevice().userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 1136)
let IS_IPHONE_XS_MAX = UIDevice().userInterfaceIdiom == .phone && (UIScreen.main.nativeBounds.height == 2688)

let categoryIdentifier = "myNotificationCategory"



var GOOGLE_API_KEY : String{
    get{
        switch environment{
        case .development:
            return "AIzaSyCahMFhT2mZ5sytEjAJo2YbTV14UoOkMq4"
        case .production:
            return "AIzaSyCahMFhT2mZ5sytEjAJo2YbTV14UoOkMq4"
        case .localhost:
            return "AIzaSyCahMFhT2mZ5sytEjAJo2YbTV14UoOkMq4"
        }
    }
}

var STRIPE_PUBLISHABLE_KEY : String{
    get{
        switch environment{
        case .development:
            return "pk_test_C5ukBJM7qr5P1F8dY4XKhdyp"
        case .production:
            return "pk_test_C5ukBJM7qr5P1F8dY4XKhdyp"
        case .localhost:
            return "pk_test_C5ukBJM7qr5P1F8dY4XKhdyp"
        }
    }
}

var PayPal_Client_ID : String{
    get{
        switch environment{
        case .development:
            return ""
        case .production:
            return ""
        case .localhost:
            return ""
        }
    }
}

var graphQLEndpoint : String {
    get {
        switch environment {
        case .development:
            return "http://ptpro.paperbirdtech.com:4000/graphql"
        case .production:
            return "http://ptpro.paperbirdtech.com:4000/graphql"
        case .localhost:
            return "http://ptpro.paperbirdtech.com:4000/graphql"
        }
    }
}

let GOOGLE_CLIENT_ID = "1059773356859-ijc0h2t6k5dvnqi9s0s5hp1poac6r2at.apps.googleusercontent.com"
let apollo = ApolloClient(url: URL(string:graphQLEndpoint)!)

func convertToDictionary(text: String) -> [[String: Any]]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

let inboxDateFormat = "MM-dd-yyyy"
let guestTripsDateFormat = "MM/dd/YYYY"
let itenarayReceiptDayFormat = "EEE"
let itenararyReceiptDateFormat = "MMM dd yyyy"
let receiptformat = "MMM dd yyyy"

