class Document < ActiveRecord::Base
  attr_accessible :title, :content, :documenttype, :documentable_id, :documentable_type, :author_id, :creator_id, :updater_id
  stampable
  belongs_to :documentable, :polymorphic => true

  validates_presence_of :documenttype, :content, :documentable_id, :documentable_type

  DOCUMENTTYPES = %w[Lagebeschreibung Ortsbeschreibung]
  PROJECTTYPES = %w[Tagebucheintrag]
end
