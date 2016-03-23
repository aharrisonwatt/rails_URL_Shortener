require 'SecureRandom'

class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :short_url, :long_url, :submitter_id, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: :User

  has_many :visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitors


  def self.random_code
    rand_code = SecureRandom.base64
    while exists?(short_url: rand_code)
      rand_code = SecureRandom.base64
    end
    rand_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(submitter_id: user.id, long_url: long_url, short_url: self.random_code)
  end
end
