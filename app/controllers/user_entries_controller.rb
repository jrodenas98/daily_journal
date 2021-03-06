class UserEntriesController < ApplicationController
  before_action :current_user_must_be_user_entry_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_user_entry_user
    user_entry = UserEntry.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == user_entry.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = UserEntry.ransack(params[:q])
    @user_entries = @q.result(:distinct => true).includes(:user, :prompt).page(params[:page]).per(10)

    render("user_entry_templates/index.html.erb")
  end

  def show
    @user_entry = UserEntry.find(params.fetch("id_to_display"))

    render("user_entry_templates/show.html.erb")
  end

  def new_form
    @user_entry = UserEntry.new

    render("user_entry_templates/new_form.html.erb")
  end

  def create_row
    @user_entry = UserEntry.new

    @user_entry.user_id = params.fetch("user_id")
    @user_entry.prompt_id = params.fetch("prompt_id")
    @user_entry.response = params.fetch("response")
    @user_entry.headline = params.fetch("headline")

    if @user_entry.valid?
      @user_entry.save

      redirect_back(:fallback_location => "/user_entries", :notice => "User entry created successfully.")
    else
      render("user_entry_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_journal_prompt
    @user_entry = UserEntry.new

    @user_entry.user_id = params.fetch("user_id")
    @user_entry.prompt_id = params.fetch("prompt_id")
    @user_entry.response = params.fetch("response")
    @user_entry.headline = params.fetch("headline")

    if @user_entry.valid?
      @user_entry.save

      redirect_to("/journal_prompts/#{@user_entry.prompt_id}", notice: "UserEntry created successfully.")
    else
      render("user_entry_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @user_entry = UserEntry.find(params.fetch("prefill_with_id"))

    render("user_entry_templates/edit_form.html.erb")
  end

  def update_row
    @user_entry = UserEntry.find(params.fetch("id_to_modify"))

    
    @user_entry.prompt_id = params.fetch("prompt_id")
    @user_entry.response = params.fetch("response")
    @user_entry.headline = params.fetch("headline")

    if @user_entry.valid?
      @user_entry.save

      redirect_to("/user_entries/#{@user_entry.id}", :notice => "User entry updated successfully.")
    else
      render("user_entry_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @user_entry = UserEntry.find(params.fetch("id_to_remove"))

    @user_entry.destroy

    redirect_to("/users/#{@user_entry.user_id}", notice: "UserEntry deleted successfully.")
  end

  def destroy_row_from_prompt
    @user_entry = UserEntry.find(params.fetch("id_to_remove"))

    @user_entry.destroy

    redirect_to("/journal_prompts/#{@user_entry.prompt_id}", notice: "UserEntry deleted successfully.")
  end

  def destroy_row
    @user_entry = UserEntry.find(params.fetch("id_to_remove"))

    @user_entry.destroy

    redirect_to("/user_entries", :notice => "User entry deleted successfully.")
  end
end
