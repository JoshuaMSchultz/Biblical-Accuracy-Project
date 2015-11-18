class VersesController < ApplicationController
  before_action :set_verse, only: [:show, :edit, :update, :destroy]
  before_action :store_translation, only: [:translate]

  # GET /verses
  # GET /verses.json
  def index
    @verses = Verse.all
  end

  # GET /verses/1
  # GET /verses/1.json
  def show
  end

  def translate
    @verse = Verse.new(chapter: @pre_translation.chapter, book: @pre_translation.book, order_id: @pre_translation.order_id)
  end

  # POST /verses
  # POST /verses.json
  def create
    @verse = Verse.new(verse_params)

    respond_to do |format|
      if @verse.save
        format.html { redirect_to @verse, notice: 'Verse was successfully created.' }
        format.json { render :show, status: :created, location: @verse }
      else
        format.html { render :new }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verses/1
  # PATCH/PUT /verses/1.json
  def update
    respond_to do |format|
      if @verse.update(verse_params)
        format.html { redirect_to @verse, notice: 'Verse was successfully updated.' }
        format.json { render :show, status: :ok, location: @verse }
      else
        format.html { render :edit }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verses/1
  # DELETE /verses/1.json
  def destroy
    @verse.destroy
    respond_to do |format|
      format.html { redirect_to verses_url, notice: 'Verse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verse
      @verse = Verse.find(params[:id])
    end

    def store_translation
      @pre_translation = Verse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verse_params
      params.require(:verse).permit(:vote_count, :chapter_id, :book_id, :content, :user_id, :order_id)
    end
end
