class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre 
  has_many :notes 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil 
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil 
  end

  def song_notes=(array)
    array.each do |text|
      note = Note.create(content: text)
      self.notes << note 
    end
  end

end
