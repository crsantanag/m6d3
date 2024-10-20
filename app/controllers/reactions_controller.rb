class ReactionsController < ApplicationController
  def new_user_reaction
    @type = params[:reaction_type]
    @article = Article.find(params[:article_id])  if params[:article_id]
    @comment = Comment.find(params[:comment_id])  if params[:comment_id]
    @kind = params[:kind]

    unless user_signed_in?
      redirect_to article_path(@article), notice: "Debe inicar sesión para esta opción"
      return
    end

    @user = current_user

    respond_to do |format|
      (@type == "comment") ? reaction_comment = Reaction.find_by(user_id: @user, comment_id: @comment.id) : reaction_article = Reaction.find_by(user_id: @user.id,  article_id: @article.id)

      if reaction_article
        format.html { redirect_to article_path(@article), notice: "Ya reaccionó a este artículo" }
      elsif reaction_comment
        format.html { redirect_to article_path(@article), notice: "Ya reaccionó a este comentario" }
      else
        # (@type == "article") ? @reaction = Reaction.new(user_id: @user.id, article_id:  @article.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(user_id: @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)

        if @type == "article"
            @reaction = Reaction.new(user_id: @user.id, article_id:  @article.id, reaction_type: @type, kind: @kind)
        end

        if @reaction.save!
          format.html { redirect_to article_path(@article), notice: "Reacción registrada" }
        else
          format.html { redirect_to article_path(@article), notice: "Ha ocurrido algo extraño - No se pudo registrar reacción" }
        end

      end
    end
  end
end
