PLUGIN.name = "Turn Ticker"
PLUGIN.description = "A very haphazard turn system for counting down drug effects."
PLUGIN.author = "Scrat Knapp"






ix.command.Add("Turn", {
    description = "Tick down any turn timers on you by 1.",
    OnRun = function(self, client)
        local turntable = client:GetCharacter():GetData("timertable")
        if next(turntable) == nil then
          client:Notify("You have no current turn timers.")
        end
        
        for i, v in pairs(turntable) do
            timer.Toggle(v)
            local currenttime = timer.TimeLeft(v)
            timer.Adjust(v, currenttime - 1 )
            local newtime = timer.TimeLeft(v)

            if newtime >= 1 then
              timer.Toggle(v)
              client:Notify(v..  " now has " ..math.floor(newtime) .. " turns of effect left.")

            else
              client:Notify(v .. " has expired.")
              turntable[i] = nil
              client:GetCharacter():SetData("timertable", turntable)
              ix.log.Add(client, "drugExpire", v, client)
            end 
        end
    end
})

if (SERVER) then
  ix.log.AddType("drugExpire", function(client, drug)
      return string.format("The %s of %s has expired.", drug, client:Name())
  end)

end

