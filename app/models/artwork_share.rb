# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
# Indexes
#
#  index_artwork_shares_on_artwork_id                (artwork_id)
#  index_artwork_shares_on_artwork_id_and_viewer_id  (artwork_id,viewer_id) UNIQUE
#  index_artwork_shares_on_viewer_id                 (viewer_id)
#
class ArtworkShare < ActiveRecord::Base
    validates_uniqueness_of :artwork_id, scope: :viewer_id 
    validates :artwork_id, :viewer_id, presence: true 

    belongs_to(
        :viewer,
        class_name: 'User',
        foreign_key: :viewer_id,
        primary_key: :id
    )

    belongs_to :artwork
        

end
