local function run(msg, matches)
	
if matches[1] == 'echo' and is_sudo(msg) then		
pm = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end	
if matches[1] == 'git pull' and is_sudo(msg) then
  io.popen("git pull")
  tg.sendMessage(msg.chat_id_, 0, 1, '✅✅✅git pull✅✅✅', 1, 'md')
end	
end
	
return {
  patterns = {
		"^[/#!](git pull)$",
		"^[/#!](echo)$",
  },
  run = run
}
