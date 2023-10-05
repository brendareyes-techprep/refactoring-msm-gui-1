# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  def characters
    Character.where({ :actor_id => self.id })
  end

  def movies
    movie_ids = characters.pluck(:movie_id)
    Movie.where({ :id => movie_ids })
  end
end
