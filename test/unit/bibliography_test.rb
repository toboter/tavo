require 'test_helper'

class BibliographyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bibliography.new.valid?
  end
end
