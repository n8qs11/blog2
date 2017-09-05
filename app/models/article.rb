class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tag_s)
    tag_a = tag_s.split(",").collect {|s| s.strip.downcase}.uniq
    converted_to_tags = tag_a.collect {|tag| Tag.find_or_create_by(name: tag)}
    self.tags = converted_to_tags
  end
end
