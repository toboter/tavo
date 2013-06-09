class PeopleReferences < ActiveRecord::Migration
def self.up
  create_table :people_references, :id => false do |t|
    t.integer :person_id
    t.integer :reference_id
  end
end

def self.down
  drop_table :people_references
end
end
