class Account < ApplicationRecord
    has_many :notes
    has_many :users
end
