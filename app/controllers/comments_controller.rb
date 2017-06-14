class CommentsController < ApplicationController
  before_action :set_company
  before_action :set_job
  before_action :set_comment, only: []

  def new
    @comment = Comment.new()
  end

  def create
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "Your comment has been added."
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  private

   def comment_params
     params.require(:comment).permit(:title, :body)
   end

   def set_comment
     @comment = Comment.find(params[:id])

   end

   def set_company
     @company = Company.find(params[:company_id])
   end

   def set_job
     @job = Job.find(params[:job_id])
   end
end
