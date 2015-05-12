class Mentor < User
  searchkick word_start: [:name]

end
