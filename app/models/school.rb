class School < ActiveRecord::Base
  validates :name, presence: true
  validates :students, numericality: true, allow_blank: true
  validates :undocumented_students, numericality: true, allow_blank: true
  validates :zip, length: {is: 5}, allow_blank: true

  # def initialize(*strings)
  #   p strings
  #   capitalize(strings)
  #   save
  # end

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end
  end

  def address
    if street && city && state && zip
      "#{street}, #{city}, #{state} #{zip}"
    else
      nil
    end
  end

  def self.capitalize(string)
    (string.split.map &:capitalize).join(' ')
  end
end
