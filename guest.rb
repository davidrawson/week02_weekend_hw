class Guest

  attr_reader :name, :wallet, :favourite_song, :drink_tokens
  attr_writer :drink_tokens

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @drink_tokens = 0
  end

  def sufficient_money?(fee)
    return false if fee > @wallet
    return true if fee <= @wallet
  end

  def remove_fee(fee)
    @wallet -= fee
  end

  def favourite_song_on_playlist(playlist)
    if playlist.any? {|song| song.title == @favourite_song}
      return "Hey! Hey! TUNE!"
    end
  end

  def sings_a_song(song)
    @drink_tokens += 1
    p song.lyric
    return song.lyric
  end

end
