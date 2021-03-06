class Room

  attr_reader :name, :capacity, :guest_list , :playlist, :entry_fee, :till_amount

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @guest_list = []
    @playlist = []
    @entry_fee = entry_fee
    @till_amount = 50.00
  end

  def add_guest(guest)
    return if is_full?
    return if guest.sufficient_money?(@entry_fee) == false
    @guest_list.push(guest)
    guest.remove_fee(@entry_fee)
    @till_amount += @entry_fee
    guest.favourite_song_on_playlist(@playlist)
  end

  def remove_guest(guest)
    @guest_list.delete(guest)
  end

  def is_full?()
    return true if @guest_list.count >= @capacity
    return false if @guest_list.count < @capacity
  end

  def add_to_playlist(song)
    @playlist.push(song)
  end

end
