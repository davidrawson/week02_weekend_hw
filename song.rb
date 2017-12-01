class Song

  attr_reader :title, :artist, :lyric

  def initialize(title, artist, lyric)
    @title = title
    @artist = artist
    @lyric = lyric
  end

end
