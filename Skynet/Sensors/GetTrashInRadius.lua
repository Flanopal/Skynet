local sensorInfo = {
	name = "GetTrashInRadius",
    desc = "Returns trash (with enough metal) in the circle of given radius.",
	author = "AzGhort"
}

return function(position, radius, threshold)
    local features = Spring.GetFeaturesInCylinder(position.x, position.z, radius)
    local metalFeatures = {}
    for i=1, #features do
        local remainingMetal, maxMetal, remainingEnergy, maxEnergy, reclaimLeft = Spring.GetFeatureResources(features[i])
        if remainingMetal > threshold then
            metalFeatures[#metalFeatures + 1] = features[i]
        end
    end
    return metalFeatures
end