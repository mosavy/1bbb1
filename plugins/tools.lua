local function run(msg, matches)
local addgroup = group[tostring(msg.chat_id)]	
if matches[1] == 'echo' and matches[2] and is_sudo(msg) then		
pm = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end	
if matches[1] == 'git pull' and is_sudo(msg) then
  io.popen("git pull")
  tg.sendMessage(msg.chat_id_, 0, 1, '✅✅✅git pull✅✅✅', 1, 'md')
end	
	if matches[1] == 'help' and is_momod(msg) or is_owner(msg) and addgroup then

pm = [[ 🔴⚜🔐help lock🔐⚜🔴

🔹!lock links  =>قفل لینک 
🔹!lock fwd  =>قفل فروارد 
🔹!lock spam  =>قفل اسپم 
🔹!lock inline  =>قفل اینلاین 
🔹!lock arabic  =>قفل فارسی 
🔹!lock english => قفل اینگلیسی
🔹!lock fosh => قفل فُش
🔹!lock username(@) => قفل یوزرنیم
🔹!lock bots  =>قفل بات API 
🔹!lock sticker  =>قفل استیکر 
🔹!lock tag(#)  =>قفل تگ 
🔹!lock tgservice  =>قفل تیجی 
🔹!lock audio  =>قفل موزیک
🔹 !lock voice => قفل وویس
🔹!lock photo  =>قفل تصویر 
🔹!lock gifs  =>قفل گیف 
🔹!lock video  =>قفل فیلم 
🔹!lock documents  =>قفل فایل 
🔹!mute all  => سایلنت گپ

🔴برای غیر فعال کردن قفل ها بجای lock کلمه unlock قرار دهید
-------------------------------------------
🔵👤help Mod👤🔵

🔺!promote [id-reply] =>مدیر کردن فرد 

🔻!demote [id-reply] =>حذف فرداز مدیریت 

🔺!settings =>تنظیمات 

🔻!muteuser [id-reply] =>
سایلنت کردن فرد/خارج کردن فرد از سایلنت 
-------------------------------------------
📢Channel: @leaderCh ]]
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
end
end
	
return {
  patterns = {
		"^[/#!](git pull)$",
		"^[/#!](echo)$",
		"^[/#!](help)$",
  },
  run = run
}
