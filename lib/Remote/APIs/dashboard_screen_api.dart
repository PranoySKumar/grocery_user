class DashboardScreenApi {
  static const String loadDataQuery = """
  query LoadDashBoardScreenData{
  discountedProducts: products(options: {limit:6,discountFilter:true}) {
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    discount
  }
  popularProducts: products(options: {limit:6,popularFilter:true}) {
    id
    name
    imageUrl
    quantity{
            totalQuantity
            type
            value
         }
    discount
  }
    categories(limit:8){
    id
    name
    imageUrl
    }
    user{
        id
        userName
        pincode
        profileImageUrl
        location{
          lat
          lng
        }
        coupons{
          id
        }
        favourites{
          id
        }
        shippingAddresses{
          recipientName
          address
          pincode
          landmark
        }
      }
  }
""";
}
