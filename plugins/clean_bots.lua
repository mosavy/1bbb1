local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
if addgroup and is_owner(msg) or is_momod(msg) then
if matches[1] == 'clean' and matches[2] == 'bot' then
  function cleanbot(arg, data)
    for k, v in pairs(data.members_) do
      kick_user(msg.chat_id,v.user_id_)
 end
    tdcli.sendMessage(msg.chat_id, msg.id_, 1, '*All bots has been cleaned*Channel: @LeaderCh', 1, 'md')
  end
  tdcli.getChannelMembers( msg.chat_id, 0, 'Bots', 200, cleanbot, nil)
  end
 end
end

return { 
patterns ={ 
'^[!/#](clean) (bot)$'
  },
  run = run
}
