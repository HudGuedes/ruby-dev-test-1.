class Directory < ApplicationRecord
  has_many :archives
  scope :root_path, -> { where(parent_id: nil) }
  scope :childrens, ->(id) { where(parent_id: id) }
end
