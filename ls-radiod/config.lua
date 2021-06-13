Config = {}

Config.RestrictedChannels = 10 -- channels that are encrypted (EMS, Fire and police can be included there) if we give eg 10, channels from 1 - 10 will be encrypted
Config.enableCmd = false --  /radio command should be active or not (if not you have to carry the item "radio") true / false

Config.messages = {

  ['not_on_radio'] = 'Nie jestes aktualnie na zadnym radiu!',
  ['on_radio'] = 'Aktualnie jestes na radiu: <b>',
  ['joined_to_radio'] = 'Dolaczyles do radia: <b>',
  ['restricted_channel_error'] = 'Nie mozesz dolaczyc do tego kanalu!',
  ['you_on_radio'] = 'Dolaczyles juz do tego radia: <b>',
  ['you_leave'] = 'Opusciles radio: <b>'

}
