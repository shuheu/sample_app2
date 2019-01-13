class User < ApplicationRecord

    # validates :name, :presence => true # これも同じです。
    # validates(シンボル, ハッシュ)
    # validates(:name, {:presence => true}) # これもいける
    
    validates(:name, {:presence => true ,
                      length: { maximum: 50 }
                      } ) # これもいける
    # validates :name, presence: true, length: { maximum: 50}
    


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                      length: { maximum: 255 },
                      format: {with: VALID_EMAIL_REGEX},
                      uniqueness: {case_sensitive: false}



end
