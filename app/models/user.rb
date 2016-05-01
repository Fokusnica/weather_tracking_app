class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :setting
  has_one :city, through: :setting
end
