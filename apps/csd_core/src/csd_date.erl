-module(csd_date).
-author('OJ Reeves <oj@buffered.io>').

%% --------------------------------------------------------------------------------------
%% API Function Exports
%% --------------------------------------------------------------------------------------

-export([utc_now/0]).

%% --------------------------------------------------------------------------------------
%% API Function Definitions
%% --------------------------------------------------------------------------------------

utc_now() ->
  Now = {_, _, Micro} = erlang:now(),
  {{Y, M, D}, {H, MM, S}} = calendar:now_to_universal_time(Now),
  iolist_to_binary(io_lib:format("~4.4.0w-~2.2.0w-~2.2.0wT~2.2.0w:~2.2.0w:~2.2.0w.~3.3.0wZ", [Y, M, D, H, MM, S, trunc(Micro / 1000)])).
