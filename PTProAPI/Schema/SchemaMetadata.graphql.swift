// @generated
// This file was automatically generated and should not be edited.

import Apollo

protocol PTProAPI_SelectionSet: Apollo.SelectionSet & Apollo.RootSelectionSet
where Schema == PTProAPI.SchemaMetadata {}

protocol PTProAPI_InlineFragment: Apollo.SelectionSet & Apollo.InlineFragment
where Schema == PTProAPI.SchemaMetadata {}

protocol PTProAPI_MutableSelectionSet: Apollo.MutableRootSelectionSet
where Schema == PTProAPI.SchemaMetadata {}

protocol PTProAPI_MutableInlineFragment: Apollo.MutableSelectionSet & Apollo.InlineFragment
where Schema == PTProAPI.SchemaMetadata {}

extension PTProAPI {
  typealias ID = String

  typealias SelectionSet = PTProAPI_SelectionSet

  typealias InlineFragment = PTProAPI_InlineFragment

  typealias MutableSelectionSet = PTProAPI_MutableSelectionSet

  typealias MutableInlineFragment = PTProAPI_MutableInlineFragment

  enum SchemaMetadata: Apollo.SchemaMetadata {
    static let configuration: Apollo.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> Apollo.Object? {
      switch typename {
      case "Query": return PTProAPI.Objects.Query
      case "AffiliateUserDocumentManagementType": return PTProAPI.Objects.AffiliateUserDocumentManagementType
      case "Mutation": return PTProAPI.Objects.Mutation
      case "subscriptionPaymentType": return PTProAPI.Objects.SubscriptionPaymentType
      case "Reservation": return PTProAPI.Objects.Reservation
      case "Reviewlist": return PTProAPI.Objects.Reviewlist
      case "Reviews": return PTProAPI.Objects.Reviews
      case "userProfile": return PTProAPI.Objects.UserProfile
      case "SiteSettingsCommon": return PTProAPI.Objects.SiteSettingsCommon
      case "ApplicationVersion": return PTProAPI.Objects.ApplicationVersion
      case "AllEmailToken": return PTProAPI.Objects.AllEmailToken
      case "CommonType": return PTProAPI.Objects.CommonType
      case "UserType": return PTProAPI.Objects.UserType
      case "StaticPageCommonType": return PTProAPI.Objects.StaticPageCommonType
      case "StaticPageType": return PTProAPI.Objects.StaticPageType
      case "EditListingResponse": return PTProAPI.Objects.EditListingResponse
      case "EditListing": return PTProAPI.Objects.EditListing
      case "HouseRules": return PTProAPI.Objects.HouseRules
      case "ageype": return PTProAPI.Objects.Ageype
      case "Event": return PTProAPI.Objects.Event
      case "Pet": return PTProAPI.Objects.Pet
      case "Children": return PTProAPI.Objects.Children
      case "Smoking": return PTProAPI.Objects.Smoking
      case "dynamicRule": return PTProAPI.Objects.DynamicRule
      case "aboutType": return PTProAPI.Objects.AboutType
      case "TransactionType": return PTProAPI.Objects.TransactionType
      case "categoryListcountType": return PTProAPI.Objects.CategoryListcountType
      case "RresultssType": return PTProAPI.Objects.RresultssType
      case "CategorysType": return PTProAPI.Objects.CategorysType
      case "PhotosType": return PTProAPI.Objects.PhotosType
      case "Bathroom": return PTProAPI.Objects.Bathroom
      case "BathroomTypeType1": return PTProAPI.Objects.BathroomTypeType1
      case "BedroomTypeInput1": return PTProAPI.Objects.BedroomTypeInput1
      case "BedTypeInput1": return PTProAPI.Objects.BedTypeInput1
      case "AllWishListGroup": return PTProAPI.Objects.AllWishListGroup
      case "WishListGroup": return PTProAPI.Objects.WishListGroup
      case "WishList": return PTProAPI.Objects.WishList
      case "ShowListing": return PTProAPI.Objects.ShowListing
      case "listPhotosData": return PTProAPI.Objects.ListPhotosData
      case "listingDatas": return PTProAPI.Objects.ListingDatas
      case "userListingData": return PTProAPI.Objects.UserListingData
      case "singleListSettings": return PTProAPI.Objects.SingleListSettings
      case "GetWishListType": return PTProAPI.Objects.GetWishListType
      case "SiteSettings": return PTProAPI.Objects.SiteSettings
      case "Couponmanager": return PTProAPI.Objects.Couponmanager
      case "WholeAccount": return PTProAPI.Objects.WholeAccount
      case "UserAccount": return PTProAPI.Objects.UserAccount
      case "UserVerifiedInfo": return PTProAPI.Objects.UserVerifiedInfo
      case "ReservationPayment": return PTProAPI.Objects.ReservationPayment
      case "AffiliateUserverificationType": return PTProAPI.Objects.AffiliateUserverificationType
      case "PayoutWholeType": return PTProAPI.Objects.PayoutWholeType
      case "Payout": return PTProAPI.Objects.Payout
      case "PaymentMethods": return PTProAPI.Objects.PaymentMethods
      case "GetPaymentType": return PTProAPI.Objects.GetPaymentType
      case "GetPayoutType": return PTProAPI.Objects.GetPayoutType
      case "AllListing": return PTProAPI.Objects.AllListing
      case "listBlockedDates": return PTProAPI.Objects.ListBlockedDates
      case "BedTypes": return PTProAPI.Objects.BedTypes
      case "listSettingsTypes": return PTProAPI.Objects.ListSettingsTypes
      case "user": return PTProAPI.Objects.User
      case "profile": return PTProAPI.Objects.Profile
      case "allListSettingTypes": return PTProAPI.Objects.AllListSettingTypes
      case "HouseRules1": return PTProAPI.Objects.HouseRules1
      case "ageypes": return PTProAPI.Objects.Ageypes
      case "Events": return PTProAPI.Objects.Events
      case "Pets": return PTProAPI.Objects.Pets
      case "Childrens": return PTProAPI.Objects.Childrens
      case "Smokings": return PTProAPI.Objects.Smokings
      case "dynamicRules": return PTProAPI.Objects.DynamicRules
      case "Cancellation": return PTProAPI.Objects.Cancellation
      case "aboutTypes": return PTProAPI.Objects.AboutTypes
      case "Reservationlist": return PTProAPI.Objects.Reservationlist
      case "Threads": return PTProAPI.Objects.Threads
      case "AllThreads": return PTProAPI.Objects.AllThreads
      case "ThreadItems": return PTProAPI.Objects.ThreadItems
      case "NewThreadsCommonType": return PTProAPI.Objects.NewThreadsCommonType
      case "NewThreadsType": return PTProAPI.Objects.NewThreadsType
      case "SendMessage": return PTProAPI.Objects.SendMessage
      case "UnreadThreadsCount": return PTProAPI.Objects.UnreadThreadsCount
      case "UnReadCount": return PTProAPI.Objects.UnReadCount
      case "AffiliateLinksType": return PTProAPI.Objects.AffiliateLinksType
      case "resultdata": return PTProAPI.Objects.Resultdata
      case "searchlistaffiliate": return PTProAPI.Objects.Searchlistaffiliate
      case "listPhotoss": return PTProAPI.Objects.ListPhotoss
      case "listingDataa": return PTProAPI.Objects.ListingDataa
      case "PlanDetailsType": return PTProAPI.Objects.PlanDetailsType
      case "GetPlanDetailsType": return PTProAPI.Objects.GetPlanDetailsType
      case "MembershipPlanBenefitsType": return PTProAPI.Objects.MembershipPlanBenefitsType
      case "MembershipPlanType": return PTProAPI.Objects.MembershipPlanType
      case "Getcoupon": return PTProAPI.Objects.Getcoupon
      case "ImageBannerCommonType": return PTProAPI.Objects.ImageBannerCommonType
      case "ImageBanner": return PTProAPI.Objects.ImageBanner
      case "ListPhotosCommon": return PTProAPI.Objects.ListPhotosCommon
      case "UserCommon": return PTProAPI.Objects.UserCommon
      case "userEditProfile": return PTProAPI.Objects.UserEditProfile
      case "UserProfile": return PTProAPI.Objects.UserProfile
      case "PopularLocationCommonType": return PTProAPI.Objects.PopularLocationCommonType
      case "PopularLocationListing": return PTProAPI.Objects.PopularLocationListing
      case "AllList": return PTProAPI.Objects.AllList
      case "Currency": return PTProAPI.Objects.Currency
      case "AllRatesType": return PTProAPI.Objects.AllRatesType
      case "AllSearchSettingsType": return PTProAPI.Objects.AllSearchSettingsType
      case "SearchSettingsType": return PTProAPI.Objects.SearchSettingsType
      case "listingSettingCommonTypes": return PTProAPI.Objects.ListingSettingCommonTypes
      case "listingSettingsTypesCommon": return PTProAPI.Objects.ListingSettingsTypesCommon
      case "listingSettingsCommon": return PTProAPI.Objects.ListingSettingsCommon
      case "socialLoginsType": return PTProAPI.Objects.SocialLoginsType
      case "resultType": return PTProAPI.Objects.ResultType
      case "ReportUserResult": return PTProAPI.Objects.ReportUserResult
      case "affiliatestepType": return PTProAPI.Objects.AffiliatestepType
      case "CommonReservationType": return PTProAPI.Objects.CommonReservationType
      case "customAmenitiesType": return PTProAPI.Objects.CustomAmenitiesType
      case "listingSettingsCommonTypes": return PTProAPI.Objects.ListingSettingsCommonTypes
      case "settingsType": return PTProAPI.Objects.SettingsType
      case "listingSettingsTypes": return PTProAPI.Objects.ListingSettingsTypes
      case "listingSettings": return PTProAPI.Objects.ListingSettings
      case "ListBlockedDatesResponseType": return PTProAPI.Objects.ListBlockedDatesResponseType
      case "ListBlockedDates": return PTProAPI.Objects.ListBlockedDates
      case "AffiliateUserType": return PTProAPI.Objects.AffiliateUserType
      case "PhotoCategoryType": return PTProAPI.Objects.PhotoCategoryType
      case "Results1Type": return PTProAPI.Objects.Results1Type
      case "photoCategorylistType": return PTProAPI.Objects.PhotoCategorylistType
      case "CreateCustomPlanRequestType": return PTProAPI.Objects.CreateCustomPlanRequestType
      case "CalculateOccupancyRate": return PTProAPI.Objects.CalculateOccupancyRate
      case "price": return PTProAPI.Objects.Price
      case "pricedetail": return PTProAPI.Objects.Pricedetail
      case "item": return PTProAPI.Objects.Item
      case "other": return PTProAPI.Objects.Other
      case "ratings": return PTProAPI.Objects.Ratings
      case "occupacys": return PTProAPI.Objects.Occupacys
      case "ListCalendar": return PTProAPI.Objects.ListCalendar
      case "HostSuggested": return PTProAPI.Objects.HostSuggested
      case "SearchListing": return PTProAPI.Objects.SearchListing
      case "Trymelistviews": return PTProAPI.Objects.Trymelistviews
      case "AllBillingType": return PTProAPI.Objects.AllBillingType
      case "BillingType": return PTProAPI.Objects.BillingType
      case "SpecialPricingType": return PTProAPI.Objects.SpecialPricingType
      case "SocialVerification": return PTProAPI.Objects.SocialVerification
      case "emailToken": return PTProAPI.Objects.EmailToken
      case "AllCountry": return PTProAPI.Objects.AllCountry
      case "Country": return PTProAPI.Objects.Country
      case "GetClicksType": return PTProAPI.Objects.GetClicksType
      case "GetGraphType": return PTProAPI.Objects.GetGraphType
      case "UserLanguagesType": return PTProAPI.Objects.UserLanguagesType
      case "LanguageItemType": return PTProAPI.Objects.LanguageItemType
      case "AllCurrenciesType": return PTProAPI.Objects.AllCurrenciesType
      case "Currencies": return PTProAPI.Objects.Currencies
      case "GetDynamicBedBathType": return PTProAPI.Objects.GetDynamicBedBathType
      case "ResultsType": return PTProAPI.Objects.ResultsType
      case "BathroomdataType": return PTProAPI.Objects.BathroomdataType
      case "BedroomdataType": return PTProAPI.Objects.BedroomdataType
      case "BeddataType": return PTProAPI.Objects.BeddataType
      case "getdynamicbedtypelist": return PTProAPI.Objects.Getdynamicbedtypelist
      case "getdynamicbedtype": return PTProAPI.Objects.Getdynamicbedtype
      case "AllReservation": return PTProAPI.Objects.AllReservation
      case "AffiliateUserverificationwebType": return PTProAPI.Objects.AffiliateUserverificationwebType
      case "ReviewResponse": return PTProAPI.Objects.ReviewResponse
      case "AllReview": return PTProAPI.Objects.AllReview
      case "WhyHostCommonType": return PTProAPI.Objects.WhyHostCommonType
      case "WhyHostType": return PTProAPI.Objects.WhyHostType
      case "ListPhotos": return PTProAPI.Objects.ListPhotos
      case "photoCategorylistdataType": return PTProAPI.Objects.PhotoCategorylistdataType
      case "GetClicks": return PTProAPI.Objects.GetClicks
      case "getData": return PTProAPI.Objects.GetData
      case "GetGraph": return PTProAPI.Objects.GetGraph
      case "ListingResponse": return PTProAPI.Objects.ListingResponse
      case "CreateListing": return PTProAPI.Objects.CreateListing
      case "Enquiry": return PTProAPI.Objects.Enquiry
      case "AdminListing": return PTProAPI.Objects.AdminListing
      case "GetPaymentKey": return PTProAPI.Objects.GetPaymentKey
      case "StripeKeysType": return PTProAPI.Objects.StripeKeysType
      case "AffiliateUserverificationaccountType": return PTProAPI.Objects.AffiliateUserverificationaccountType
      case "CancellationResponse": return PTProAPI.Objects.CancellationResponse
      case "ReservationCancel": return PTProAPI.Objects.ReservationCancel
      case "ShowUserProfileCommon": return PTProAPI.Objects.ShowUserProfileCommon
      case "ShowUserProfile": return PTProAPI.Objects.ShowUserProfile
      case "WholeManageListingsType": return PTProAPI.Objects.WholeManageListingsType
      case "userListingSteps": return PTProAPI.Objects.UserListingSteps
      case "ShowListingCommon": return PTProAPI.Objects.ShowListingCommon
      case "ShowListingSteps": return PTProAPI.Objects.ShowListingSteps
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}