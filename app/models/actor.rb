class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def list_roles
    character = Character.find_by(actor_id: self.id)
    "#{character.name} - #{Show.find_by(character: character)}"
  end
  
end