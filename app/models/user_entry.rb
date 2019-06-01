class UserEntry < ApplicationRecord
  # Direct associations

  belongs_to :prompt,
             :class_name => "JournalPrompt"

  belongs_to :user

  # Indirect associations

  # Validations

end
