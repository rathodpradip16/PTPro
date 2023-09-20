// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class RemoveListPhotosMutation: GraphQLMutation {
    static let operationName: String = "RemoveListPhotos"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation RemoveListPhotos($listId: Int!, $name: String) { RemoveListPhotos(listId: $listId, name: $name) { __typename status errorMessage } }"#
      ))

    public var listId: Int
    public var name: GraphQLNullable<String>

    public init(
      listId: Int,
      name: GraphQLNullable<String>
    ) {
      self.listId = listId
      self.name = name
    }

    public var __variables: Variables? { [
      "listId": listId,
      "name": name
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("RemoveListPhotos", RemoveListPhotos?.self, arguments: [
          "listId": .variable("listId"),
          "name": .variable("name")
        ]),
      ] }

      var removeListPhotos: RemoveListPhotos? { __data["RemoveListPhotos"] }

      /// RemoveListPhotos
      ///
      /// Parent Type: `ListPhotosCommon`
      struct RemoveListPhotos: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}