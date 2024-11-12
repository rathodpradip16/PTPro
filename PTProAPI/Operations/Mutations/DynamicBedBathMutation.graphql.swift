// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class DynamicBedBathMutation: GraphQLMutation {
    static let operationName: String = "dynamicBedBath"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation dynamicBedBath($userId: String!, $listId: Int!, $bathroomTypes: String, $bedroomTypes: String) { dynamicBedBath( userId: $userId listId: $listId bathroomTypes: $bathroomTypes bedroomTypes: $bedroomTypes ) { __typename status errorMessage userId listId bathroomTypes { __typename isBathroom bathroomname bathroomId bathroomtype bathroomamenities } bedroomTypes { __typename isbedroom bedroomname bedroomId bedType { __typename bedCount bedname bedId bedtype bedsize } } } }"#
      ))

    public var userId: String
    public var listId: Int
    public var bathroomTypes: GraphQLNullable<String>
    public var bedroomTypes: GraphQLNullable<String>

    public init(
      userId: String,
      listId: Int,
      bathroomTypes: GraphQLNullable<String>,
      bedroomTypes: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.listId = listId
      self.bathroomTypes = bathroomTypes
      self.bedroomTypes = bedroomTypes
    }

    public var __variables: Variables? { [
      "userId": userId,
      "listId": listId,
      "bathroomTypes": bathroomTypes,
      "bedroomTypes": bedroomTypes
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("dynamicBedBath", DynamicBedBath?.self, arguments: [
          "userId": .variable("userId"),
          "listId": .variable("listId"),
          "bathroomTypes": .variable("bathroomTypes"),
          "bedroomTypes": .variable("bedroomTypes")
        ]),
      ] }

      var dynamicBedBath: DynamicBedBath? { __data["dynamicBedBath"] }

      /// DynamicBedBath
      ///
      /// Parent Type: `Bathroom`
      struct DynamicBedBath: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Bathroom }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("userId", String?.self),
          .field("listId", Int?.self),
          .field("bathroomTypes", [BathroomType?]?.self),
          .field("bedroomTypes", [BedroomType?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var userId: String? { __data["userId"] }
        var listId: Int? { __data["listId"] }
        var bathroomTypes: [BathroomType?]? { __data["bathroomTypes"] }
        var bedroomTypes: [BedroomType?]? { __data["bedroomTypes"] }

        /// DynamicBedBath.BathroomType
        ///
        /// Parent Type: `BathroomTypeType1`
        struct BathroomType: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.BathroomTypeType1 }
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

        /// DynamicBedBath.BedroomType
        ///
        /// Parent Type: `BedroomTypeInput1`
        struct BedroomType: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.BedroomTypeInput1 }
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

          /// DynamicBedBath.BedroomType.BedType
          ///
          /// Parent Type: `BedTypeInput1`
          struct BedType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.BedTypeInput1 }
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