Rails.application.routes.draw do
  # Routes for the User entry resource:

  # CREATE
  get("/user_entries/new", { :controller => "user_entries", :action => "new_form" })
  post("/create_user_entry", { :controller => "user_entries", :action => "create_row" })

  # READ
  get("/user_entries", { :controller => "user_entries", :action => "index" })
  get("/user_entries/:id_to_display", { :controller => "user_entries", :action => "show" })

  # UPDATE
  get("/user_entries/:prefill_with_id/edit", { :controller => "user_entries", :action => "edit_form" })
  post("/update_user_entry/:id_to_modify", { :controller => "user_entries", :action => "update_row" })

  # DELETE
  get("/delete_user_entry/:id_to_remove", { :controller => "user_entries", :action => "destroy_row" })

  #------------------------------

  # Routes for the Journal prompt resource:

  # CREATE
  get("/journal_prompts/new", { :controller => "journal_prompts", :action => "new_form" })
  post("/create_journal_prompt", { :controller => "journal_prompts", :action => "create_row" })

  # READ
  get("/journal_prompts", { :controller => "journal_prompts", :action => "index" })
  get("/journal_prompts/:id_to_display", { :controller => "journal_prompts", :action => "show" })

  # UPDATE
  get("/journal_prompts/:prefill_with_id/edit", { :controller => "journal_prompts", :action => "edit_form" })
  post("/update_journal_prompt/:id_to_modify", { :controller => "journal_prompts", :action => "update_row" })

  # DELETE
  get("/delete_journal_prompt/:id_to_remove", { :controller => "journal_prompts", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
