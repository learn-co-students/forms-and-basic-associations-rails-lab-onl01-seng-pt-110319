class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name 
    # self.artist ? self.artist.name : nil
    artist.try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
end

def genre_name
    # self.genre ? self.genre.name : nil
    genre.try(:name)
end

def note_contents=(content) 
    content.each do |content|
        if !content.empty?
        self.notes << Note.find_or_create_by(content: content)
        end
    end
end

end
