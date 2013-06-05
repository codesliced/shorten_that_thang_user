class Url < ActiveRecord::Base
  belongs_to :user
  validates :long_url, presence: true
  validate :has_http

  def self.random_phrase(number)
    string = ""
    number.times do
      string << ("a".."z").to_a.sample
    end
    string
  end

  def has_http
    unless long_url =~ URI.regexp
      errors.add(:long_url, "Not valid!")
    end
  end
end

__END__

session is a pseudo-hash that we have access to anywhere
session[:any_symbol] can store any value

person creates an account - that's a page with a form with a post request to a path that is handled by Sinatra within which a User.create is called
person logs in - log in page has a post request
person can see a record of their own shortened urls
person can see delete links next to the urls they created

HTML: if user is logged in, then delete links render, link to their account page shows up in navigation bar

IN POST REQUEST WHILE CREATING URL:
  current_user.id becomes the user_id of that url
