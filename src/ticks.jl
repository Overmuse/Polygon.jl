function get_historical_trades(api, ticker, date, offset = 0)
    data = polygon_get(api, "v2/ticks/stocks/trades/$ticker/$date")
    if data["results_count"] == 50000
        return append!(data["results"], get_historical_trades(api, ticker, date, last(data["results"])["t"]))
    else
        return data["results"]
    end
end

function get_historical_quotes(api, ticker, date, offset = 0)
    data = polygon_get(api, "v2/ticks/stocks/nbbo/$ticker/$date")
    if data["results_count"] == 50000
        return append!(data["results"], get_historical_quotes(api, ticker, date, last(data["results"])["t"]))
    else
        return data["results"]
    end
end
