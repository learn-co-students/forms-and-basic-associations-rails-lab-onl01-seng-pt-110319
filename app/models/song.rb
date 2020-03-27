class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre

  has_many :notes

  def artist_attributes=(args)
    self.artist = Artist.find_or_create_by(args)
  end

  def artist_name=(a_name)
    self.artist = Artist.find_or_create_by(name: a_name)

    a_name
  end 

  def artist_name
    if self.artist 
      self.artist.name
    else 
      nil
    end 
  end
end
