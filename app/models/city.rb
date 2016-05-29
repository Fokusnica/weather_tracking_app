class City < ActiveRecord::Base
  belongs_to :user
  has_many :weathers
end
