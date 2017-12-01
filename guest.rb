class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def sufficient_money(fee)
    if fee > @wallet
      return false
    else
      return true
    end
  end

  def remove_fee(fee)
    @wallet -= fee
  end

  def favourite_song_on_playlist(playlist)
    if playlist.any? {|song| song.title == @favourite_song}
      return "Hey! Hey! TUNE!"
    end
    #p playlist
  end

end
