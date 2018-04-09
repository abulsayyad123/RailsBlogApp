class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.post_id = params[:post_id]
		@comment.save
		respond_to do |format|
			format.html { redirect_to post_path(params[:post_id]), notice: 'Comment added'}
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to post_path(params[:post_id]), notice: 'Comment added'}
		end 
	end

	private

	def comment_params
		params.require(:comment).permit(:comment_text)
	end
end