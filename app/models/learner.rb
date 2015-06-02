class Learner < User
  searchkick word_start: [:name]
end
