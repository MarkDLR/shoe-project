require_relative './config/environment.rb'
# require 'pry'
ActiveRecord::Base.logger = nil

class CLI

    def initialize
        self.store_selection()
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
            self.brand_selection()
        end
    end

    def brand_selection
        puts ''
        puts "What brand of shoes, are you looking for?"
        @user_choice = gets.chomp()
        @user_brand_choice = Brand.find_by({brand_name: @user_choice})
        @shoe_results = Shoe.where({ store_id: @user_store_selection.id, brand_id: @user_brand_choice.id})
    #"Adidas"
        if !Brand.all.include? @user_brand_choice
        #if @user_brand_choice.length == 0
            puts ''
            puts "Sorry that brand is not available at this moment."
            return self.brand_selection()
        else
            puts ''
            puts "Great"
            return print_shoes()
            #found_shoes = Shoe.where({brand_id: user_brand_choice.id})
        end
    end
    #if found_id = Brand.where({brand_name: user_brand_choice})
    #return Shoe.find_all({brand_id: found_id })
    

    def print_shoes
        #shoes = []
        puts ''
        puts "This are all the shoes we have available"
        # Brand.find_by({brand_name: @user_choice})
        #Shoe.all.each do |shoe|
            #if shoe.store_id == @user_store_selection.id && shoe.brand_id == @user_brand_choice.id
            #if @user_store_selection.id == shoe.store_id && @user_brand_choice.id == shoe.brand_id
             #   shoes << shoe 
                #@user_brand_choice.shoes
            if @shoe_results.length == 0
                puts "There are no shoes of that brand at this location."
                return print_shoes()
            else
                puts "These are all the shoes of that brand this location has."
            end
        #end
        # binding.pry
        p @shoe_results
    end

end

CLI.new()