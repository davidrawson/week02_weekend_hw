require("minitest/autorun")
require("minitest/rg")

require_relative("../guest")
require_relative("../room")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Yoshimi", 10.0, "Yoshimi Battles The Pink Robots Part.1")
  end

  def test_guest_has_name
    assert_equal("Yoshimi", @guest1.name())
  end

  def test_guest_has_money
    assert_equal(10.0, @guest1.wallet())
  end

  def test_guest_sufficient_money__enough_money
    assert_equal(true, @guest1.sufficient_money(9.99))
  end

  def test_guest_sufficient_money__enough_money
    assert_equal(true, @guest1.sufficient_money(10.0))
  end

  def test_guest_sufficient_money__not_enough_money
    assert_equal(false, @guest1.sufficient_money(10.01))
  end

  def test_has_favourite_song
    assert_equal("Yoshimi Battles The Pink Robots Part.1", @guest1.favourite_song())
  end

  def test_remove_fee
    @guest1.remove_fee(3.50)
    assert_equal(6.5, @guest1.wallet())
  end
end
