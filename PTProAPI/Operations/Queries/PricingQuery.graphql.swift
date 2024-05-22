// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class PricingQuery: GraphQLQuery {
    static let operationName: String = "pricing"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query pricing($listId: Int) { pricing(listId: $listId) { __typename errorMessage status results { __typename id title distance basePrice score UserAmenities { __typename itemName score } sefetyAmenities { __typename itemName score } places { __typename itemName score } userspace { __typename itemName score } otherdata { __typename bedrooms personCapacity cancle bookingtype } rating { __typename rating } occupacy { __typename occupacy } } currentPropertyResult { __typename id title distance basePrice score UserAmenities { __typename itemName score } sefetyAmenities { __typename itemName score } places { __typename itemName score } userspace { __typename itemName score } otherdata { __typename bedrooms personCapacity cancle bookingtype } rating { __typename rating } occupacy { __typename occupacy } } } }"#
      ))

    public var listId: GraphQLNullable<Int>

    public init(listId: GraphQLNullable<Int>) {
      self.listId = listId
    }

    public var __variables: Variables? { ["listId": listId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("pricing", Pricing?.self, arguments: ["listId": .variable("listId")]),
      ] }

      var pricing: Pricing? { __data["pricing"] }

      /// Pricing
      ///
      /// Parent Type: `Price`
      struct Pricing: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Price }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", Int?.self),
          .field("results", [Result?]?.self),
          .field("currentPropertyResult", [CurrentPropertyResult?]?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: Int? { __data["status"] }
        var results: [Result?]? { __data["results"] }
        var currentPropertyResult: [CurrentPropertyResult?]? { __data["currentPropertyResult"] }

        /// Pricing.Result
        ///
        /// Parent Type: `Pricedetail`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Pricedetail }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("distance", Double?.self),
            .field("basePrice", Int?.self),
            .field("score", Double?.self),
            .field("UserAmenities", [UserAmenity?]?.self),
            .field("sefetyAmenities", [SefetyAmenity?]?.self),
            .field("places", [Place?]?.self),
            .field("userspace", [Userspace?]?.self),
            .field("otherdata", [Otherdatum?]?.self),
            .field("rating", [Rating?]?.self),
            .field("occupacy", [Occupacy?]?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var distance: Double? { __data["distance"] }
          var basePrice: Int? { __data["basePrice"] }
          var score: Double? { __data["score"] }
          var userAmenities: [UserAmenity?]? { __data["UserAmenities"] }
          var sefetyAmenities: [SefetyAmenity?]? { __data["sefetyAmenities"] }
          var places: [Place?]? { __data["places"] }
          var userspace: [Userspace?]? { __data["userspace"] }
          var otherdata: [Otherdatum?]? { __data["otherdata"] }
          var rating: [Rating?]? { __data["rating"] }
          var occupacy: [Occupacy?]? { __data["occupacy"] }

          /// Pricing.Result.UserAmenity
          ///
          /// Parent Type: `Item`
          struct UserAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.Result.SefetyAmenity
          ///
          /// Parent Type: `Item`
          struct SefetyAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.Result.Place
          ///
          /// Parent Type: `Item`
          struct Place: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.Result.Userspace
          ///
          /// Parent Type: `Item`
          struct Userspace: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.Result.Otherdatum
          ///
          /// Parent Type: `Other`
          struct Otherdatum: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Other }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("bedrooms", String?.self),
              .field("personCapacity", Int?.self),
              .field("cancle", Int?.self),
              .field("bookingtype", Int?.self),
            ] }

            var bedrooms: String? { __data["bedrooms"] }
            var personCapacity: Int? { __data["personCapacity"] }
            var cancle: Int? { __data["cancle"] }
            var bookingtype: Int? { __data["bookingtype"] }
          }

          /// Pricing.Result.Rating
          ///
          /// Parent Type: `Ratings`
          struct Rating: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Ratings }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("rating", Double?.self),
            ] }

            var rating: Double? { __data["rating"] }
          }

          /// Pricing.Result.Occupacy
          ///
          /// Parent Type: `Occupacys`
          struct Occupacy: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Occupacys }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("occupacy", Double?.self),
            ] }

            var occupacy: Double? { __data["occupacy"] }
          }
        }

        /// Pricing.CurrentPropertyResult
        ///
        /// Parent Type: `Pricedetail`
        struct CurrentPropertyResult: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Pricedetail }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("distance", Double?.self),
            .field("basePrice", Int?.self),
            .field("score", Double?.self),
            .field("UserAmenities", [UserAmenity?]?.self),
            .field("sefetyAmenities", [SefetyAmenity?]?.self),
            .field("places", [Place?]?.self),
            .field("userspace", [Userspace?]?.self),
            .field("otherdata", [Otherdatum?]?.self),
            .field("rating", [Rating?]?.self),
            .field("occupacy", [Occupacy?]?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var distance: Double? { __data["distance"] }
          var basePrice: Int? { __data["basePrice"] }
          var score: Double? { __data["score"] }
          var userAmenities: [UserAmenity?]? { __data["UserAmenities"] }
          var sefetyAmenities: [SefetyAmenity?]? { __data["sefetyAmenities"] }
          var places: [Place?]? { __data["places"] }
          var userspace: [Userspace?]? { __data["userspace"] }
          var otherdata: [Otherdatum?]? { __data["otherdata"] }
          var rating: [Rating?]? { __data["rating"] }
          var occupacy: [Occupacy?]? { __data["occupacy"] }

          /// Pricing.CurrentPropertyResult.UserAmenity
          ///
          /// Parent Type: `Item`
          struct UserAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.CurrentPropertyResult.SefetyAmenity
          ///
          /// Parent Type: `Item`
          struct SefetyAmenity: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.CurrentPropertyResult.Place
          ///
          /// Parent Type: `Item`
          struct Place: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.CurrentPropertyResult.Userspace
          ///
          /// Parent Type: `Item`
          struct Userspace: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Item }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("itemName", String?.self),
              .field("score", Double?.self),
            ] }

            var itemName: String? { __data["itemName"] }
            var score: Double? { __data["score"] }
          }

          /// Pricing.CurrentPropertyResult.Otherdatum
          ///
          /// Parent Type: `Other`
          struct Otherdatum: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Other }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("bedrooms", String?.self),
              .field("personCapacity", Int?.self),
              .field("cancle", Int?.self),
              .field("bookingtype", Int?.self),
            ] }

            var bedrooms: String? { __data["bedrooms"] }
            var personCapacity: Int? { __data["personCapacity"] }
            var cancle: Int? { __data["cancle"] }
            var bookingtype: Int? { __data["bookingtype"] }
          }

          /// Pricing.CurrentPropertyResult.Rating
          ///
          /// Parent Type: `Ratings`
          struct Rating: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Ratings }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("rating", Double?.self),
            ] }

            var rating: Double? { __data["rating"] }
          }

          /// Pricing.CurrentPropertyResult.Occupacy
          ///
          /// Parent Type: `Occupacys`
          struct Occupacy: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.Occupacys }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("occupacy", Double?.self),
            ] }

            var occupacy: Double? { __data["occupacy"] }
          }
        }
      }
    }
  }

}