class Reference < ActiveRecord::Base
  attr_accessible :title, :year, :creator_id, :updater_id, :publishing_place, :person_ids, :parent_id, :first_page, 
  				  :last_page, :referencetype, :alternative_author, :volume_number

  stampable
  has_ancestry

  has_many :citations
  has_and_belongs_to_many :people

  validates_presence_of :referencetype, :title

  REFERENCETYPES = %w[Monographie Reihe Sammelwerk Zeitschrift] # ohne Artikel. Dieser wird als hidden_field-value übergeben.

  def self.possible_parents(root, subtree)
    possible_parents = subtree_of(roots.where('name = ?', root))
    if subtree.present?
      possible_parents = possible_parents.where("id not in (?)", subtree)
    end
    possible_parents
  end


  def entry
    people.map(&:fullname).join(", ") + ", " + year.strftime("%Y") + ", " + title
  end
end
