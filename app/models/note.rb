class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  def self.generate_from_song_form(id, cont)
    note = Note.new

    note.song_id = id
    note.content = cont

    note.save
  end
end
