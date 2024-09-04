local QBCore = exports['qb-core']:GetCoreObject()
local currentCameraIndex = nil
local cameras = {}

local function createCamera(vehicle, index)
    if cameras[index] then
        SetCamActive(cameras[index], false)
        DestroyCam(cameras[index], true)
    end

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    cameras[index] = cam
    currentCameraIndex = index

    local settings = Config.CameraSettings[index]
    local offset = settings.coords
    local rotation = settings.rotation

    AttachCamToEntity(cam, vehicle, offset.x, offset.y, offset.z, true)

    -- Set the initial rotation and FOV from the config
    SetCamRot(cam, rotation.pitch, 0.0, GetEntityHeading(vehicle) + rotation.yaw)
    SetCamFov(cam, settings.fov)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, true)
end

local function updateCamera(vehicle, index)
    if not cameras[index] then return end

    local cam = cameras[index]
    local settings = Config.CameraSettings[index]
    local offset = settings.coords
    local coords = GetEntityCoords(vehicle)

    -- Get vehicle rotation in degrees
    local pitch, roll, yaw = table.unpack(GetEntityRotation(vehicle, 2))

    -- Invert the roll to correct the camera orientation
    local roll_ivt = -roll

    -- If vehicle flips over (roll > 90 degrees or roll < -90 degrees), delete camera
    if math.abs(roll_ivt) > 90.0 then
        deleteCamera()
        return
    end


    -- Update the camera position relative to the vehicle
    SetCamCoord(cam, coords.x + offset.x, coords.y + offset.y, coords.z + offset.z)

    -- Set the camera rotation to follow the vehicle's pitch, roll, and yaw exactly
    SetCamRot(cam, pitch, roll, yaw)
end

local function disablePlayerControl()
    DisableControlAction(0, 1, true) -- LookLeftRight
    DisableControlAction(0, 2, true) -- LookUpDown
end

local function switchCamera(index)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        createCamera(vehicle, index)
    end
end

-- Global deleteCamera function
function deleteCamera()
    if currentCameraIndex and cameras[currentCameraIndex] then
        SetCamActive(cameras[currentCameraIndex], false)
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(cameras[currentCameraIndex], true)
        cameras[currentCameraIndex] = nil
        currentCameraIndex = nil
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if currentCameraIndex then
            if vehicle ~= 0 then
                updateCamera(vehicle, currentCameraIndex)
                disablePlayerControl()
            else
                deleteCamera() -- Delete the camera if the player exits the vehicle
            end
        end
    end
end)

-- Command: racecam 1 or 2-6 (there are 6 custom cameras)
RegisterCommand(Config.CommandName, function(source, args, rawCommand)
    local camIndex = tonumber(args[1])
    if camIndex and camIndex > 0 and camIndex <= #Config.CameraSettings then
        switchCamera(camIndex)
    else
        print("Invalid camera index: " .. tostring(args[1]))
    end
end, false)
