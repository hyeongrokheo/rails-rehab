class MemosController < ApplicationController
  DEFAULT_MEMO_EXPIRATION_PERIOD = 5

  def index
    @keys = REDIS.keys
  end

  def new
  end

  def create
    return if is_duplicated_key?(create_memo_params[:key])

    REDIS.set(create_memo_params[:key],
              create_memo_params[:content],
              ex: create_memo_params[:exp_period] || DEFAULT_MEMO_EXPIRATION_PERIOD
    )

    # todo: 이어서 할 부분
  end

  def show
    @content = REDIS.get(show_memo_params[:key])
  end

  private

  def is_duplicated_key?(key)
    !!REDIS.get(key)
  end

  def show_memo_params
    params.permit(:key)
  end

  def create_memo_params
    params.permit(:key, :content, :exp_period)
  end
end
