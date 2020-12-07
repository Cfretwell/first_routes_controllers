# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### Clear db 
Artwork.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('artworks')
User.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ArtworkShare.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('aartwork_shares')

u1 = User.create!(username: "Joe123")
u2 = User.create!(username: "OG JOE")
u3 = User.create!(username: "Train45")

aw1 = Artwork.create!(image_url: "asdfasdf.co", title: "neatArt",artist_id: u1.id)
aw2 = Artwork.create!(image_url: "asdfasdf/4.co", title: "lessNeat",artist_id: u1.id)
aw3 = Artwork.create!(image_url: "asadsfaf/4.co", title: "gbhaiosdhgf",artist_id: u2.id)
aw4 = Artwork.create!(image_url: "asdfajjik.co", title: "wakawaka",artist_id: u3.id)


aws1 = ArtworkShare.create!(artwork_id: aw1.id, viewer_id: u1.id)
aws2 = ArtworkShare.create!(artwork_id: aw1.id, viewer_id: u2.id)
aws1 = ArtworkShare.create!(artwork_id: aw1.id, viewer_id: u3.id)
aws1 = ArtworkShare.create!(artwork_id: aw2.id, viewer_id: u1.id)
aws1 = ArtworkShare.create!(artwork_id: aw4.id, viewer_id: u1.id)
aws1 = ArtworkShare.create!(artwork_id: aw3.id, viewer_id: u2.id)
