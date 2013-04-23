class Report < ActiveRecord::Base
  attr_accessible :title, :reporttext, :reporttype, :reportable_id, :reportable_type

  belongs_to :reportable, :polymorphic => true

  REPORTTYPES = %w[Lagebeschreibung Ortsbeschreibung]
end
