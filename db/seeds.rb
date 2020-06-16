Store.destroy_all
Brand.destroy_all
Shoe.destroy_all

galleria = Store.create(store_name: "Galleria", store_location: "Houston") #12
Store.create(store_name: "Memorial Ctiy", store_location: "Houston")
Store.create(store_name: "NY Mall", store_location: "New York") #14
Store.create(store_name: "Walmart", store_location: "Houston")
Store.create(store_name: "Academy", store_location: "Houston") #16

adidas = Brand.create(brand_name: "Adidas") #26
Brand.create(brand_name: "Nike") #27
Brand.create(brand_name: "Crocs") #28
Brand.create(brand_name: "Jordans")
Brand.create(brand_name: "Shaqs")
Brand.create(brand_name: "converse")
Brand.create(brand_name: "Puma") #32
Brand.create(brand_name: "Reebok")
Brand.create(brand_name: "Vans")
Brand.create(brand_name: "Under Armour")
Brand.create(brand_name: "New Balance")
Brand.create(brand_name: "Skechers") #37

light_race = Shoe.create(shoe_name:"light racer", shoe_color: "red", size: 11, price: 60, brand_id: 30, store_id: 15)

20.times do 
    Shoe.create({
        shoe_name: ['Ultraboost', 'Winter Boots', 'light race', 'NMD', 'Superstar', 'Night Jogger', 'Copa 2020'].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.sample.id,
        store_id: Store.all.sample.id
    })
end