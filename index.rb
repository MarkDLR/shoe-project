require_relative './config/environment.rb'
require 'pry'
ActiveRecord::Base.logger = nil

class CLI

    def initialize
        #self.price_of_shoes
        self.browse_by
        #self.store_selection()
    end

    def store_selection
        puts ''
        puts ("What store would you like to buy shoes from?").green.on_black.underline
        @user_location = gets.chomp()
        @user_store_selection = Store.find_by({store_name: @user_location})
        if !Store.all.include? @user_store_selection
            puts ''
            puts ("There are no stores around #{@user_location}, our apologies for the inconvenience").red.on_black
            return self.store_selection()
        else
            puts ''
            puts ("Great! This store has the best shoes!").green
            self.brand_selection_by_store()
        end
    end

    def brand_selection_by_store
        puts ''
        puts ("What brand of shoes are you looking for?").green.on_black.underline
        @user_choice = gets.chomp()
        @user_brand_choice = Brand.find_by({brand_name: @user_choice})
        if Brand.all.include? @user_brand_choice
            puts ''
            # puts ("Great").green
            self.print_shoes()
        # elsif 
        #     puts ''
        #     puts ("Sorry that brand is not available at this moment.").red.on_black
        #     return self.brand_selection_by_store()
        end
    end

    def print_shoes
        puts ''
        @shoe_results = Shoe.where({ store_id: @user_store_selection.id, brand_id: @user_brand_choice.id})
        if @shoe_results.length == 0
            puts ("Sorry, there are no shoes of that brand at this location.").red.on_black
            return self.store_selection()
        else
            puts ("These are all the shoes of that brand this location has.").green.on_black.underline
            @shoe_results.each do |shoe|
                puts ("#{shoe.shoe_name}, $#{shoe.price}").light_blue
            end
        end
    end

    def browse_by_brand
        puts ''
        puts ("What brand of shoes would you like to browse by?").green.on_black.underline
        @user_browse_brands =  gets.chomp()
        @shoe_brand = Brand.find_by({brand_name: @user_browse_brands})
        if Brand.all.include? @shoe_brand
            puts ""
            puts ("Great").green
            self.brand_browse_results()
        else
            puts ""
            puts ("Sorry that brand is not in our database").red
            self.browse_by_brand()
        end

    end

    def brand_browse_results
        @shoe_by_store =  Shoe.where(brand_id: @shoe_brand.id).order({store_id: :desc})
        Store.all.each do |store|
            puts ("#{store.store_name}:").green.on_black.underline
            @shoe_by_store.each do |shoe|
                if shoe.store_id == store.id
                    puts ("#{shoe.shoe_name}, $#{shoe.price}").light_blue
                end
            end
        end
    end

    def price_of_shoes
        puts ''
        puts ("What is your budget?").green.on_black.underline
        @user_budget = gets.chomp()
        @shoe_budget = Shoe.where("price < #{@user_budget.to_i}").order({price: :desc})
        @shoe_budget.each do |shoe|
            puts ("#{shoe.shoe_name}, $#{shoe.price}").light_blue
            #puts shoe.price
        end
    end

    def browse_by_shoe_name
        puts ""
        puts ("What is the name of the shoe you are searching for?").green.on_black.underline
        @user_shoe_name = gets.chomp()
        @user_shoe_choice = Shoe.where({shoe_name: @user_shoe_name})
        # puts @user_shoe_choice
        Store.all.each do |store|
            puts ("#{store.store_name}:").green.on_black.underline
            @user_shoe_choice.each do |shoe|
                if shoe.store_id == store.id 
                    #puts ("#{store.store_name}:").green.on_black.underline
                    puts ("#{shoe.shoe_name}, $#{shoe.price}").light_blue
                end
            end 
        end
    end

    def browse_by
        arr_methods = ["Store Name", "Brand", "Price", "Shoe Name"]
        i = 1
        puts ""
        puts ("Please select a number for browsing options:").green.on_black.underline
        arr_methods.each do | method |
            puts ("#{i}) #{method}").light_blue
            i = i + 1
        end
        @selected_method_number = gets.chomp()
        if @selected_method_number.to_i == 1
            self.store_selection()
        elsif @selected_method_number.to_i == 2
            self.browse_by_brand()
        elsif @selected_method_number.to_i == 3
            self.price_of_shoes()
        elsif @selected_method_number.to_i == 4
            self.browse_by_shoe_name()
        end
    end



end


CLI.new()

#String.color_samples

