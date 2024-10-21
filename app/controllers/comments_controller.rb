class CommentsController < ApplicationController
  before_action :set_article, only: [ :create ]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = @article.id

    if user_signed_in?
      @comment.user_id = current_user.id
    end

    respond_to do |format|
      if @comment.save
        if user_signed_in?
          format.html { redirect_to article_path(@article.id), notice: "Comentario creado." }
        else
          format.html { redirect_to article_path(@article.id), notice: "Comentario creado - anónimo." }
        end
      else
        logger.error @comment.errors.full_messages
        format.html { redirect_to article_path(@article.id), notice: "Comentario no pudo ser creado." }
      end
    end
  end

  private

  def set_article
    if request.referer && request.referer.include?("page=")
      session[:previous_page] = request.referer
    else
      session[:previous_page] = nil
    end
    @article = Article.find(params[:comment][:article_id])  # Aquí obtengo el post según el ID pasado en la ruta
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end
end
