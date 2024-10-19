class ArticlesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!, except: [ :index, :show ]

  before_action :set_article,   only: %i[ show edit update destroy ]
  before_action :set_locations, only: %i[ new edit create destroy update]

  # GET /articles or /articles.json
  def index
    @pagy, @articles = pagy(Article.order(created_at: :desc))
    #    .left_joins(:comments)
    #    .select("articles.*, COUNT(comments.id) AS comments_count")
    #    .group("articles.id")
    #    .order("COUNT(comments.id) DESC")
    #    .distinct)
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Artículo creado exitosamente." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_path, status: :see_other, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def set_locations
      @locations = Location.all.pluck :name, :id
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:image, :title, :description, :when, :location_id)
    end
end
