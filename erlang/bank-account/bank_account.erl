-module(bank_account).
-behavior(gen_server).
% bank_account interface
-export([create/0, balance/1, close/1, deposit/2, withdraw/2, charge/2]).

% gen_server
-export([handle_call/3, handle_cast/2, handle_info/2,
         init/1, code_change/3, terminate/2]).

% bank_account impl

-record(bank, {balance=0}).

create() ->
    {ok, Pid} = gen_server:start_link(?MODULE, [0], []),
    Pid.

balance(Account) ->
    try gen_server:call(Account, {balance}) of
        {balance, Amt} -> Amt
    catch
        exit:{noproc, _} -> {error, account_closed}
    end.

close(Account) ->
    FinalBalance = balance(Account),
    gen_server:stop(Account),
    FinalBalance.

deposit(_Account, Amount) when Amount < 0 -> ignored;
deposit(Account, Amount) when Amount >= 0 -> 
    try gen_server:cast(Account, {deposit, Amount})
    catch
        exit:{noproc, _} -> {error, account_closed}
    end.

withdraw(_Account, Amount) when Amount < 0 -> 0;
withdraw(Account, Amount) when Amount >= 0 -> 
    try gen_server:call(Account, {withdraw, Amount}) of
        {ok, Cash} -> Cash
    catch
        exit:{noproc, _} -> {error, account_closed}
    end.

charge(_Account, Amount) when Amount < 0 -> 0;
charge(Account, Amount) ->
    try gen_server:call(Account, {charge, Amount}) of
        {ok, Debit} -> Debit
    catch
        exit:{noproc, _} -> {error, account_closed}
    end.

% gen_server impl

init([Balance]) ->
    {ok, #bank{balance=Balance}}.

% balance
handle_call({balance}, _From, #bank{balance=Balance} = St) ->
    {reply, {balance, Balance}, St};

% withdraw
handle_call({withdraw, Amount}, _From, #bank{balance=Balance}) 
    when Amount =< Balance ->
    {reply, {ok, Amount},
     #bank{balance=Balance - Amount}};
handle_call({withdraw, Amount}, _From, #bank{balance=Balance}) 
    when Amount > Balance ->
    {reply, {ok, Balance},
     #bank{balance=0}};

% charge
handle_call({charge, Amount}, _From, #bank{balance=Balance}) 
    when Amount =< Balance ->
    {reply, {ok, Amount},
     #bank{balance=Balance - Amount}};
handle_call({charge, Amount}, _From, #bank{balance=Balance} = St) 
    when Amount > Balance ->
    {reply, {ok, 0}, St};

% close
handle_call({close}, _From, #bank{balance=Balance}) ->
    {reply, {closed, Balance}, 
     #bank{balance=Balance}}.

% deposit
handle_cast({deposit, Amount}, #bank{balance=Balance}) ->
    {noreply, #bank{balance=Balance + Amount}}.

% misc gen_server
handle_info(_Message, State) ->
    {noreply, State}.

code_change(_Previous, State, _Extra) ->
    {ok, State}.

terminate(Reason, State) ->
    {stop, Reason, State}.
