class User < ApplicationRecord

    # validates :name, :presence => true # これも同じです。
    # validates(シンボル, ハッシュ)
    # validates(:name, {:presence => true}) # これもいける
    validates(:name, {:presence => true, length: { maximum: 50 } } ) # これもいける
    # validates :name, presence: true, length: { maximum: 50}
    
    validates :email, presence: true, length: { maximum: 255 } 




end
