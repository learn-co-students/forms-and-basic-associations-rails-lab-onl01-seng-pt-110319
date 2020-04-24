class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  #def notes_attributes=(attributes)
  #   attributes.each do |attribute|
  #     note = Note.create(attribute[:content])
  #     self.notes << note
  #   end
  #end



end
