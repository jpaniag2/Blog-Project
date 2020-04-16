class User < ApplicationRecord
    has_many :articles
    
    VALID_EMAIL_REGEX = /A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    #password requires at least one capital letter, number and symbol
    VALID_PASSOWORD_REGEX = /(?=[A-Z])(?=.+[0-9])(?=.+[!@#$^&*])/ 
    before_save { self.email = email.downcase }
    
    validates :name,
        presence: true,
        length: { maximum: 12, minimum:6 }
        
    
    validates :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
        
    validates :password,
        presence: true,
        length: { minimum: 6 },
        format: {with: VALID_PASSOWORD_REGEX}
        
    has_secure_password
end
