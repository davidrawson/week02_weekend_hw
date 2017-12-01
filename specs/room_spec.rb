require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new("The Green Room", 3, 3.50)
    @guest1 = Guest.new("Yoshimi Smith", 10.0, "Yoshimi Battles The Pink Robots Part.1")
    @guest2 = Guest.new("Elvis Jones", 3.0, "Suspicious Minds")
    @guest3 = Guest.new("Denis Taylor", 100.0, "Denis")
    @guest4 = Guest.new("XxxxXxxx", 50.0, "Songsongsong")
    @song1 = Song.new("Yoshimi Battles The Pink Robots Part.1", "The Flaming Lips")
    @song2 = Song.new("Denis", "Blondie")
    @song3 = Song.new("Suspicious Minds", "Elvis Presley")

  end

  def test_room_has_name
    assert_equal("The Green Room", @room1.name())
  end

  def test_room_has_capacity
    assert_equal(3, @room1.capacity())
  end

  def test_add_guest_to_room__not_full__has_entry_fee
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.guest_list.count())
  end

  def test_add_guest_to_room__full__has_entry_fee
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    @room1.add_guest(@guest3)
    assert_equal(3, @room1.guest_list.count())
  end

  def test_add_guest_to_room__not_full__no_entry_fee
    @room1.add_guest(@guest2)
    assert_equal(0, @room1.guest_list.count())
  end

  # This is a duplicate test - also in guest_spec
  # def test_add_guest_to_room__favourite_tune
  #   @room1.add_to_playlist(@song1)
  #   @room1.add_to_playlist(@song3)
  #   @room1.add_to_playlist(@song2)
  #   @room1.add_guest(@guest3)
  #   assert_equal("Hey! Hey! TUNE!", @guest3.favourite_song_on_playlist(@room1.playlist))
  # end

  def test_entry_fee_paid
    @room1.add_guest(@guest1)
    assert_equal(6.5, @guest1.wallet())
  end

  def test_fee_received__entry_fee
    @room1.add_guest(@guest1)
    assert_equal(53.5, @room1.till_amount())
  end

  def test_remove_guest_from_room
    @room1.add_guest(@guest1)
    @room1.remove_guest(@guest1)
    assert_equal(0, @room1.guest_list.count())
  end

  def test_room_is_full__not_full
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest1)
    assert_equal(false, @room1.is_full?())
  end

  def test_room_is_full__full
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    assert_equal(true, @room1.is_full?())
  end

  def test_add_song_to_playlist
    @room1.add_to_playlist(@song1)
    assert_equal(1, @room1.playlist.count())
  end

end
