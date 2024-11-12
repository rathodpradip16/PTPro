// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UpdatephotoMutation: GraphQLMutation {
    static let operationName: String = "Updatephoto"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation Updatephoto($listId: Int!, $id: Int!, $photoCategoryId: String!) { Updatephoto(listId: $listId, id: $id, photoCategoryId: $photoCategoryId) { __typename status errorMessage } }"#
      ))

    public var listId: Int
    public var id: Int
    public var photoCategoryId: String

    public init(
      listId: Int,
      id: Int,
      photoCategoryId: String
    ) {
      self.listId = listId
      self.id = id
      self.photoCategoryId = photoCategoryId
    }

    public var __variables: Variables? { [
      "listId": listId,
      "id": id,
      "photoCategoryId": photoCategoryId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("Updatephoto", Updatephoto?.self, arguments: [
          "listId": .variable("listId"),
          "id": .variable("id"),
          "photoCategoryId": .variable("photoCategoryId")
        ]),
      ] }

      var updatephoto: Updatephoto? { __data["Updatephoto"] }

      /// Updatephoto
      ///
      /// Parent Type: `ListPhotosCommon`
      struct Updatephoto: PTProAPI.SelectionSet {
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