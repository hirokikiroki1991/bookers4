class Book < ApplicationRecord

   belongs_to :user
   validates :book_comment, length: { in: 1..200 }

end
