project "glfw"

    kind "StaticLib"
    targetdir "bin/%{cfg.buildcfg}"
    objdir    "bin/obj"

    flags   "MultiProcessorCompile"
    defines "_CRT_SECURE_NO_WARNINGS"

    floatingpoint "Fast"
    -- vectorextensions "AVX2"
    
    files {
        "src/internal.h",
        "src/platform.h",
        "src/mappings.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/platform.c",
        "src/vulkan.c",
        "src/window.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/null_platform.h",
        "src/null_joystick.h",
        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c",
    }

    filter "system:windows"
        files {
            "src/win32_time.h",
            "src/win32_thread.h",
            "src/win32_module.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_platform.h",
            "src/win32_joystick.h",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c", 
            "src/win32_window.c",
            "src/wgl_context.c",
        }
        defines "_GLFW_WIN32"

    filter "system:linux"
        files {
            "src/posix_time.h",
            "src/posix_thread.h",
            "src/posix_module.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/wl_platform.h",
            "src/wl_init.c",
            "src/wl_monitor.c",
            "src/wl_window.c",
        }
        defines "_GLFW_WAYLAND"

    filter "system:macosx"
        files {
            "src/cocoa_time.h",
            "src/posix_thread.h",
            "src/posix_module.c",
            "src/cocoa_time.c",
            "src/posix_thread.c",
            "src/cocoa_platform.h",
            "src/cocoa_joystick.h",
            "src/cocoa_init.m",
            "src/cocoa_joystick.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/nsgl_context.m",
        }
        defines "_GLFW_COCOA"

    filter "configurations:Debug"
        defines "DEBUG"
        symbols "On"
        runtime "Debug"

    filter "configurations:Release"
        defines  "NDEBUG"
        optimize "Speed"
        symbols  "On"
        inlining "Auto"
        runtime  "Release"
        flags    "LinkTimeOptimization"