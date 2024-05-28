class Post < ApplicationRecord
  belongs_to :user

  enum genre: { ogiri: 0, manzai: 1, cont: 2, variety_show: 3, gag: 4 }
  enum privacy: { public_access: 0, private_access: 1, follower_only: 2 }
end
