Store.destroy_all
Brand.destroy_all


galleria = Store.create(store_name: "Galleria", store_location: "Houston")



adidas = Brand.create(brand_name: "Adidas")

Shoe.create(shoe_name:"light racer", shoe_color: "red", size: 11, price: 60, brand_id: 1, store_id: 1)