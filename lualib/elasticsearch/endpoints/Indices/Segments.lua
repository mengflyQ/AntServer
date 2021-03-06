-------------------------------------------------------------------------------
-- Importing modules
-------------------------------------------------------------------------------
local IndicesEndpoint = require "elasticsearch.endpoints.Indices.IndicesEndpoint"

-------------------------------------------------------------------------------
-- Declaring module
-------------------------------------------------------------------------------
local Segments = IndicesEndpoint:new()

-------------------------------------------------------------------------------
-- Declaring Instance variables
-------------------------------------------------------------------------------

-- The parameters that are allowed to be used in params
Segments.allowedParams = {
  ["ignore_unavailable"] = true,
  ["allow_no_indices"] = true,
  ["expand_wildcards"] = true,
  ["human"] = true,
  ["operation_threading"] = true,
  ["verbose"] = true
}

-------------------------------------------------------------------------------
-- Function to calculate the http request method
--
-- @return    string    The HTTP request method
-------------------------------------------------------------------------------
function Segments:getMethod()
  return "GET"
end

-------------------------------------------------------------------------------
-- Function to calculate the URI
--
-- @return    string    The URI
-------------------------------------------------------------------------------
function Segments:getUri()
  local uri = "/_segments"
  if self.index ~= nil then
    uri = "/" .. self.index .. uri
  end
  return uri
end

-------------------------------------------------------------------------------
-- Returns an instance of Segments class
-------------------------------------------------------------------------------
function Segments:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return Segments
