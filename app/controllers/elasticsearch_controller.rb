class ElasticsearchController < ApplicationController
  def index
    @elasticsearch = Elasticsearch.new(elasticsearch_params)
    # Elasticsearchモデルのsearchメソッド
    # @elasticsearch_resultにはSpotモデルのsearch_dataメソッドで定義したカラムが入っている
    @elasticsearch_result = @elasticsearch.search
  end

  private

  def elasticsearch_params
    params.fetch(:elasticsearch, {}).permit(:keyword).merge(page: params[:page])
  end
end
