# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment_params
    if params[:model] == 'book_comment'
      book_comment = Comment.new(
        user_id: current_user.id,
        comment_record_id: params[:data].to_i,
        comment_record_type: 'Book',
        content: params[:content]
      )
      book_comment.save
      redirect_to book_path(params[:data].to_i)
    end
    return unless params[:model] == 'report_comment'

    report_comment = Comment.new(
      user_id: current_user.id,
      comment_record_id: params[:data].to_i,
      comment_record_type: 'Report',
      content: params[:content]
    )
    report_comment.save
    redirect_to report_path(params[:data].to_i)
  end

  private

  def comment_params
    params.permit(:content, :model, :data)
  end
end
