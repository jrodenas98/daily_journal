class JournalPrompt < ApplicationRecord
  # Direct associations

  has_many   :user_entries,
             :foreign_key => "prompt_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
