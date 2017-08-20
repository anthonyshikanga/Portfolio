class CommentsController < ApplicationController
	before_action :check_user, only: [:new,:create,:edit,:update,:delete]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = "Comment added succesfully"
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def edit 
		@comment = Comment.find(params[:id])
	end

	def update
		@comment =Comment.find(params[:id])
		if @comment.user == current_user && @comment.update(comment_params)
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.user == current_user && @comment.delete
			flash[:notice] == 'Comment deleted succesfully'
			redirect_to post_path(@post)
		else
			flash[:alert] = "Failed to delete comment"
		end
	end

	private
	def check_user
		@post = Post.find(params[:post_id])
		if user_signed_in?
			@user = current_user
		else
			flash[:alert] = "You have to sign in to post a comment"
			redirect_to post_path(@post)
		end
	end

	def comment_params
		post = {post_id:params[:post_id]}
		user = {user_id:params[:user_id]}
		params.require(:comment).permit(:comment,:post_id,:user_id)
		end
	end


