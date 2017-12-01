require("minitest/autorun")
require("minitest/rg")

require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Yoshimi Battles The Pink Robots Part.1", "The Flaming Lips")
  end

  def test_song_has_title
    assert_equal("Yoshimi Battles The Pink Robots Part.1", @song1.title())
  end

  def test_song_has_artist
    assert_equal("The Flaming Lips", @song1.artist())
  end

end
