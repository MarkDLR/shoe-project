class User < ActiveRecord::Base
    has_many(:shoes)
    has_many(:stores, through: :shoes)
    has_many(:brands, through: :shoes)
end

def user_welcome 
    puts ''
    puts "Welcome to Shoe Dog! Do you have an account with us?"
    @user_welcome_answer = gets.chomp()
    if @user_welcome_answer.capitalize == "Yes"
        self.user_login
    else
        self.user_sign_up
    end

end
def user_sign_up
    puts ''
    puts "Please create a username to sign up."
    @current_username = gets.chomp() 
    if User.all.include? @current_username
        puts "Sorry, this username already exist"
    else
        User.create(user_name: @current_username)
        self.browse_by
    end
end

def user_login
    puts ''
    puts "Please provide your username"
    @current_username = gets.chomp()
    if User.all.include? @current_username
        self.browse_by
    else 
        puts ''
        puts "Sorry, that username is not in our datebase"
        self.user_login
    end
end

def selecting_shoe
    # i = 1
    # puts ""
    # puts "Please Select a Flight Number:"
    # @flight_results.each do | flight |
    #     puts "#{i}) Departs #{flight.departure_city} at #{flight.departure_time}, arrives at #{flight.arrival_city} #{flight.arrival_time}"
    #     i = i + 1
    # end
    # selected_flight_number = gets.chomp()
    # @selected_flight = @flight_results[selected_flight_number.to_i-1]
    # self.display_available_tickets()
    selected_shoe_number = gets.chomp()
    @selected_shoe = @user_choice[selected_shoe_number.to_i-1]
    User.all.each do |user|
        if user.user_name == @current_username
            @selected_shoe.user_id = user.id
            @selected_shoe.store_id = nil
        end
    end

end

def user_shoes
    puts ''
    puts "These are all your shoes:"
    User.all.each do |user|
        if user.user_name == @current_username
            @current_user = user
        end
    end
    Shoes.all.each do |shoe|
        if shoe.user_id == @current
        end
    end
end

class CreateStoreTable < ActiveRecord::Migration[5.2]
  
    def change 
      create_table :user do |table|
        table.string(:user_name)
      end
    end
    
end