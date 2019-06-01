class QuotesController < ApplicationController
  def index
    @quotes = Quote.all

    render("quote_templates/index.html.erb")
  end

  def show
    @quote = Quote.find(params.fetch("id_to_display"))

    render("quote_templates/show.html.erb")
  end

  def new_form
    @quote = Quote.new

    render("quote_templates/new_form.html.erb")
  end

  def create_row
    @quote = Quote.new

    @quote.body = params.fetch("body")
    @quote.author = params.fetch("author")

    if @quote.valid?
      @quote.save

      redirect_back(:fallback_location => "/quotes", :notice => "Quote created successfully.")
    else
      render("quote_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @quote = Quote.find(params.fetch("prefill_with_id"))

    render("quote_templates/edit_form.html.erb")
  end

  def update_row
    @quote = Quote.find(params.fetch("id_to_modify"))

    @quote.body = params.fetch("body")
    @quote.author = params.fetch("author")

    if @quote.valid?
      @quote.save

      redirect_to("/quotes/#{@quote.id}", :notice => "Quote updated successfully.")
    else
      render("quote_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @quote = Quote.find(params.fetch("id_to_remove"))

    @quote.destroy

    redirect_to("/quotes", :notice => "Quote deleted successfully.")
  end
end
