# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment_params
    record_type = { 'book_comment': 'Book', 'report_comment': 'Report' }
    comment = Comment.new(
      user_id: current_user.id,
      comment_record_id: params[:data].to_i,
      comment_record_type: record_type[params[:model].to_sym],
      content: params[:content]
    )
    comment.save

    if params[:model] == 'book_comment'
      redirect_to book_path(params[:data].to_i)
    else
      redirect_to report_path(params[:data].to_i)
    end
  end

  private

  def comment_params
    params.permit(:content, :model, :data)
  end
end
