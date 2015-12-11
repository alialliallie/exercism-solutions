-module(circular_buffer).
-behavior(gen_server).
-export([
  create/1, size/1, read/1, write/2, write_attempt/2,
  init/1, code_change/3, terminate/2,
  handle_call/3, handle_cast/2, handle_info/2
]).

-record(buffer, {size,
                 entries=[]}).

create(Size) ->
    {ok, Pid} = gen_server:start_link(?MODULE, [Size], []),
    Pid.

size(Pid) ->
    gen_server:call(Pid, {size}).

read(Pid) ->
    gen_server:call(Pid, {read}).
write(Pid, Item) ->
    gen_server:call(Pid, {write, Item}).

write_attempt(Pid, Item) ->
    gen_server:call(Pid, {write_attempt, Item}).

handle_write(Item, #buffer{size=S, entries=E})
  when length(E) =:= S->
    Enew = [Item|lists:droplast(E)],
    {ok, #buffer{size=S, entries=Enew}};
handle_write(Item, #buffer{size=S, entries=E}) ->
    {ok, #buffer{size=S, entries=[Item|E]}}.

handle_write_attempt(_, #buffer{size=S, entries=E} = St)
  when length(E) =:= S->
    {{error, full}, St};
handle_write_attempt(Item, State) ->
    handle_write(Item, State).


handle_read(#buffer{entries=[]} = St) ->
    {{error, empty}, St};
handle_read(#buffer{entries=E, size=S}) ->
    Item = lists:last(E),
    Enew = lists:droplast(E),
    {{ok, Item}, #buffer{entries=Enew, size=S}}.

%% gen_server
init([Size]) ->
    {ok, #buffer{size=Size}}.

handle_call({size}, _From, State) ->
    {reply, {ok, State#buffer.size}, State};
handle_call({read}, _From, State) ->
    {Reply, NewState} = handle_read(State),
    {reply, Reply, NewState};
handle_call({write, Item}, _From, State) ->
    {Reply, NewState} = handle_write(Item, State),
    {reply, Reply, NewState};
handle_call({write_attempt, Item}, _From, State) ->
    {Reply, NewState} = handle_write_attempt(Item, State),
    {reply, Reply, NewState}.

handle_cast(_Message, State) ->
    {noreply, State}.

handle_info(_Message, State) ->
    {noreply, State}.

terminate(Reason, State) ->
    {stop, Reason, State}.

code_change(_Previous, State, _Extra) ->
    {ok, State}.

