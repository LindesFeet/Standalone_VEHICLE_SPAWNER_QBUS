RegisterCommand("car", function(src, args, raw)
  
  if args == nil or args[1] == nil then 
    print("No retard input automobile name in command") 
    return 
  end

  local m = args[1]
  local h = GetHashKey(m)

  RequestModel(h) 
  while not HasModelLoaded(h) do 
    Wait(0) 
  end

  local p = PlayerPedId()
  local c = GetEntityCoords(p)
  
  local v = CreateVehicle(
    h, 
    c.x, 
    c.y, 
    c.z, 
    GetEntityHeading(p), 
    true, 
    false
  )

  TaskWarpPedIntoVehicle(p, v, -1)
  SetEntityAsMissionEntity(v, true, true)
  SetModelAsNoLongerNeeded(h)
  
end)
