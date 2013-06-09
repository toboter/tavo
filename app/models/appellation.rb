class Appellation < ActiveRecord::Base
  attr_accessible :site_id, :content, :period, :creator_id, :updater_id
  stampable
  belongs_to :site

  validates_presence_of :site_id, :content, :period

  # Es dürfen offenbar keine '-' in einer Hash verwendet werden.
  # PERIODTYPES = %w[Islamisch Achämenidisch Neuassyrisch Neubabylonisch Mittel-Assyrisch Kassitisch Altbabylonisch Alt-Assyrisch]

  def appellation_list
  	"#{content} (#{period})"
  end
end
