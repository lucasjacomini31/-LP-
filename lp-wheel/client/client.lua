QBCore = exports['qb-core']:GetCoreObject()

local function loadAnimDict(dict)
  if HasAnimDictLoaded(dict) then return end
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Wait(10)
  end
end

RegisterNetEvent('lpWheel:client:TirarRoda', function(veh, typeWheel)

  local index = 99

  if typeWheel == 'wheel_lf' then
    index = 0
  elseif typeWheel == 'wheel_rf' then
    index = 1
  elseif typeWheel == 'wheel_lm' then
    index = 2
  elseif typeWheel == 'wheel_rm' then
    index = 3
  elseif typeWheel == 'wheel_lr' then
    index = 4
  elseif typeWheel == 'wheel_rr' then
    index = 5
  end

  print(index)

  local ped = PlayerPedId()
  local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  local anim = "machinic_loop_mechandplayer"

  local vehicleTyreBurst = IsVehicleTyreBurst( veh, index , true)

  if vehicleTyreBurst == false then
    loadAnimDict(animDict)
    TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)

    Wait(10000)

    SetVehicleTyreBurst(veh, index, true, 1000.0)

    ClearPedTasks(ped)

    QBCore.Functions.Notify('Roda removida com sucesso', 'success', 5000)
  else
    QBCore.Functions.Notify('Já está sem roda', 'error', 5000)
  end
end)

RegisterNetEvent('lpWheel:client:ColocarRoda', function(veh)

  local ped = PlayerPedId()
  local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  local anim = "machinic_loop_mechandplayer"

  loadAnimDict(animDict)
  TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)

  Wait(10000)

  --local isVehicleTyreBurst = IsVehicleTyreBurst( veh, 1 , true)

  local tires = {
    {bone = "wheel_lf", index = 0},
    {bone = "wheel_rf", index = 1},
    {bone = "wheel_lm", index = 2},
    {bone = "wheel_rm", index = 3},
    {bone = "wheel_lr", index = 4},
    {bone = "wheel_rr", index = 5}
  }

  -- Fixed wheels vehicle
  for a = 1, #tires do
    SetVehicleTyreFixed(veh, tires[a].index)
  end

  ClearPedTasks(ped)
end)


CreateThread(function()
  exports['qb-target']:AddTargetBone('wheel_lf', {
    options = {
        ["Tirar Roda"] = {
            icon = "fas fa-wrench",
            label = "Tirar Roda",
            action = function(entity)
              TriggerEvent('lpWheel:client:TirarRoda', entity, 'wheel_lf')
            end,
            canInteract = function (entity, distance, data)
              return true
            end,
            distance = 1.3
        },
        ["Colocar Roda"] = {
          icon = "fas fa-wrench",
          label = "Colocar Roda",
          action = function(entity)
              TriggerEvent('lpWheel:client:ColocarRoda', entity)
          end,
          distance = 1.3
      }
    }
  })
  exports['qb-target']:AddTargetBone('wheel_rf', {
      options = {
          ["Tirar Roda"] = {
              icon = "fas fa-wrench",
              label = "Tirar Roda",
              action = function(entity)
                TriggerEvent('lpWheel:client:TirarRoda', entity, 'wheel_rf')
              end,
              canInteract = function (entity, distance, data)
                return true
              end,
              distance = 1.3
          },
          ["Colocar Roda"] = {
            icon = "fas fa-wrench",
            label = "Colocar Roda",
            action = function(entity)
                TriggerEvent('lpWheel:client:ColocarRoda', entity)
            end,
            distance = 1.3
        }
      }
  })
  exports['qb-target']:AddTargetBone('wheel_lm', {
    options = {
        ["Tirar Roda"] = {
            icon = "fas fa-wrench",
            label = "Tirar Roda",
            action = function(entity)
              TriggerEvent('lpWheel:client:TirarRoda', entity, 'wheel_lm')
            end,
            canInteract = function (entity, distance, data)
              return true
            end,
            distance = 1.3
        },
        ["Colocar Roda"] = {
          icon = "fas fa-wrench",
          label = "Colocar Roda",
          action = function(entity)
              TriggerEvent('lpWheel:client:ColocarRoda', entity)
          end,
          distance = 1.3
      }
    }
  })
  exports['qb-target']:AddTargetBone('wheel_rm', {
    options = {
        ["Tirar Roda"] = {
            icon = "fas fa-wrench",
            label = "Tirar Roda",
            action = function(entity)
              TriggerEvent('lpWheel:client:TirarRoda', entity, 'wheel_rm')
            end,
            canInteract = function (entity, distance, data)
              return true
            end,
            distance = 1.3
        },
        ["Colocar Roda"] = {
          icon = "fas fa-wrench",
          label = "Colocar Roda",
          action = function(entity)
              TriggerEvent('lpWheel:client:ColocarRoda', entity)
          end,
          distance = 1.3
      }
    }
  })
  exports['qb-target']:AddTargetBone('wheel_lr', {
    options = {
        ["Tirar Roda"] = {
            icon = "fas fa-wrench",
            label = "Tirar Roda",
            action = function(entity)
              TriggerEvent('lpWheel:client:TirarRoda', entity, 'wheel_lr')
            end,
            canInteract = function (entity, distance, data)
              return true
            end,
            distance = 1.3
        },
        ["Colocar Roda"] = {
          icon = "fas fa-wrench",
          label = "Colocar Roda",
          action = function(entity)
              TriggerEvent('lpWheel:client:ColocarRoda', entity)
          end,
          distance = 1.3
      }
    }
  })
  exports['qb-target']:AddTargetBone('wheel_rr', {
    options = {
        ["Tirar Roda"] = {
            icon = "fas fa-wrench",
            label = "Tirar Roda",
            action = function(entity)
              TriggerEvent('lpWheel:client:TirarRoda', entity, 'wheel_rr')
            end,
            canInteract = function (entity, distance, data)
              return true
            end,
            distance = 1.3
        },
        ["Colocar Roda"] = {
          icon = "fas fa-wrench",
          label = "Colocar Roda",
          action = function(entity)
              TriggerEvent('lpWheel:client:ColocarRoda', entity)
          end,
          distance = 1.3
      }
    }
  })
end)
