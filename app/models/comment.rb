# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  validates :description, presence: true
  belongs_to :user
  belongs_to :task
end
