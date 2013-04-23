require 'test_helper'

class CitationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Citation.new.valid?
  end
end
