# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: true 

    has_many(
        :artworks,
        class_name: 'Artwork',
        foreign_key: :artist_id,
        primary_key: :id,
        dependent: :destroy 
    )

    has_many(
        :artwork_shares,
        foreign_key: :viewer_id,
        dependent: :destroy 
    )

    
    has_many :shared_artworks, through: :artwork_shares, source: :artwork

end
