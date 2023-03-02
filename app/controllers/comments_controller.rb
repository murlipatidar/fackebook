class CommentsController < ApplicationController
	# def index
	# 	@comment = Comment.all
	# end

	# def show
	# 	@comment = @post.comments.create(comment_params)
	# end

	# def new
	# 	@comment = Comment.new
	# end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save!
		 redirect_to posts_path(@post)
	end



# 	def create
# byebug		
#   @comment = Comment.new(comment_params)
#   @comment.post = Post.find(params[:post_id])

#   if params[:comment_id]
#     @comment.parent_comment = Comment.find(params[:comment_id])
#   end

#   if @comment.save
#     redirect_to post_path(@comment.post)
#   else
#     render :new
#   end
# end




# 	def new
# byebug		
# 	  @comment = Comment.new(parent_id: params[:parent_id])
# 	end

# 	def create
# 	  if params[:comment][:parent_id].to_i > 0
# 	    parent = Comment.find_by_id(params[:comment].delete(:parent_id))
# 	    @comment = parent.children.build(comment_params)
# 	     @comment.save
# 	  else
# 	    @comment = Comment.new(comment_params)
# 	  	 @comment.save
# 	  end
# 	end


# 	def reply
# byebug		
# 		if params[:comment][:parent_id].present?
# 		    parent = Comment.where(params[:comment][:parent_id]).first
# 		    comment = parent.post.build(comment_params)
# 		  else
# 		    comment = Comment.new(comment_params)
# 		    if comment.save
# 		       	redirect_to post_comments_comment_path(@post)
# 		    else
# 		     render json: {success: false, message: "Something went wrong"}
# 		    end
# 		 end
# 	end

	# def destroy
    #   @post = Post.find(params[:post_id])
    #   @comment = @post.comments.find(params[:id])
    #   @comment.destroy
    #   redirect_to post_path(@post)
 	# end

private

 	def comment_params
 		params.require(:comment).permit(:comment, :user_id, :post_id, :parent_id)
 	end
end

