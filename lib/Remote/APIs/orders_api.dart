class OrdersApi {
  static const String getAllOrdersList = """
query getOrders(\$userId:String!){
 userOrders(userId:\$userId){
cart{
    product{
        id
    },
    count
},
coupon{
    title
},
id,
orderNo
createdAt
status
transactionAmount
  }
}

""";

  static const String getSingleOrderDetails = """
    query getOrders(\$id:String!) {
      order(id:\$id){
        cart{
            count
              product{
                  name
                  price
                  discount
                  quantity{
                    value
                  }
              }  
          }
           shippingAddress{
          address
          recipientName
          }
          createdAt
          id
          orderNo
          deliveredAt
          paymentMethod
          status
            tax
            transactionAmount
            shippingCharges  

      }
}
""";
}
