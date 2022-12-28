# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    permitted_params = comment_params
    if params[:model] == "book_comment"
      book_comment = BookComment.new(
        user_id: current_user.id,
        book_id: params[:data].to_i,
        content: params[:content]
      )
      book_comment.save
      redirect_to book_path(params[:data].to_i)
    end
    if params[:model] == "report_comment"
      report_comment = ReportComment.new(
        user_id: current_user.id,
        report_id: params[:data].to_i,
        content: params[:content]
      )
      report_comment.save
      redirect_to report_path(params[:data].to_i)
    end
  end

  private
  def comment_params
    params.permit(:content, :model, :data)
  end
end
