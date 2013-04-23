require 'test_helper'

class ImagetagTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Imagetag.new.valid?
  end
end
