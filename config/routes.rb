Rails.application.routes.draw do
  # Routes for the Journal method resource:

  # CREATE
  get("/journal_methods/new", { :controller => "journal_methods", :action => "new_form" })
  post("/create_journal_method", { :controller => "journal_methods", :action => "create_row" })

  # READ
  get("/journal_methods", { :controller => "journal_methods", :action => "index" })
  get("/journal_methods/:id_to_display", { :controller => "journal_methods", :action => "show" })

  # UPDATE
  get("/journal_methods/:prefill_with_id/edit", { :controller => "journal_methods", :action => "edit_form" })
  post("/update_journal_method/:id_to_modify", { :controller => "journal_methods", :action => "update_row" })

  # DELETE
  get("/delete_journal_method/:id_to_remove", { :controller => "journal_methods", :action => "destroy_row" })

  #------------------------------

  # Routes for the Quote resource:

  # CREATE
  get("/quotes/new", { :controller => "quotes", :action => "new_form" })
  post("/create_quote", { :controller => "quotes", :action => "create_row" })

  # READ
  get("/quotes", { :controller => "quotes", :action => "index" })
  get("/quotes/:id_to_display", { :controller => "quotes", :action => "show" })

  # UPDATE
  get("/quotes/:prefill_with_id/edit", { :controller => "quotes", :action => "edit_form" })
  post("/update_quote/:id_to_modify", { :controller => "quotes", :action => "update_row" })

  # DELETE
  get("/delete_quote/:id_to_remove", { :controller => "quotes", :action => "destroy_row" })

  #------------------------------

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
