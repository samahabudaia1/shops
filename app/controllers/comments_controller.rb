class CommentsController < ApplicationController
  def create
    # find associtaed product id that comment(s) will be displayed on, pass comment params that are stored in comment_params method
    # locate current signed-in user using devise pre-loaded method current_user, save comment and redirect user to commented product path
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_prarms)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  end

  private
  def comment_prarms
    params.require(:comment).permit(:user_id, :body, :rating)
  end
end