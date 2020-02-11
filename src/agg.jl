function get_previous_close(api, ticker; adjusted=true)
    data = polygon_get(api, "v2/aggs/ticker/$ticker/prev", Dict{String, Any}("unadjusted" => !adjusted))
    return data["results"]
end

function get_historical_range(api, ticker, from, to, multiplier = 1, timespan = "day"; adjusted=true)
    data = polygon_get(
        api,
        "v2/aggs/ticker/$ticker/range/$multiplier/$timespan/$from/$to",
        Dict{String, Any}("unadjusted" => !adjusted)
    )
    return data["results"]
end

function get_historical(api::PolygonData, ticker, i)
    num_days = Int(round(i / 252 * 365 + i/10, digits = 0))
    start_date = (today() - Day(num_days))
    data = get_historical_range(api, ticker, start_date, today()-Day(1))
    map(data[end-i+1:end]) do x
        OHLCV(x["o"], x["h"], x["l"], x["c"], x["v"])
    end
end


function get_grouped_daily(api, locale, market, date; adjusted=true)
    data = polygon_get(
        api,
        "v2/aggs/grouped/locale/$locale/market/$market/$date",
        Dict{String, Any}("unadjusted" => !adjusted)
    )
    return data["results"]
end
