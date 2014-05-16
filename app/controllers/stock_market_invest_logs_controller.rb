class StockMarketInvestLogsController < ApplicationController
    # GET /stock_market_invest_logs
    # GET /stock_market_invest_logs.json
    def index
        @stock_market_invest_logs = StockMarketInvestLog.all

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @stock_market_invest_logs }
        end
    end

    # GET /stock_market_invest_logs/1
    # GET /stock_market_invest_logs/1.json
    def show
        @stock_market_invest_log = StockMarketInvestLog.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @stock_market_invest_log }
        end
    end

    # GET /stock_market_invest_logs/new
    # GET /stock_market_invest_logs/new.json
    def new
        @stock_market_invest_log = StockMarketInvestLog.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @stock_market_invest_log }
        end
    end

    # GET /stock_market_invest_logs/1/edit
    def edit
        @stock_market_invest_log = StockMarketInvestLog.find(params[:id])
    end

    # POST /stock_market_invest_logs
    # POST /stock_market_invest_logs.json
    def create
        @stock_market_invest_log = StockMarketInvestLog.new(params[:stock_market_invest_log])

        respond_to do |format|
            if @stock_market_invest_log.save
                format.html { redirect_to @stock_market_invest_log, notice: 'Stock market invest log was successfully created.' }
                format.json { render json: @stock_market_invest_log, status: :created, location: @stock_market_invest_log }
            else
                format.html { render action: "new" }
                format.json { render json: @stock_market_invest_log.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /stock_market_invest_logs/1
    # PUT /stock_market_invest_logs/1.json
    def update
        @stock_market_invest_log = StockMarketInvestLog.find(params[:id])

        respond_to do |format|
            if @stock_market_invest_log.update_attributes(params[:stock_market_invest_log])
                format.html { redirect_to @stock_market_invest_log, notice: 'Stock market invest log was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @stock_market_invest_log.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /stock_market_invest_logs/1
    # DELETE /stock_market_invest_logs/1.json
    def destroy
        @stock_market_invest_log = StockMarketInvestLog.find(params[:id])
        @stock_market_invest_log.destroy

        respond_to do |format|
            format.html { redirect_to stock_market_invest_logs_url }
            format.json { head :no_content }
        end
    end
end
