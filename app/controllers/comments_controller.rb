class CommentsController < ApplicationController

	def create
   @product = Product.find(params[:product_id])
   @comment = @product.comments.new(comment_params)
   @comment.user = current_user
   respond_to do |format|
     if @comment.save
       format.html { redirect_to products_url, notice: 'Review was created successfully.' }
       format.json { render :show, status: :created, location: @products }
       format.js
     else
       format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
       format.json { render json: @comment.errors, status: :unprocessable_entity }
     end
   end
 end

	def destroy
  @comment = Comment.find(params[:id])
  product = @comment.product
  repond_to do |format|
  if @comment.destroy
    format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    format.json { render :show, status: :destroyed, location: @products }
    format.js
  else
       format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
       format.json { render json: @comment.errors, status: :unprocessable_entity }
     end
   end
 end


end


private

  def comment_params
  	params.require(:comment).permit(:user_id, :body, :rating)
  end


end
