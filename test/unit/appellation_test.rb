require 'test_helper'

class AppellationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Appellation.new.valid?
  end
end
