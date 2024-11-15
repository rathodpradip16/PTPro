// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetdynamicbedtypelistQuery: GraphQLQuery {
    static let operationName: String = "getdynamicbedtypelist"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getdynamicbedtypelist { getdynamicbedtypelist { __typename results { __typename id typeId itemName } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getdynamicbedtypelist", Getdynamicbedtypelist?.self),
      ] }

      var getdynamicbedtypelist: Getdynamicbedtypelist? { __data["getdynamicbedtypelist"] }

      /// Getdynamicbedtypelist
      ///
      /// Parent Type: `Getdynamicbedtypelist`
      struct Getdynamicbedtypelist: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Getdynamicbedtypelist }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// Getdynamicbedtypelist.Result
        ///
        /// Parent Type: `Getdynamicbedtype`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.Getdynamicbedtype }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("typeId", Int?.self),
            .field("itemName", String?.self),
          ] }

          var id: Int? { __data["id"] }
          var typeId: Int? { __data["typeId"] }
          var itemName: String? { __data["itemName"] }
        }
      }
    }
  }

}
