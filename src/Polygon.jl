module Polygon

using HTTP, JSON
using ProgressMeter: @showprogress
export
    get_condition_mapping,
    get_dividends,
    get_gainers,
    get_grouped_daily,
    get_historical_quotes,
    get_historical_range,
    get_historical_trades,
    get_last_quote,
    get_last_trade,
    get_locales,
    get_losers,
    get_markets,
    get_open_close,
    get_previous_close,
    get_snapshot,
    get_splits,
    get_ticker_details,
    get_ticker_types,
    get_tickers

const POLYGON_URL = "https://api.polygon.io/"

function add_auth!(params)
    params["apiKey"] = ENV["APCA-LIVE-KEY-ID"]
end

function polygon_get(endpoint::String, params = Dict(), body = "")
    add_auth!(params)
    result = HTTP.get(POLYGON_URL * endpoint, [], JSON.json(body), query = params)
    !HTTP.iserror(result) && JSON.parse(String(result.body))
end

include("agg.jl")
include("last.jl")
include("meta.jl")
include("open-close.jl")
include("reference.jl")
include("snapshot.jl")
include("ticks.jl")
end # module
