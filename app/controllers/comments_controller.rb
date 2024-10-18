class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [ :create ]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.article_id = @article.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article.id), notice: "Comentario se creó exitosamente" }
      else
        format.html { redirect_to article_path(@article.id), notice: "Comentario no pudo ser creado" }
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id]) # Aquí obtengo el post según el ID pasado en la ruta
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
