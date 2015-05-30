# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  media_type :string
#  latitude   :float
#  longitude  :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :user
end
