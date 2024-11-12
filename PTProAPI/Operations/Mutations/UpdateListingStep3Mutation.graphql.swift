// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UpdateListingStep3Mutation: GraphQLMutation {
    static let operationName: String = "updateListingStep3"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation updateListingStep3($id: Int, $houseRules: String, $bookingNoticeTime: String, $checkInStart: String, $checkInEnd: String, $maxDaysNotice: String, $minNight: Int, $maxNight: Int, $earlyCheckInFees: Int, $basePrice: Float, $cleaningPrice: Float, $currency: String, $is_affiliate: Int, $affiliate_commission: Float, $weeklyDiscount: Int, $monthlyDiscount: Int, $blockedDates: [String], $bookingType: String!, $cancellationPolicy: Int, $petFee: Int, $petSelected: Boolean, $checkInEntrySelected: Boolean, $checkInType: String, $texTypeId: Int, $taxPercentage: Float, $taxPersonAge: Int, $taxAmount: Int, $aboutHost: String) { updateListingStep3( id: $id houseRules: $houseRules bookingNoticeTime: $bookingNoticeTime checkInStart: $checkInStart checkInEnd: $checkInEnd maxDaysNotice: $maxDaysNotice minNight: $minNight maxNight: $maxNight earlyCheckInFees: $earlyCheckInFees basePrice: $basePrice cleaningPrice: $cleaningPrice currency: $currency is_affiliate: $is_affiliate affiliate_commission: $affiliate_commission weeklyDiscount: $weeklyDiscount monthlyDiscount: $monthlyDiscount blockedDates: $blockedDates bookingType: $bookingType cancellationPolicy: $cancellationPolicy petFee: $petFee petSelected: $petSelected checkInEntrySelected: $checkInEntrySelected checkInType: $checkInType texTypeId: $texTypeId taxPercentage: $taxPercentage taxPersonAge: $taxPersonAge taxAmount: $taxAmount aboutHost: $aboutHost ) { __typename results { __typename id houseRules { __typename isAgeSelected isEventSelected isPetSelected isChildrenSelected isSmokingSelected age { __typename age } event { __typename isBirthDay isFamilyGathering isOtherSelcted otherDetails attendees } pet { __typename petNo isDogAllowed isCatAllowed anypet petSize } children { __typename twoyears twelveyears seventeenyears } smoking { __typename indoors outDoors details } dynamicRules { __typename rule id isSelected isYesSelected isNoSelected Details } } bookingNoticeTime checkInStart checkInEnd maxDaysNotice minNight maxNight basePrice cleaningPrice currency is_affiliate affiliate_commission weeklyDiscount monthlyDiscount blockedDates petFee petSelected checkInEntrySelected checkInType earlyCheckInFees texTypeId taxPercentage taxPersonAge taxAmount aboutHost { __typename isProfessional bdStreet bdApt bdCity bdState bdzipcode bdCountry bmFirstname bmLastname businessName } } status errorMessage actionType } }"#
      ))

    public var id: GraphQLNullable<Int>
    public var houseRules: GraphQLNullable<String>
    public var bookingNoticeTime: GraphQLNullable<String>
    public var checkInStart: GraphQLNullable<String>
    public var checkInEnd: GraphQLNullable<String>
    public var maxDaysNotice: GraphQLNullable<String>
    public var minNight: GraphQLNullable<Int>
    public var maxNight: GraphQLNullable<Int>
    public var earlyCheckInFees: GraphQLNullable<Int>
    public var basePrice: GraphQLNullable<Double>
    public var cleaningPrice: GraphQLNullable<Double>
    public var currency: GraphQLNullable<String>
    public var is_affiliate: GraphQLNullable<Int>
    public var affiliate_commission: GraphQLNullable<Double>
    public var weeklyDiscount: GraphQLNullable<Int>
    public var monthlyDiscount: GraphQLNullable<Int>
    public var blockedDates: GraphQLNullable<[String?]>
    public var bookingType: String
    public var cancellationPolicy: GraphQLNullable<Int>
    public var petFee: GraphQLNullable<Int>
    public var petSelected: GraphQLNullable<Bool>
    public var checkInEntrySelected: GraphQLNullable<Bool>
    public var checkInType: GraphQLNullable<String>
    public var texTypeId: GraphQLNullable<Int>
    public var taxPercentage: GraphQLNullable<Double>
    public var taxPersonAge: GraphQLNullable<Int>
    public var taxAmount: GraphQLNullable<Int>
    public var aboutHost: GraphQLNullable<String>

    public init(
      id: GraphQLNullable<Int>,
      houseRules: GraphQLNullable<String>,
      bookingNoticeTime: GraphQLNullable<String>,
      checkInStart: GraphQLNullable<String>,
      checkInEnd: GraphQLNullable<String>,
      maxDaysNotice: GraphQLNullable<String>,
      minNight: GraphQLNullable<Int>,
      maxNight: GraphQLNullable<Int>,
      earlyCheckInFees: GraphQLNullable<Int>,
      basePrice: GraphQLNullable<Double>,
      cleaningPrice: GraphQLNullable<Double>,
      currency: GraphQLNullable<String>,
      is_affiliate: GraphQLNullable<Int>,
      affiliate_commission: GraphQLNullable<Double>,
      weeklyDiscount: GraphQLNullable<Int>,
      monthlyDiscount: GraphQLNullable<Int>,
      blockedDates: GraphQLNullable<[String?]>,
      bookingType: String,
      cancellationPolicy: GraphQLNullable<Int>,
      petFee: GraphQLNullable<Int>,
      petSelected: GraphQLNullable<Bool>,
      checkInEntrySelected: GraphQLNullable<Bool>,
      checkInType: GraphQLNullable<String>,
      texTypeId: GraphQLNullable<Int>,
      taxPercentage: GraphQLNullable<Double>,
      taxPersonAge: GraphQLNullable<Int>,
      taxAmount: GraphQLNullable<Int>,
      aboutHost: GraphQLNullable<String>
    ) {
      self.id = id
      self.houseRules = houseRules
      self.bookingNoticeTime = bookingNoticeTime
      self.checkInStart = checkInStart
      self.checkInEnd = checkInEnd
      self.maxDaysNotice = maxDaysNotice
      self.minNight = minNight
      self.maxNight = maxNight
      self.earlyCheckInFees = earlyCheckInFees
      self.basePrice = basePrice
      self.cleaningPrice = cleaningPrice
      self.currency = currency
      self.is_affiliate = is_affiliate
      self.affiliate_commission = affiliate_commission
      self.weeklyDiscount = weeklyDiscount
      self.monthlyDiscount = monthlyDiscount
      self.blockedDates = blockedDates
      self.bookingType = bookingType
      self.cancellationPolicy = cancellationPolicy
      self.petFee = petFee
      self.petSelected = petSelected
      self.checkInEntrySelected = checkInEntrySelected
      self.checkInType = checkInType
      self.texTypeId = texTypeId
      self.taxPercentage = taxPercentage
      self.taxPersonAge = taxPersonAge
      self.taxAmount = taxAmount
      self.aboutHost = aboutHost
    }

    public var __variables: Variables? { [
      "id": id,
      "houseRules": houseRules,
      "bookingNoticeTime": bookingNoticeTime,
      "checkInStart": checkInStart,
      "checkInEnd": checkInEnd,
      "maxDaysNotice": maxDaysNotice,
      "minNight": minNight,
      "maxNight": maxNight,
      "earlyCheckInFees": earlyCheckInFees,
      "basePrice": basePrice,
      "cleaningPrice": cleaningPrice,
      "currency": currency,
      "is_affiliate": is_affiliate,
      "affiliate_commission": affiliate_commission,
      "weeklyDiscount": weeklyDiscount,
      "monthlyDiscount": monthlyDiscount,
      "blockedDates": blockedDates,
      "bookingType": bookingType,
      "cancellationPolicy": cancellationPolicy,
      "petFee": petFee,
      "petSelected": petSelected,
      "checkInEntrySelected": checkInEntrySelected,
      "checkInType": checkInType,
      "texTypeId": texTypeId,
      "taxPercentage": taxPercentage,
      "taxPersonAge": taxPersonAge,
      "taxAmount": taxAmount,
      "aboutHost": aboutHost
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("updateListingStep3", UpdateListingStep3?.self, arguments: [
          "id": .variable("id"),
          "houseRules": .variable("houseRules"),
          "bookingNoticeTime": .variable("bookingNoticeTime"),
          "checkInStart": .variable("checkInStart"),
          "checkInEnd": .variable("checkInEnd"),
          "maxDaysNotice": .variable("maxDaysNotice"),
          "minNight": .variable("minNight"),
          "maxNight": .variable("maxNight"),
          "earlyCheckInFees": .variable("earlyCheckInFees"),
          "basePrice": .variable("basePrice"),
          "cleaningPrice": .variable("cleaningPrice"),
          "currency": .variable("currency"),
          "is_affiliate": .variable("is_affiliate"),
          "affiliate_commission": .variable("affiliate_commission"),
          "weeklyDiscount": .variable("weeklyDiscount"),
          "monthlyDiscount": .variable("monthlyDiscount"),
          "blockedDates": .variable("blockedDates"),
          "bookingType": .variable("bookingType"),
          "cancellationPolicy": .variable("cancellationPolicy"),
          "petFee": .variable("petFee"),
          "petSelected": .variable("petSelected"),
          "checkInEntrySelected": .variable("checkInEntrySelected"),
          "checkInType": .variable("checkInType"),
          "texTypeId": .variable("texTypeId"),
          "taxPercentage": .variable("taxPercentage"),
          "taxPersonAge": .variable("taxPersonAge"),
          "taxAmount": .variable("taxAmount"),
          "aboutHost": .variable("aboutHost")
        ]),
      ] }

      var updateListingStep3: UpdateListingStep3? { __data["updateListingStep3"] }

      /// UpdateListingStep3
      ///
      /// Parent Type: `EditListingResponse`
      struct UpdateListingStep3: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.EditListingResponse }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("actionType", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var actionType: String? { __data["actionType"] }

        /// UpdateListingStep3.Results
        ///
        /// Parent Type: `EditListing`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.EditListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("houseRules", HouseRules?.self),
            .field("bookingNoticeTime", String?.self),
            .field("checkInStart", String?.self),
            .field("checkInEnd", String?.self),
            .field("maxDaysNotice", String?.self),
            .field("minNight", Int?.self),
            .field("maxNight", Int?.self),
            .field("basePrice", Double?.self),
            .field("cleaningPrice", Double?.self),
            .field("currency", String?.self),
            .field("is_affiliate", Int?.self),
            .field("affiliate_commission", Double?.self),
            .field("weeklyDiscount", Int?.self),
            .field("monthlyDiscount", Int?.self),
            .field("blockedDates", [String?]?.self),
            .field("petFee", Int?.self),
            .field("petSelected", Bool?.self),
            .field("checkInEntrySelected", Bool?.self),
            .field("checkInType", String?.self),
            .field("earlyCheckInFees", Int?.self),
            .field("texTypeId", Int?.self),
            .field("taxPercentage", Double?.self),
            .field("taxPersonAge", Int?.self),
            .field("taxAmount", Int?.self),
            .field("aboutHost", AboutHost?.self),
          ] }

          var id: Int? { __data["id"] }
          var houseRules: HouseRules? { __data["houseRules"] }
          var bookingNoticeTime: String? { __data["bookingNoticeTime"] }
          var checkInStart: String? { __data["checkInStart"] }
          var checkInEnd: String? { __data["checkInEnd"] }
          var maxDaysNotice: String? { __data["maxDaysNotice"] }
          var minNight: Int? { __data["minNight"] }
          var maxNight: Int? { __data["maxNight"] }
          var basePrice: Double? { __data["basePrice"] }
          var cleaningPrice: Double? { __data["cleaningPrice"] }
          var currency: String? { __data["currency"] }
          var is_affiliate: Int? { __data["is_affiliate"] }
          var affiliate_commission: Double? { __data["affiliate_commission"] }
          var weeklyDiscount: Int? { __data["weeklyDiscount"] }
          var monthlyDiscount: Int? { __data["monthlyDiscount"] }
          var blockedDates: [String?]? { __data["blockedDates"] }
          var petFee: Int? { __data["petFee"] }
          var petSelected: Bool? { __data["petSelected"] }
          var checkInEntrySelected: Bool? { __data["checkInEntrySelected"] }
          var checkInType: String? { __data["checkInType"] }
          var earlyCheckInFees: Int? { __data["earlyCheckInFees"] }
          var texTypeId: Int? { __data["texTypeId"] }
          var taxPercentage: Double? { __data["taxPercentage"] }
          var taxPersonAge: Int? { __data["taxPersonAge"] }
          var taxAmount: Int? { __data["taxAmount"] }
          var aboutHost: AboutHost? { __data["aboutHost"] }

          /// UpdateListingStep3.Results.HouseRules
          ///
          /// Parent Type: `HouseRules`
          struct HouseRules: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.HouseRules }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("isAgeSelected", Bool?.self),
              .field("isEventSelected", Bool?.self),
              .field("isPetSelected", Bool?.self),
              .field("isChildrenSelected", Bool?.self),
              .field("isSmokingSelected", Bool?.self),
              .field("age", Age?.self),
              .field("event", Event?.self),
              .field("pet", Pet?.self),
              .field("children", Children?.self),
              .field("smoking", Smoking?.self),
              .field("dynamicRules", [DynamicRule?]?.self),
            ] }

            var isAgeSelected: Bool? { __data["isAgeSelected"] }
            var isEventSelected: Bool? { __data["isEventSelected"] }
            var isPetSelected: Bool? { __data["isPetSelected"] }
            var isChildrenSelected: Bool? { __data["isChildrenSelected"] }
            var isSmokingSelected: Bool? { __data["isSmokingSelected"] }
            var age: Age? { __data["age"] }
            var event: Event? { __data["event"] }
            var pet: Pet? { __data["pet"] }
            var children: Children? { __data["children"] }
            var smoking: Smoking? { __data["smoking"] }
            var dynamicRules: [DynamicRule?]? { __data["dynamicRules"] }

            /// UpdateListingStep3.Results.HouseRules.Age
            ///
            /// Parent Type: `Ageype`
            struct Age: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Ageype }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("age", Int?.self),
              ] }

              var age: Int? { __data["age"] }
            }

            /// UpdateListingStep3.Results.HouseRules.Event
            ///
            /// Parent Type: `Event`
            struct Event: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Event }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("isBirthDay", Bool?.self),
                .field("isFamilyGathering", Bool?.self),
                .field("isOtherSelcted", Bool?.self),
                .field("otherDetails", String?.self),
                .field("attendees", Int?.self),
              ] }

              var isBirthDay: Bool? { __data["isBirthDay"] }
              var isFamilyGathering: Bool? { __data["isFamilyGathering"] }
              var isOtherSelcted: Bool? { __data["isOtherSelcted"] }
              var otherDetails: String? { __data["otherDetails"] }
              var attendees: Int? { __data["attendees"] }
            }

            /// UpdateListingStep3.Results.HouseRules.Pet
            ///
            /// Parent Type: `Pet`
            struct Pet: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Pet }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("petNo", Int?.self),
                .field("isDogAllowed", Bool?.self),
                .field("isCatAllowed", Bool?.self),
                .field("anypet", Bool?.self),
                .field("petSize", String?.self),
              ] }

              var petNo: Int? { __data["petNo"] }
              var isDogAllowed: Bool? { __data["isDogAllowed"] }
              var isCatAllowed: Bool? { __data["isCatAllowed"] }
              var anypet: Bool? { __data["anypet"] }
              var petSize: String? { __data["petSize"] }
            }

            /// UpdateListingStep3.Results.HouseRules.Children
            ///
            /// Parent Type: `Children`
            struct Children: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Children }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("twoyears", Bool?.self),
                .field("twelveyears", Bool?.self),
                .field("seventeenyears", Bool?.self),
              ] }

              var twoyears: Bool? { __data["twoyears"] }
              var twelveyears: Bool? { __data["twelveyears"] }
              var seventeenyears: Bool? { __data["seventeenyears"] }
            }

            /// UpdateListingStep3.Results.HouseRules.Smoking
            ///
            /// Parent Type: `Smoking`
            struct Smoking: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.Smoking }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("indoors", Bool?.self),
                .field("outDoors", Bool?.self),
                .field("details", String?.self),
              ] }

              var indoors: Bool? { __data["indoors"] }
              var outDoors: Bool? { __data["outDoors"] }
              var details: String? { __data["details"] }
            }

            /// UpdateListingStep3.Results.HouseRules.DynamicRule
            ///
            /// Parent Type: `DynamicRule`
            struct DynamicRule: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.DynamicRule }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("rule", String?.self),
                .field("id", Int?.self),
                .field("isSelected", Bool?.self),
                .field("isYesSelected", Bool?.self),
                .field("isNoSelected", Bool?.self),
                .field("Details", String?.self),
              ] }

              var rule: String? { __data["rule"] }
              var id: Int? { __data["id"] }
              var isSelected: Bool? { __data["isSelected"] }
              var isYesSelected: Bool? { __data["isYesSelected"] }
              var isNoSelected: Bool? { __data["isNoSelected"] }
              var details: String? { __data["Details"] }
            }
          }

          /// UpdateListingStep3.Results.AboutHost
          ///
          /// Parent Type: `AboutType`
          struct AboutHost: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.AboutType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("isProfessional", Bool?.self),
              .field("bdStreet", String?.self),
              .field("bdApt", String?.self),
              .field("bdCity", String?.self),
              .field("bdState", String?.self),
              .field("bdzipcode", String?.self),
              .field("bdCountry", String?.self),
              .field("bmFirstname", String?.self),
              .field("bmLastname", String?.self),
              .field("businessName", String?.self),
            ] }

            var isProfessional: Bool? { __data["isProfessional"] }
            var bdStreet: String? { __data["bdStreet"] }
            var bdApt: String? { __data["bdApt"] }
            var bdCity: String? { __data["bdCity"] }
            var bdState: String? { __data["bdState"] }
            var bdzipcode: String? { __data["bdzipcode"] }
            var bdCountry: String? { __data["bdCountry"] }
            var bmFirstname: String? { __data["bmFirstname"] }
            var bmLastname: String? { __data["bmLastname"] }
            var businessName: String? { __data["businessName"] }
          }
        }
      }
    }
  }

}