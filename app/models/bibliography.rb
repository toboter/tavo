class Bibliography < ActiveRecord::Base
  attr_accessible :author, :title, :year

  belongs_to :citation
end
