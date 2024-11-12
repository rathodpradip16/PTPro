// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetdynamicbedbathQuery: GraphQLQuery {
    static let operationName: String = "getdynamicbedbath"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getdynamicbedbath($userId: String, $listId: Int) { getdynamicbedbath(userId: $userId, listId: $listId) { __typename status errorMessage results { __typename userId listId bathroomTypes { __typename isBathroom bathroomname bathroomId bathroomtype bathroomamenities } bedroomTypes { __typename isbedroom bedroomname bedroomId bedType { __typename bedCount bedname bedId bedtype bedsize } } } } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var listId: GraphQLNullable<Int>

    public init(
      userId: GraphQLNullable<String>,
      listId: GraphQLNullable<Int>
    ) {
      self.userId = userId
      self.listId = listId
    }

    public var __variables: Variables? { [
      "userId": userId,
      "listId": listId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getdynamicbedbath", Getdynamicbedbath?.self, arguments: [
          "userId": .variable("userId"),
          "listId": .variable("listId")
        ]),
      ] }

      var getdynamicbedbath: Getdynamicbedbath? { __data["getdynamicbedbath"] }

      /// Getdynamicbedbath
      ///
      /// Parent Type: `GetDynamicBedBathType`
      struct Getdynamicbedbath: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetDynamicBedBathType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// Getdynamicbedbath.Results
        ///
        /// Parent Type: `ResultsType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ResultsType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("listId", Int?.self),
            .field("bathroomTypes", [BathroomType?]?.self),
            .field("bedroomTypes", [BedroomType?]?.self),
          ] }

          var userId: String? { __data["userId"] }
          var listId: Int? { __data["listId"] }
          var bathroomTypes: [BathroomType?]? { __data["bathroomTypes"] }
          var bedroomTypes: [BedroomType?]? { __data["bedroomTypes"] }

          /// Getdynamicbedbath.Results.BathroomType
          ///
          /// Parent Type: `BathroomdataType`
          struct BathroomType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.BathroomdataType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("isBathroom", Bool?.self),
              .field("bathroomname", String?.self),
              .field("bathroomId", String?.self),
              .field("bathroomtype", String?.self),
              .field("bathroomamenities", String?.self),
            ] }

            var isBathroom: Bool? { __data["isBathroom"] }
            var bathroomname: String? { __data["bathroomname"] }
            var bathroomId: String? { __data["bathroomId"] }
            var bathroomtype: String? { __data["bathroomtype"] }
            var bathroomamenities: String? { __data["bathroomamenities"] }
          }

          /// Getdynamicbedbath.Results.BedroomType
          ///
          /// Parent Type: `BedroomdataType`
          struct BedroomType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.BedroomdataType }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("isbedroom", Bool?.self),
              .field("bedroomname", String?.self),
              .field("bedroomId", String?.self),
              .field("bedType", [BedType?]?.self),
            ] }

            var isbedroom: Bool? { __data["isbedroom"] }
            var bedroomname: String? { __data["bedroomname"] }
            var bedroomId: String? { __data["bedroomId"] }
            var bedType: [BedType?]? { __data["bedType"] }

            /// Getdynamicbedbath.Results.BedroomType.BedType
            ///
            /// Parent Type: `BeddataType`
            struct BedType: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.BeddataType }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("bedCount", String?.self),
                .field("bedname", String?.self),
                .field("bedId", String?.self),
                .field("bedtype", String?.self),
                .field("bedsize", String?.self),
              ] }

              var bedCount: String? { __data["bedCount"] }
              var bedname: String? { __data["bedname"] }
              var bedId: String? { __data["bedId"] }
              var bedtype: String? { __data["bedtype"] }
              var bedsize: String? { __data["bedsize"] }
            }
          }
        }
      }
    }
  }

}