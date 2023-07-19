-- workspace "sfml_project"
-- 	configurations { "Debug", "Release" }
-- 	location "build"

project "SFML"
	kind "StaticLib"
	language "C++"
	targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objectdir ("bin-int/" ..outputdir.. "/%{prj.name}")

	files { "src/**.*" }

	filter "configurations:*"
		defines { "SFML_STATIC" }
		includedirs { "dependencies/SFML/include" }
		libdirs { "dependencies/SFML/lib" }
		links
		{
			"opengl32",
			"freetype",
			"winmm",
			"gdi32",
			"flac",
			"vorbisenc",
			"vorbisfile",
			"vorbis",
			"ogg",
			"ws2_32"
		}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"
		links
		{	
			"sfml-graphics-s-d",
			"sfml-window-s-d",
			"sfml-system-s-d",
			"sfml-audio-s-d",
			"sfml-network-s-d"
		}

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"
		links
		{	
			"sfml-graphics-s",
			"sfml-window-s",
			"sfml-system-s",
			"sfml-audio-s",
			"sfml-network-s"
		}