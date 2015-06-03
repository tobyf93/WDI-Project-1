# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  admin           :boolean          default(FALSE)
#  avatar          :string
#  use_geoloc      :boolean          default(TRUE)
#  latitude        :float
#  longitude       :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true
  validates :username, :uniqueness => { :case_sensitive => false }
  has_many :items
end
