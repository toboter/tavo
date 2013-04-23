class Appellation < ActiveRecord::Base
  attr_accessible :site_id, :content, :period
  belongs_to :site

  def appellation_list
  	"#{content} (#{period})"
  end
end
