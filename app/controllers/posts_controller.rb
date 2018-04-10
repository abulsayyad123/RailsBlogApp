class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :destroy, :update]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		respond_to do |format|
			format.html { redirect_to posts_path, notice: 'Created Successfully'}
		end
	end

	def edit
	end

	def update
		@post.update(post_params)
		@post.save
		respond_to do |format|
			format.html { redirect_to posts_path, notice: 'Updated Successfully'}
		end
	end

	def show
		@comment = Comment.new
	end

	def destroy
		@post.destroy
		respond_to do |format|
			format.html { redirect_to posts_path, notice: 'Deleted Successfully '}
		end
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :post_body, :image_url, :reading_time)
	end
end
