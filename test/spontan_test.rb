require 'test_helper'

class SpontanTest < ActiveSupport::TestCase
  test "has effects" do
    u = User.new(name: 'bob')
    
    realized_effects = u.spontan_effects

    assert_includes realized_effects, :change_name
    assert_equal 'alice', u.name
  end
end
