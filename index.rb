require_relative './config/environment.rb'
# require 'pry'
ActiveRecord::Base.logger = nil

class CLI

    def initialize
        #self.price_of_shoes
        self.browse_by
        #self.store_selection()
    end

    def store_selection
        puts ''
        puts "Welcome, please select store"
        @user_location = gets.chomp()
        @user_store_selection = Store.find_by({store_name: @user_location})
        if !Store.all.include? @user_store_selection
            puts ''
            puts "There are no stores around #{@user_location}, our apologies for the inconvenience"
            return self.store_selection()
        else
            puts ''
            puts "Great"
            self.brand_selection_by_store()
        end
    end

    def brand_selection_by_store
        puts ''
        puts "What brand of shoes, are you looking for?"
        @user_choice = gets.chomp()
        @user_brand_choice = Brand.find_by({brand_name: @user_choice})
        @shoe_results = Shoe.where({ store_id: @user_store_selection.id, brand_id: @user_brand_choice.id})
        if !Brand.all.include? @user_brand_choice
            puts ''
            puts "Sorry that brand is not available at this moment."
            return self.brand_selection()
        else
            puts ''
            puts "Great"
            return print_shoes()
            
        end
    end

    def print_shoes
        puts ''
        puts "This are all the shoes we have available"
        if @shoe_results.length == 0
            puts "There are no shoes of that brand at this location."
            return brand_selection()
        else
            puts "These are all the shoes of that brand this location has."
            @shoe_results.each do |shoe|
                puts "#{shoe.shoe_name}, $#{shoe.price}"
            end
        end
    end

    def browse_by_brand
        puts ''
        puts "What brand of shoes would you like to browse by?"
        @user_brand_choice =  gets.chomp()
        @shoe_brand = Brand.find_by({brand_name: @user_brand_choice})
        @shoe_by_store =  Shoe.where(brand_id: @shoe_brand.id).order({store_id: :desc})
        Store.all.each do |store|
            @shoe_by_store.each do |shoe|
                if shoe.store_id == store.id 
                    puts "#{store.store_name}:"
                    puts "#{shoe.shoe_name}, $#{shoe.price}"
                end
            end 
        end

    end

    def price_of_shoes
        puts ''
        puts "What is your budget?"
        @user_budget = gets.chomp()
        @shoe_budget = Shoe.where("price < #{@user_budget.to_i}").order({price: :desc})
        @shoe_budget.each do |shoe|
            puts "#{shoe.shoe_name}, $#{shoe.price}"
            #puts shoe.price
        end
    end

    def browse_by
        arr_methods = ["Store Name", "Brand", "Price", "Shoe Name", "Size"]
        i = 1
        puts ""
        puts "Please select a number for browsing options"
        arr_methods.each do | method |
            puts "#{i}) #{method}"
            i = i + 1
        end
        @selected_method_number = gets.chomp()
        if @selected_method_number.to_i == 1
            self.store_selection()
        elsif @selected_method_number.to_i == 2
            self.browse_by_brand()
        elsif @selected_method_number.to_i == 3
            self.price_of_shoes()
        end
    end



end


CLI.new()