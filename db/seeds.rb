Store.destroy_all
Brand.destroy_all
Shoe.destroy_all

galleria = Store.create(store_name: "Galleria", store_location: "Houston") #12
Store.create(store_name: "Memorial City", store_location: "Houston")#13
Store.create(store_name: "NYC Mall", store_location: "New York") #14
Store.create(store_name: "Walmart", store_location: "Houston")#15
Store.create(store_name: "Academy", store_location: "Houston") #16

adidas = Brand.create(brand_name: "Adidas") #26
Brand.create(brand_name: "Nike") #27
Brand.create(brand_name: "Crocs") #28
Brand.create(brand_name: "Jordans")#29
Brand.create(brand_name: "Shaqs")#30
Brand.create(brand_name: "Converse")#31
Brand.create(brand_name: "Puma") #32
Brand.create(brand_name: "Reebok")#33
Brand.create(brand_name: "Vans")#34
Brand.create(brand_name: "Under Armour")#35
Brand.create(brand_name: "New Balance")#36
Brand.create(brand_name: "Skechers") #37


5.times do 
    Shoe.create({
        shoe_name: ["Slippers", "Cutties"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Crocs").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Adidas Ultraboost", "Adidas Rangers"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Adidas").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Nike Joggers", "Nike Essentials"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Nike").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Jordans Superstar", "Jordans Elite"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Jordans").id,
        store_id: Store.all.sample.id
    })
end
5.times do
    Shoe.create({
    shoe_name: ["NMD", "Impossibles"].sample,
    shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
    size: rand(5..12),
    price: rand(100..200),
    brand_id: Brand.all.find_by(brand_name: "Shaqs").id,
    store_id: Store.all.sample.id
})
end

5.times do 
    Shoe.create({
        shoe_name: ["Winter Boots", "Classics"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Converse").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Lite Racer", "Extra Racer"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Puma").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Crossfit Trainers", "Weight Lifters"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Reebok").id,
        store_id: Store.all.sample.id
    })
end
5.times do 
    Shoe.create({
        shoe_name: ["Skaters", "Romans"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Vans").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Copa 2020", "Wolfs"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Under Armour").id,
        store_id: Store.all.sample.id
    })
end
5.times do 
    Shoe.create({
        shoe_name: ["Skeletons", "Total Sketch"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "Skechers").id,
        store_id: Store.all.sample.id
    })
end

5.times do 
    Shoe.create({
        shoe_name: ["Heros", "Complete Balance"].sample,
        shoe_color: ['Purple', 'Grey', 'Black', 'Blue', 'Yellow', 'Pink', 'White', 'Brown', 'Red'].sample,
        size: rand(5..12),
        price: rand(100..200),
        brand_id: Brand.all.find_by(brand_name: "New Balance").id,
        store_id: Store.all.sample.id
    })
end
