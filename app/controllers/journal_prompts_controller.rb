class JournalPromptsController < ApplicationController
  def index
    @q = JournalPrompt.ransack(params[:q])
    @journal_prompts = @q.result(:distinct => true).includes(:user_entries, :journal_method).page(params[:page]).per(10)

    render("journal_prompt_templates/index.html.erb")
  end

  def show
    @user_entry = UserEntry.new
    @journal_prompt = JournalPrompt.find(params.fetch("id_to_display"))

    render("journal_prompt_templates/show.html.erb")
  end

  def new_form
    @journal_prompt = JournalPrompt.new

    render("journal_prompt_templates/new_form.html.erb")
  end

  def create_row
    @journal_prompt = JournalPrompt.new

    @journal_prompt.prompt_text = params.fetch("prompt_text")
    @journal_prompt.day = params.fetch("day")
    @journal_prompt.journal_method_id = params.fetch("journal_method_id")

    if @journal_prompt.valid?
      @journal_prompt.save

      redirect_back(:fallback_location => "/journal_prompts", :notice => "Journal prompt created successfully.")
    else
      render("journal_prompt_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_journal_method
    @journal_prompt = JournalPrompt.new

    @journal_prompt.prompt_text = params.fetch("prompt_text")
    @journal_prompt.day = params.fetch("day")
    @journal_prompt.journal_method_id = params.fetch("journal_method_id")

    if @journal_prompt.valid?
      @journal_prompt.save

      redirect_to("/journal_methods/#{@journal_prompt.journal_method_id}", notice: "JournalPrompt created successfully.")
    else
      render("journal_prompt_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @journal_prompt = JournalPrompt.find(params.fetch("prefill_with_id"))

    render("journal_prompt_templates/edit_form.html.erb")
  end

  def update_row
    @journal_prompt = JournalPrompt.find(params.fetch("id_to_modify"))

    @journal_prompt.prompt_text = params.fetch("prompt_text")
    @journal_prompt.day = params.fetch("day")
    @journal_prompt.journal_method_id = params.fetch("journal_method_id")

    if @journal_prompt.valid?
      @journal_prompt.save

      redirect_to("/journal_prompts/#{@journal_prompt.id}", :notice => "Journal prompt updated successfully.")
    else
      render("journal_prompt_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_journal_method
    @journal_prompt = JournalPrompt.find(params.fetch("id_to_remove"))

    @journal_prompt.destroy

    redirect_to("/journal_methods/#{@journal_prompt.journal_method_id}", notice: "JournalPrompt deleted successfully.")
  end

  def destroy_row
    @journal_prompt = JournalPrompt.find(params.fetch("id_to_remove"))

    @journal_prompt.destroy

    redirect_to("/journal_prompts", :notice => "Journal prompt deleted successfully.")
  end
end
