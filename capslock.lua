
-- Set up Capslock hyper (mega-meta) key
-- hattip https://github.com/lodestone/hyper-hacks
-- hattip https://gist.github.com/ttscoff/cce98a711b5476166792d5e6f1ac5907
-- hattip https://gist.github.com/prenagha/1c28f71cb4d52b3133a4bff1b3849c3e
-- hattip https://github.com/dalemanthei/hammerspoon

-- A global variable for the Hyper Mode
local k = hs.hotkey.modal.new({}, "f17")

local hyperModifiers = {'cmd','alt','shift','ctrl'}
local hyperKey = hs.hotkey.modal.new({}, "f17")

-- The following keys are configured as hot keys in their respective apps (or in Keyboard Maestro)
-- b → Bitdefender ( System Preference | Keyboard | Services )
-- d → Do Not Distrub ( System Preferences | Keyboard | Services )
-- e → Evernote ( Keyboard Maestro )
-- f → Fantastical (configure in Fantastical preferences)
-- h → HazeOver (configure in HazeOver preferences)
-- n → Notifications configure in System preferences → Keyboard → Shortcuts → Mission Control)
-- o → Omnifocus ( Keyboard Maestro )
-- SPACE → Spotlight (configure in System Preferences → Keyboard → Shortcuts → Spotlight, moved so that ⌘␣ could be used for Quicksilver)
-- 1 through 6 → Optimal Layout window positions
hyperBindings = {'b','d','e','f','h','n','o','SPACE','1','2','3','4','5','6'}

for i,key in ipairs(hyperBindings) do
  hyperKey:bind({}, key, nil, function() hs.eventtap.keyStroke(hyperModifiers, key)
    hyperKey.triggered = true
  end)
end

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  hyperKey.triggered = false
  hyperKey:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  hyperKey:exit()
  if not hyperKey.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'f18', pressedF18, releasedF18)

return hyperKey;