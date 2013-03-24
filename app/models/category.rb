class Category < ActiveRecord::Base

  has_many :children, class_name: 'Category', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Category'

  before_validation :assign_parents, on: :create

  private

  def assign_parents
    parts = full_name.split '/'
    self.name = parts.pop
    self.parent = Category.where(full_name: parts.join('/')).first_or_initialize unless parts.empty?
  end 

end
