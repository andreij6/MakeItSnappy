class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation   #protects from mass assingmen vulnerabilities (:password digest was changed to :pw & :Pwconf)
  
  has_secure_password                           #in order for this to work we need the bcrypt-ruby gem
  
  validates :username, presence: true, uniqueness: {case_sensitive: false},
                       length: {in: 4..12}, 
                       format: {with: /^[a-z][a-z0-9]*$/, message: 'can only contain lowercase letters and numbers'}
  
  validates :password, length: {in: 4..8}
  validates :password_confirmation, length: {in: 4..8}
end
