class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:index, :show]

  # GET /quotes or /quotes.json
  def index
    @quotes = current_user.quotes
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @quote.quote_categories.build 
  end

  # GET /quotes/1/edit
  def edit
  end

  def create
    @philosopher = Philosopher.new(philosopher_params)
    @quote = @philosopher.quotes.build(user_id: current_user.id)
    
  
    # Check if a new category is being created
    if params.dig(:quote, :category_id) == 'new'
      new_category_name = params.dig(:quote, :new_category_name)
  
      if new_category_name.present?
        category = Category.create(category_name: new_category_name)
        @quote.category_id = category.id
      end
    end
  
    respond_to do |format|
      if @quote.save
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      #params.require(:quote).permit(:quote_text, :pub_yr, :is_public, :owner_comment, :user_id, :philosopher_id)
      #params.require(:quote).permit(:quote_text, :pub_yr, :is_public, :owner_comment, :user_id, quote_categories_attributes: [:id, :category_id])
      params.require(:quote).permit(:quote_text, :pub_yr, :is_public, :owner_comment, :user_id, 
      :quote_categories_attributes , :phil_id)

    end

    def philosopher_params
      params.require(:quote).permit(:phil_fname, :phil_lname, :phil_dob, :phil_deathyr, :phil_bio)
    end
end
