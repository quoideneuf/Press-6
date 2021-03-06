# frozen_string_literal: true

module Admin
  module Detachable
    extend ActiveSupport::Concern

    def detach
      klass = params[:controller].split("/").last.classify
      entity = klass.constantize.find(params[:id])
      entity.cover_image.purge if klass == "Book"
      flash[:notice] = "Image detached"
      redirect_to url_for(controller: params[:controller], action: :show, id: params[:id], only_path: true)
    end
  end
end
