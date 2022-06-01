class CommentsController < ApplicationController
    before_action :set_post

    def create
        @post.comments.create(comment_params)
        redirect_to @post
    end

    def edit
        find_comment_by_id
    end

    def update
        find_comment_by_id
        @comment.update(comment_params)
        redirect_to @post
    end
    
    def destroy
        find_comment_by_id
        @comment.destroy
        redirect_to @post
    end

    private
    def comment_params
        params.require(:comment).permit(:name, :content)
    end

    def set_post
        @post=Post.find(params[:post_id])
    end

    def find_comment_by_id
        @comment = Comment.find(params[:id])
    end
end
