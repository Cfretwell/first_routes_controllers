# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id            (artist_id)
#  index_artworks_on_artist_id_and_title  (artist_id,title) UNIQUE
#
class Artwork < ActiveRecord::Base
    validates_uniqueness_of :title, scope: :artist_id 
    validates :title, :image_url, :artist_id, presence: true 

     belongs_to(
            :artist,
            class_name: 'User',
            foreign_key: :artist_id,
            primary_key: :id
          )

end
