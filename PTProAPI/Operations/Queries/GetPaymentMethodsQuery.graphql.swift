// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetPaymentMethodsQuery: GraphQLQuery {
    static let operationName: String = "getPaymentMethods"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getPaymentMethods { getPaymentMethods { __typename results { __typename id name processedIn fees currency details isEnable paymentType } status errorMessage } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getPaymentMethods", GetPaymentMethods?.self),
      ] }

      var getPaymentMethods: GetPaymentMethods? { __data["getPaymentMethods"] }

      /// GetPaymentMethods
      ///
      /// Parent Type: `GetPaymentType`
      struct GetPaymentMethods: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPaymentType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", [Result?]?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: [Result?]? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetPaymentMethods.Result
        ///
        /// Parent Type: `PaymentMethods`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.PaymentMethods }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("name", String?.self),
            .field("processedIn", String?.self),
            .field("fees", String?.self),
            .field("currency", String?.self),
            .field("details", String?.self),
            .field("isEnable", Bool?.self),
            .field("paymentType", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var name: String? { __data["name"] }
          var processedIn: String? { __data["processedIn"] }
          var fees: String? { __data["fees"] }
          var currency: String? { __data["currency"] }
          var details: String? { __data["details"] }
          var isEnable: Bool? { __data["isEnable"] }
          var paymentType: Int? { __data["paymentType"] }
        }
      }
    }
  }

}