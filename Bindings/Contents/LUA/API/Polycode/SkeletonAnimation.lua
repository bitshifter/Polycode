class "SkeletonAnimation"







function SkeletonAnimation:SkeletonAnimation(...)
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycore.SkeletonAnimation(unpack(arg))
		Polycore.__ptr_lookup[self.__ptr] = self
	end
end

function SkeletonAnimation:addBoneTrack(boneTrack)
	local retVal = Polycore.SkeletonAnimation_addBoneTrack(self.__ptr, boneTrack.__ptr)
end

function SkeletonAnimation:getName()
	local retVal =  Polycore.SkeletonAnimation_getName(self.__ptr)
	if retVal == nil then return nil end
	if Polycore.__ptr_lookup[retVal] ~= nil then
		return Polycore.__ptr_lookup[retVal]
	else
		Polycore.__ptr_lookup[retVal] = String("__skip_ptr__")
		Polycore.__ptr_lookup[retVal].__ptr = retVal
		return Polycore.__ptr_lookup[retVal]
	end
end

function SkeletonAnimation:Play(once)
	local retVal = Polycore.SkeletonAnimation_Play(self.__ptr, once)
end

function SkeletonAnimation:Stop()
	local retVal =  Polycore.SkeletonAnimation_Stop(self.__ptr)
end

function SkeletonAnimation:Update()
	local retVal =  Polycore.SkeletonAnimation_Update(self.__ptr)
end

function SkeletonAnimation:setSpeed(speed)
	local retVal = Polycore.SkeletonAnimation_setSpeed(self.__ptr, speed)
end



function SkeletonAnimation:__delete()
	Polycore.__ptr_lookup[self.__ptr] = nil
	Polycore.delete_SkeletonAnimation(self.__ptr)
end
