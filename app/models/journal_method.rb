class JournalMethod < ApplicationRecord
  # Direct associations

  has_many   :journal_prompts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
