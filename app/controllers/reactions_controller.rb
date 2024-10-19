class ReactionsController < ApplicationController
  def new_user_reaction
    @type = params[:reaction_type]
    @article = Article.find(params[:article_id]) if params[:article_id]
    @comment = Comment.find(params[:comment_id])  if params[:comment_id]
    @kind = params[:kind]

    unless user_signed_in?
      redirect_to article_path(@article), notice: "Debe ser usuario registrado para esta acción"
      return
    end

    @user = current_user

    respond_to do |format|
      (@type == "comment") ? reaction_comment = Reaction.find_by(user_id: @user, comment_id: @comment.id) : reaction_article = Reaction.find_by(user_id: @user.id,  article_id: @article.id)
      puts "*** Salió de comment"
      if reaction_article || reaction_comment
        format.html { redirect_to article_path(@article), notice: "Ud. ya reaccionó antes a este artículo" }
      else
        puts "*** Entró a article"
        (@type == "article") ? @reaction = Reaction.new(user_id: @user.id, article_id:  @article.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(user_id: @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)

        if @reaction.save!
            format.html { redirect_to article_path(@article), notice: "Su reacción fue guardada" }
        else
          format.html { redirect_to article_path(@article), notice: "Ha ocurrido algo extraño - No se pudo registrar reacción" }
        end

      end
    end
  end
end
