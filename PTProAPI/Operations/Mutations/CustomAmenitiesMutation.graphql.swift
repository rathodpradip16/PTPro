// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CustomAmenitiesMutation: GraphQLMutation {
    static let operationName: String = "customAmenities"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation customAmenities($listId: Int, $itemName: String) { customAmenities(listId: $listId, itemName: $itemName) { __typename status errorMessage } }"#
      ))

    public var listId: GraphQLNullable<Int>
    public var itemName: GraphQLNullable<String>

    public init(
      listId: GraphQLNullable<Int>,
      itemName: GraphQLNullable<String>
    ) {
      self.listId = listId
      self.itemName = itemName
    }

    public var __variables: Variables? { [
      "listId": listId,
      "itemName": itemName
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("customAmenities", CustomAmenities?.self, arguments: [
          "listId": .variable("listId"),
          "itemName": .variable("itemName")
        ]),
      ] }

      var customAmenities: CustomAmenities? { __data["customAmenities"] }

      /// CustomAmenities
      ///
      /// Parent Type: `CustomAmenitiesType`
      struct CustomAmenities: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CustomAmenitiesType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", String?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: String? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}