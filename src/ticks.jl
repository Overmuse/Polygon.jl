function get_historical_trades(api, ticker, date; timestamp = 0, timestamp_limit = nothing, reverse = false, limit = 5000)
    params = Dict(
        "timestamp" => string(timestamp),
        "reverse" => reverse,
        "limit" => limit
    )
    if !isnothing(timestamp_limit)
        params["timestampLimit"] = string(timestamp_limit)
    end
    data = Polygon.polygon_get(api, "v2/ticks/stocks/trades/$ticker/$date", params)
    data["results"]
end

function get_all_historical_trades(api, ticker, date)
    data = get_historical_trades(api, ticker, date, reverse=false, limit = 50000)
    if length(data) < 50000
        return data
    else
        while true
            timestamp = last(data)["t"]
            new_data = get_historical_trades(api, ticker, date, timestamp = timestamp, reverse = false, limit = 50000)
            append!(data, new_data)
            if length(new_data) != 50000
                break
            end
        end
    end
    data
end

function get_historical_quotes(api, ticker, date; timestamp = 0, timestamp_limit = nothing, reverse = false, limit = 5000)
    params = Dict(
        "timestamp" => string(timestamp),
        "reverse" => reverse,
        "limit" => limit
    )
    if !isnothing(timestamp_limit)
        params["timestampLimit"] = string(timestamp_limit)
    end
    data = Polygon.polygon_get(api, "v2/ticks/stocks/nbbo/$ticker/$date", params)
    data["results"]
end

function get_all_historical_quotes(api, ticker, date)
    data = get_historical_quotes(api, ticker, date, reverse=false, limit = 50000)
    if length(data) < 50000
        return data
    else
        while true
            timestamp = last(data)["t"]
            new_data = get_historical_quotes(api, ticker, date, timestamp = timestamp, reverse = false, limit = 50000)
            append!(data, new_data)
            if length(new_data) != 50000
                break
            end
        end
    end
    data
end
