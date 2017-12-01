require("minitest/autorun")
require("minitest/rg")

require_relative("../bar")
require_relative("../guest")
require_relative("../song")

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new
    @guest1 = Guest.new("Yoshimi", 10.0, "Yoshimi Battles The Pink Robots Part.1")
    @song3 = Song.new("Suspicious Minds", "Elvis Presley", "Because I love you too much, baby")
  end

  def test_buy_drink__no_tokens
    @bar.buy_drink(@guest1)
    assert_equal(55.0, @bar.bar_till)
  end

  def test_buy_drink__with_tokens
    @guest1.sings_a_song(@song3)
    @bar.buy_drink(@guest1)
    assert_equal(52.50, @bar.bar_till)
  end

end