import UIKit


let GOOGLE_KEY = "AIzaSyAKeAwtdcSFHXsS8Y_7R41mrjwKLGuQr1w"

//MARK: - Colors
let GREEN_COLOR = UIColor(red: 4.0/255.0, green: 212.0/255.0, blue:0.0/255.0, alpha: 1.0)
let RED_COLOR = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
let ORANGE_COLOR = UIColor(red: 255.0/255.0, green: 87.0/255.0, blue: 0.0/255.0, alpha: 1.0)
let BLUE_COLOR = UIColor(red: 0.0/255.0, green: 172.0/255.0, blue: 255.0/255.0, alpha: 1.0)

let LIGHT_RED = UIColor(red: 253/255.0, green: 100/255.0, blue:100/255.0, alpha: 1.0)

let ORANGE_C = UIColor(red: 255/255.0, green: 87/255.0, blue:0/255.0, alpha: 1.0)
let RED_C = UIColor(red: 255/255.0, green: 38/255.0, blue:0/255.0, alpha: 1.0)
let YELLOW_C = UIColor(red: 248/255.0, green: 231/255.0, blue:28/255.0, alpha: 1.0)
let GREEN_C = UIColor(red: 126/255.0, green: 211/255.0, blue:33/255.0, alpha: 1.0)

//MARK: - Corner radious
let Corner_radious1 = 2
let Corner_radious2 = 4
let Corner_radious3 = 6

//MARK: - Auth0
let AUTH0_CLIENT_ID = "f47lSVZ0FriC6L2I6FEmrvHXavNWs0NE"
let AUTH0_CONNECTION = "monacoapp-users"
let AUTH0_BASE_URL = "https://monacoapp.eu.auth0.com"

//MARK: - Rest API
let BASE_URL = "http://104.131.179.118/monacoapp/public/api"

// MARK: - Languages
enum LANGUAGE: String {
    case EN = "1"
    case FR = "2"
    case IT = "3"
}

// MARK: - Error Code
enum ERROR_CODE {
    case success_WITH_NO_ERROR
    case error_INVALID_REQUEST
    case error_CONNECTION_FAILED
}
enum SIGNUP_ERROR {
    case success
    case username_EXISTS
    case email_EXISTS
    case connection_FAILED
}
enum TRAVEL_MODE: Int {
    case transit  = 0
    case bike = 1
    case car = 2
    case walk = 3
}
