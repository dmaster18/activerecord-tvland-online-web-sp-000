class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def list_roles
    characters = Character.where(actor_id: self.id)
    roles = []
    characters.each {|character|
      roles << "#{character.name} - #{Show.find(character.show_id).name}"
    }
    roles
  end
  
end