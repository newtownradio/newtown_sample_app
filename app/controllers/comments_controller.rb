class CommentsController < ApplicationController

	def create
   @product = Product.find(params[:product_id])
   @comment = @product.comments.new(comment_params)
   @comment.user = current_user
   respond_to do |format|
     if @comment.save
       format.html { redirect_to products_url, notice: 'Success! Your review was created.' }
       format.json { render :show, status: :created, location: products_url }
       format.js
     else
       format.html { redirect_to @product, alert: 'Error: Unable to save review' }
       format.json { render json: @comment.errors, status: :unprocessable_entity }
     end
   end
 end

  def edit
  @comment = Comment.find(params[:id])
  @product = @comment.product
  respond_to do |format|
    if @comment.edit
      format.html { redirect_to products_url, notice: 'Updated.' }
      format.json { render :show, status: :updated, location: products_url }
    else
      format.html { redirect_to @products, alert: 'Error: Unable to update review.'}
      format.json { render json: @comment.errors, status: :unprocessable_entity}
    end
  end
end

	def destroy
  @comment = Comment.find(params[:id])
  product = @comment.product
  repond_to do |format|
  if @comment.destroy
    format.html { redirect_to products_url, notice: 'The review was deleted.' }
    format.json { render :show, status: :destroyed, location: @comment.product }
    format.js
  else
    format.html { redirect to @products, alert: 'Error: Unable to destroy review.'}
    format.json { render json: @comment.errors, status: :unprocessable_entity }
   end
  end
end

private

  def comment_params
  	params.require(:comment).permit(:user_id, :body, :rating)
  end

end
