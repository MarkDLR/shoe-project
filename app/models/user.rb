class User < ActiveRecord::Base
    has_many(:shoes)
    has_many(:stores, through: :shoes)
    has_many(:brands, through: :shoes)
end