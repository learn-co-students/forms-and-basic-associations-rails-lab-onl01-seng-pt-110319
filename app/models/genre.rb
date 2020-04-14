class Genre < ActiveRecord::Base
  has_many :songs

  def song_ids=(ids)
    ids.each do |id|
      post = Post.find(id)
      self.posts << post
    end
  end
end
