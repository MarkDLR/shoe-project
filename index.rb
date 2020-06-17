require_relative './config/environment.rb'
require 'pry'
ActiveRecord::Base.logger = nil

class CLI

    def initialize
        self.user_welcome
    end

    def user_welcome
        puts ''
        puts "Welcome to Shoe Dog! Please select a number:".green.on_black.underline
        puts "1) Login".light_blue
        puts "2) SignUp".light_blue
        puts "3) Skip Login/SignUp".light_blue
        user_welcome_answer = gets.chomp()
        user_anwer = user_welcome_answer.to_i
        if user_welcome_answer == "exit" || user_welcome_answer == "Exit"
            self.exit()
        elsif user_welcome_answer == "return" || user_welcome_answer == "Return"
            self.user_welcome()
        elsif user_anwer == 1
            self.user_login()
        elsif user_anwer == 2
            self.user_sign_up()
        elsif user_anwer == 3
            self.browse_by()
        else 
            puts ''
            puts "Sorry, I didn't understand. Please try again.".red.on_black
            self.user_welcome()
        end
    end

    def exit
        puts "Thank you for shopping with us! Please come again".green.on_black.underline
    end

    def user_sign_up
        puts ''
        puts "Please create a username to sign up".green
        @current_username = gets.chomp() 
        @username = User.all.find_by(user_name: @current_username)
        if @current_username == "exit" || @current_username == "Exit"
            self.exit()
        elsif User.all.include? @username
            puts "Sorry, this username already exist".red.on_black
            self.user_sign_up()
        else
            User.create(user_name: @current_username)
            puts "Thanks for creating an account with us! Now let's buy some shoes!".green.on_black.underline
            puts ''
            self.browse_by()
        end
    end
    
    def user_login
        puts ''
        puts "Please provide your username".green.on_black.underline
        @current_username = gets.chomp()
        if @current_username == "exit" || @current_username == "Exit"
            self.exit()
        elsif User.find_by(user_name: @current_username)
            self.browse_by()
        else
            puts ""
            puts "Sorry, that username is not in our database".red.on_black
            self.user_login()
        end
    end

    def store_selection
        puts ''
        puts ("What store would you like to buy shoes from?").green.on_black.underline
        @user_location = gets.chomp()
        @user_store_selection = Store.find_by({store_name: @user_location.capitalize})
        if @user_location == "exit" || @user_location == "Exit"
            self.exit()
        elsif @user_location == "return" || @user_location == "Return"
            self.user_welcome()
        elsif !Store.all.include? @user_store_selection
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
        @user_brand_choice = Brand.find_by({brand_name: @user_choice.capitalize})
        if @user_choice == "exit" || @user_choice == "Exit"
            self.exit()
        elsif @user_choice == "return" || @user_choice == "Return"
            self.user_welcome()
        elsif Brand.all.include? @user_brand_choice
            puts ''
            self.print_shoes()
        else
            puts ""
            puts "Sorry, I didn't understand that.".red.on_black
            self.brand_selection_by_store()
        end
    end

    def print_shoes
        puts ''
        i = 1
        @shoe_results = Shoe.where({ store_id: @user_store_selection.id, brand_id: @user_brand_choice.id})
        if @shoe_results.length == 0
            puts ("Sorry, there are no shoes of that brand at this location.").red.on_black
            return self.store_selection()
        else
            puts ("These are all the shoes of that brand this location has:").green.on_black.underline
            @shoe_results.each do |shoe|
                puts ("#{i}) #{shoe.shoe_name}, size: #{shoe.size}, color: #{shoe.shoe_color}, price: $#{shoe.price}").light_blue
                i = i + 1
            end
        end
    end

    def browse_by_brand
        puts ''
        puts ("What brand of shoes would you like to browse?").green.on_black.underline
        @user_browse_brands =  gets.chomp()
        @shoe_brand = Brand.find_by({brand_name: @user_browse_brands.capitalize})
        if @user_browse_brands == "exit" || @user_browse_brands == "Exit"
            self.exit() 
        elsif @user_browse_brands == "return" || @user_browse_brands == "Return"
            self.user_welcome()
        elsif Brand.all.include? @shoe_brand
            puts ""
            puts ("Great, this brand has amazing shoes!").green
            self.brand_browse_results()
        elsif
            puts ""
            puts ("Sorry that brand is not in our database").red.on_black
            self.browse_by_brand()
        
        end

    end

    def brand_browse_results
        @user_choice =  Shoe.where(brand_id: @shoe_brand.id).order({store_id: :desc})
        self.store_names_method()
    end

    def price_of_shoes
        puts ''
        puts ("What is your budget?").green.on_black.underline
        @user_budget = gets.chomp()
        @user_choice = Shoe.where("price <= #{@user_budget.to_i}").order({price: :desc})
        if @user_budget == "exit" || @user_budget == "Exit"
            self.exit()
        elsif @user_budget == "return" || @user_budget == "Return"
            self.user_welcome()
        elsif @user_choice.length == 0
            puts ""
            puts ("Sorry we don't have any shoes in that price range").red.on_black
            self.price_of_shoes()
        elsif
            self.store_names_method()
        end
    end

    def browse_by_shoe_name
        puts ""
        puts ("What is the name of the shoe you are searching for?").green.on_black.underline
        @user_shoe_name = gets.chomp()
        if @user_shoe_name == "exit" || @user_shoe_name == "Exit"
            self.exit() 
        elsif @user_shoe_name == "return" || @user_shoe_name == "Return"
            self.user_welcome()
        else
            @user_choice = Shoe.where({shoe_name: @user_shoe_name})
            if @user_choice.length == 0
                puts ''
                puts "Sorry, that shoe is not in out database, plase try again"
                puts ""
                self.browse_by_shoe_name()
            else 
                self.store_names_method()
            end
        end
    end

    def store_names_method
        puts ""
        store_arr = []
        Store.all.each do |store|
            @user_choice.each do |shoe|
                if shoe.store_id == store.id
                    store_arr << store
                end
            end
        end
        @store_names = store_arr.uniq
        self.end_results()

    end
    
    def end_results
        i = 1
        @store_names.each do |store| 
            puts ""   
            puts ("#{store.store_name}:").green.on_black.underline
            puts ""
            @user_choice.each do |shoe|
                if shoe.store_id == store.id 
                    puts ("#{i}) #{shoe.shoe_name}, size: #{shoe.size}, color: #{shoe.shoe_color}, price: $#{shoe.price}").light_blue
                    i = i + 1
                end
            end
        end
        self.buying_shoe()
    end

    def buying_shoe
        puts ""
        puts "Would you like to buy one of these shoes, if so please choose number:".green.on_black.underline
        selected_shoe_number = gets.chomp()
        @selected_shoe = @user_choice[selected_shoe_number.to_i-1]
        user_that_will_buy = User.find_by(user_name: @current_username)
        if selected_shoe_number == "exit" || selected_shoe_number == "Exit"
            self.exit()
        elsif selected_shoe_number == "return" || selected_shoe_number == "Return"
            self.user_welcome()
        elsif @current_username == nil
            self.late_login_or_signup()
        else
            @selected_shoe.user_id = user_that_will_buy.id
            @selected_shoe.store_id = nil
            @selected_shoe.save
            puts "Thank you for purchasing!".green
            self.exit()
        end
    end

    def late_login_or_signup
        puts ''
        puts "1) Login".light_blue
        puts "2) Signup".light_blue
        choice = gets.chomp()
        if choice == "exit" || choice == "Exit"
            self.exit()
        elsif choice.to_i == 1
            puts ''
            self.late_login()
        elsif choice.to_i == 2
            puts ''
            self.late_signup
        elsif choice == "return" || choice == "Return"
            self.user_welcome
        end
    end

    def late_login
        puts ''
        puts "Please provide your username".green.on_black.underline
        @current_username = gets.chomp()
        if @current_username == "exit" || @current_username == "Exit"
            self.exit()
        elsif @current_username == "return" || @current_username == "Return"
            self.user_welcome()
        elsif User.find_by(user_name: @current_username)
            puts ''
            self.end_results()
        else
            puts ''
            puts "Sorry, that username is not in our database".red.on_black
            self.late_login_sigup()
        end
    end

    def late_signup
        puts ''
        puts "Please create a username to sign up".green.on_black.underline
        @current_username = gets.chomp() 
        @username = User.all.find_by(user_name: @current_username)
        if @current_username == "exit" || @current_username == "Exit"
            self.exit()
        elsif @current_username == "return" || @current_username == "Return"
            self.user_welcome()
        elsif User.all.include? @username
            puts ''
            puts "Sorry, this username already exist".red.on_black
            self.user_sign_up()
        else
            User.create(user_name: @current_username)
            puts ''
            puts "Thanks for creating an account with us! Now let's buy shoes!".green.on_black.underline
            self.end_results()
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
        if @selected_method_number == "exit" || @user_shoe_name == "Exit"
            self.exit()
        elsif @selected_method_number.to_i == 1
            self.store_selection()
        elsif @selected_method_number.to_i == 2
            self.browse_by_brand()
        elsif @selected_method_number.to_i == 3
            self.price_of_shoes()
        elsif @selected_method_number.to_i == 4
            self.browse_by_shoe_name()
        elsif @selected_method_number == "return" || @selected_method_number == "Return"
            self.user_welcome()
        else
            puts "Sorry, I didn't understand that.".red.on_black
            self.browse_by()
        end
    end
    
end





CLI.new()


