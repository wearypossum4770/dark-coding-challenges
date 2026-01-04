%%%-------------------------------------------------------------------
%% @doc dark_coding_challenges public API
%% @end
%%%-------------------------------------------------------------------

-module(dark_coding_challenges_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    dark_coding_challenges_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
