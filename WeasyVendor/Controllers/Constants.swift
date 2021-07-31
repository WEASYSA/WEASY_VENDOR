//
//  Constants.swift
//  WEASY
//
//  Created by Amal Elgalant on 10/29/19.
//  Copyright © 2019 Amal Elgalant. All rights reserved.
//

import Foundation

class Constants {
    
//    static var DOMAIN = "https://weasy.sa/weasy/public/api/"
    static var DOMAIN = "https://weasy.sa/api/"
    static var LOGIN = DOMAIN + "vendor_login"
    static var USER_DATA = DOMAIN + "vendor_profile"
    static var PENDING_ORDERS = DOMAIN + "vendor_orders_pending"
    static var ALL_ORDERS = DOMAIN + "vendor_orders"
    static var ORDER_DETAILS = DOMAIN + "order_information/"
    static var ACCEPT_ORDER = DOMAIN + "vendor_accept_order/"
    static var CONFIRM_ORDER = DOMAIN + "vendor_confirm_order/"
    static var READY_TO_UP_ORDER = DOMAIN + "vendor_ready_to_pick_order/"
    static var PREPARING_ORDER = DOMAIN + "vendor_preparing_order/"
    static var REJECT_ORDER = DOMAIN + "vendor_reject_order"
    static var PAY_ORDER = DOMAIN + "vendor_paid_order"
    static var ITEMS = DOMAIN + "vendor_items"
    static var CHANGE_ITEM_AVAILABLE = DOMAIN + "vendor_available_items"
    static var EARNINGS = DOMAIN + "earnings"
    static var SUPPORT = DOMAIN + "vendor_support"
    static var GET_RUCH_TIME = DOMAIN + "vendor_get_timer_status"
    static var UPDATE_RUCH_TIME = DOMAIN + "vendor_timer_status"
    static var CAR_SERVICE_STATUS = DOMAIN + "car_service_status"
    static var GET_CAR_SERVICE_STATUS = DOMAIN + "vendor_get_car_service_status"
    static var DAIN_IN = DOMAIN + "vendor_dnn_table"
    static var GET_DAIN_IN = DOMAIN + "vendor_get_dnn_table"
    static var BOOKING_TABLE = DOMAIN + "vendor_list_reservation_table"
    static var ADD_TOKEN = DOMAIN + "check_token_device_reservation_tbl"
//    static var LOG_OUT = DOMAIN + "vendor_logout_remove_device_token"
    static var LOGOUT = DOMAIN + "app_logout"
    static var MARK_AS_DEBTOR = DOMAIN + "vendor_debtor"
    static var vendor_branch_status = DOMAIN + "vendor_branch_status"
    
    //vendor_debtor
    static var HEADER = [
        "token": "",
        "Content-Type": "application/x-www-form-urlencoded",
        "lang" : AppDelegate.cuurentLanguage
    ]
}
