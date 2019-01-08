class User < ApplicationRecord

    # validates :name, :presence => true # これも同じです。
    # validates(シンボル, ハッシュ)
    # validates(:name, {:presence => true}) # これもいける
    validates(:name, {:presence => true}) # これもいける
    validates :email, presence: true



end
