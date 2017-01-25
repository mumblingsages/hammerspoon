-- This is my personal hammerspoon setup.
-- hattip https://github.com/dalemanthei/hammerspoon


-- reload on change, do this first so it works even if error
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

require('capslock')

hs.alert.show("Hammerspoon has reloaded", 2)