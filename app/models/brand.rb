class Brand < ActiveRecord::Base
    has_many(:shoes)
    has_many(:stores, through: :shoes)
    has_many(:users, through: :shoes)
end