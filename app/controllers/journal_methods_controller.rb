class JournalMethodsController < ApplicationController
  def index
    @q = JournalMethod.ransack(params[:q])
    @journal_methods = @q.result(:distinct => true).includes(:journal_prompts).page(params[:page]).per(10)

    render("journal_method_templates/index.html.erb")
  end

  def show
    @journal_prompt = JournalPrompt.new
    @journal_method = JournalMethod.find(params.fetch("id_to_display"))

    render("journal_method_templates/show.html.erb")
  end

  def new_form
    @journal_method = JournalMethod.new

    render("journal_method_templates/new_form.html.erb")
  end

  def create_row
    @journal_method = JournalMethod.new

    @journal_method.name = params.fetch("name")
    @journal_method.description = params.fetch("description")

    if @journal_method.valid?
      @journal_method.save

      redirect_back(:fallback_location => "/journal_methods", :notice => "Journal method created successfully.")
    else
      render("journal_method_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @journal_method = JournalMethod.find(params.fetch("prefill_with_id"))

    render("journal_method_templates/edit_form.html.erb")
  end

  def update_row
    @journal_method = JournalMethod.find(params.fetch("id_to_modify"))

    @journal_method.name = params.fetch("name")
    @journal_method.description = params.fetch("description")

    if @journal_method.valid?
      @journal_method.save

      redirect_to("/journal_methods/#{@journal_method.id}", :notice => "Journal method updated successfully.")
    else
      render("journal_method_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @journal_method = JournalMethod.find(params.fetch("id_to_remove"))

    @journal_method.destroy

    redirect_to("/journal_methods", :notice => "Journal method deleted successfully.")
  end
end
