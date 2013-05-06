class Report < ActiveRecord::Base
  attr_accessible :title, :reporttext, :reporttype, :reportable_id, :reportable_type

  belongs_to :reportable, :polymorphic => true

  validates_presence_of :reporttype, :reporttext, :reportable_id, :reportable_type

  REPORTTYPES = %w[Lagebeschreibung Ortsbeschreibung]
  PROJECTTYPES = %w[Tagebucheintrag]
end
