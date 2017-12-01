equire("minitest/autorun")
require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Jarrod", 10.0, 28, 0)
  end

  def test_guest_has_name
    assert_equal("Jarrod", @guest.name())
  end

  def test_guest_has_money
    assert_equal(10.0, @guest.wallet())
  end

end
