function get_historical_trades(ticker, date, offset = 0)
    data = polygon_get("v2/ticks/stocks/trades/$ticker/$date")
    if data["results_count"] == 50000
        return append!(data["results"], get_historical_trades(ticker, date, last(data["results"])["t"]))
    else
        return data["results"]
    end
end

function get_historical_quotes(ticker, date, offset = 0)
    data = polygon_get("v2/ticks/stocks/nbbo/$ticker/$date")
    if data["results_count"] == 50000
        return append!(data["results"], get_historical_quotes(ticker, date, last(data["results"])["t"]))
    else
        return data["results"]
    end
end
