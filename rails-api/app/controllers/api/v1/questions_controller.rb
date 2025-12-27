module Api
  module V1
    class QuestionsController < ApplicationController

      def create
        store_id = params[:store_id]
        question = params[:question]

        # 1. Validate input
        if store_id.blank? || question.blank?
          return render json: { error: "store_id and question are required" }, status: 400
        end

        # 2. Forward request to Python AI service
        response = Faraday.post("http://127.0.0.1:8000/ask") do |req|
          req.headers["Content-Type"] = "application/json"
          req.body = {
            shop: store_id,
            token: "SHOPIFY_ACCESS_TOKEN",
            question: question
          }.to_json
        end

        # 3. Return AI response directly
        render json: JSON.parse(response.body), status: 200

      rescue => e
        render json: { error: e.message }, status: 500
      end
    end
  end
end
