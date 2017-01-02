local function run(msg, matches)
local addgroup = group[tostring(msg.chat_id)]
if addgroup then
if is_momod(msg) or is_robot(msg) then
return false
else
local group = load_data('bot/group.json')
local group_mute_all = group[tostring(msg.chat_id)]['settings']['mute_all']
if group_mute_all == 'yes' then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_photo']
local is_photo_msg = msg.text:match("!!!photo:")
if group_mute_photo == 'yes' and is_photo_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_english = group[tostring(msg.chat_id)]['settings']['lock_english']
local is_english_msg = msg.text:match("[a-z]") or msg.text:match("[A-Z]")
local is_not_english_msg = msg.text:match("!!!photo:") or msg.text:match("!!!tgservice:") or msg.text:match("!!!edit:") or msg.text:match("!!!video:") or msg.text:match("!!!audio:") or msg.text:match("!!!voice:") or msg.text:match("!!!document:")
if group_lock_english == 'yes' and is_english_msg and not is_not_english_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_persian = group[tostring(msg.chat_id)]['settings']['lock_persian']
local is_persian_msg = msg.text:match("[\216-\219][\128-\191]")
if group_lock_persian == 'yes' and is_persian_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_bot = group[tostring(msg.chat_id)]['settings']['lock_bot']
local is_bot_msg = msg.text:match("^!!tgservice (chat_add_user)$") or msg.text:match("^!!tgservice (chat_add_user_link)$")
if group_lock_bot == 'yes' and is_bot_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_inline = group[tostring(msg.chat_id)]['settings']['lock_inline']
local is_inline_msg =  msg.text == "[unsupported]"
if group_lock_inline == 'yes' and is_inline_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_tgservice = group[tostring(msg.chat_id)]['settings']['lock_tgservice']
local is_tgservice_msg = msg.text:match("!!!tgservice:")
if group_lock_tgservice == 'yes' and is_tgservice_msg then
--    if is_persian_msg or is_english_msg then
--        tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
--    else
--        tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ }) 
--    end 
end
local group_lock_sticker = group[tostring(msg.chat_id)]['settings']['lock_sticker']
local is_sticker_msg = msg.text:match("!!!sticker:")
if group_lock_tgservice == 'yes' and is_sticker_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_spam = group[tostring(msg.chat_id)]['settings']['lock_spam']
local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
local _nl, real_digits = string.gsub(msg.text, '%d', '')
if group_lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_video']
local is_video_msg = msg.text:match("!!!video:")
if group_mute_video == 'yes' and is_video_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_voice']
local is_video_msg = msg.text:match("!!!voice:")
if group_mute_video == 'yes' and is_video_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_document']
local is_video_msg = msg.text:match("!!!document:")
if group_mute_video == 'yes' and is_video_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_gif']
local is_video_msg = msg.text:match("!!!gif:")
if group_mute_video == 'yes' and is_video_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_audio']
local is_video_msg = msg.text:match("!!!audio:")
if group_mute_video == 'yes' and is_video_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_link_lock = group[tostring(msg.chat_id)]['settings']['lock_link']
local is_link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]:") or msg.text:match("[Hh][Tt][Tt][Pp]:")
if is_link_msg and group_link_lock == 'yes'then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_edit_lock = group[tostring(msg.chat_id)]['settings']['lock_edit']
local is_edit_msg = msg.text:match("!!!edit:")
if group_edit_lock == 'yes' and is_edit_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_fwd_lock = group[tostring(msg.chat_id)]['settings']['lock_fwd']
if group_fwd_lock == 'yes' and msg.forward_info_ ~= false then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_username_lock = group[tostring(msg.chat_id)]['settings']['lock_username']
local is_username_msg = msg.text:match("@")
if group_username_lock == 'yes' and is_username_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_tag_lock = group[tostring(msg.chat_id)]['settings']['lock_tag']
local is_tag_msg = msg.text:match("#")
if group_tag_lock == 'yes' and is_tag_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_fosh_lock = group[tostring(msg.chat_id)]['settings']['lock_fosh']
local is_fosh_msg = msg.text:match("مادر") or msg.text:match("پدر") or msg.text:match("خواهر") or msg.text:match("مار") or msg.text:match("تمار") or msg.text:match("خار") or msg.text:match("کص") or msg.text:match("کس") or msg.text:match("کیر") or msg.text:match("کاندوم") or msg.text:match("شورت") or msg.text:match("ننه") or msg.text:match("مامان") or msg.text:match("شارژ") or msg.text:match("کد") or msg.text:match("همراه اول") or msg.text:match("ایرانسل") or msg.text:match("رایتل")
local is_fosh1_msg = msg.text:match("madar") or msg.text:match("mather") or msg.text:match("father") or msg.text:match("pedar") or msg.text:match("khahar") or msg.text:match("khar") or msg.text:match("mar") or msg.text:match("tamar") or msg.text:match("cos") or msg.text:match("koc") or msg.text:match("coc") or msg.text:match("kos") or msg.text:match("kir") or msg.text:match("cir") or msg.text:match("short") or msg.text:match("kandom") or msg.text:match("kandoom") or msg.text:match("nane") or msg.text:match("maman") or msg.text:match("sharg") or msg.text:match("kod") or msg.text:match("cod") or msg.text:match("hamrah aval") or msg.text:match("irancell") or msg.text:match("raitel")
if group_fosh_lock == 'yes' and is_fosh_msg and is_fosh1_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
end
end
end
return {
  patterns = {
    "^(.*)$",
  },
  run = run
}
