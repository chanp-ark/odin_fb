class Posts::CommentsController < CommentsController
  before_action :set_commentablle


  private
  
    def set_commentablle
      @commentable = Post.find(params[:post_id])
    end
end
