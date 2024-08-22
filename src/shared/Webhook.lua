-- Webhook made for easier connection between discord webhooks and roblox
--
-- local webhook = require(webhook).new(Webhook Url)
-- -- webhook:Post(content) make your webhook send message with gived content
--

local http = game:GetService("HttpService")

local Webhook = {}
Webhook.__index = Webhook

function Webhook.new(url: string)
	return setmetatable({
		link = tostring(url),
	}, Webhook)
end

function Webhook:Post(content: string)
	http:PostAsync(
		self.link,
		http:JSONEncode({
			content = tostring(content),
			wait = true,
		})
	)
end

return Webhook
