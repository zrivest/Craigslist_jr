class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  def initialize(*args)
    super
    generate_url
  end

  def generate_url
  url = []
  possibilities = ('a'..'z').to_a + ('0'..'9').to_a 
  10.times do
    next_char = possibilities.sample
    url << next_char
  end
    self.edit_url = url.join
  end

  belongs_to :category
end
