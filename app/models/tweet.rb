class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweet_tags
  has_many :tags, through: :tweet_tags

  before_validation :link_check

  validates :message, presence: true
  validates :message, length: {maximum: 140, too_long: "A tweet is only 140 max. Everybody knows that!"}


  validates :message, length: { maximum: 140 }



  private

  def link_check
    if self.message.include? "http://"
      arr = self.message.split
      index = arr.map { |x| x.include? "http://" }.index(true)
      self.link = arr[index]

      if arr[index].length > 23
        arr[index] = "#{arr[index][0..20]}..."
      end

      self.message = arr.join(" ")
      apply_link
    end
  end

  def apply_link
    arr = self.message.split
    index = arr.map { |x| x.include? "http://" }.index(true)
    url = arr[index]

    arr[index] = "<a href='#{self.link}' traget='_blank'>#{url}</a>"

    self.message = arr.join(" ")
  end

end
