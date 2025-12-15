package("preloader_android")
    set_homepage("https://github.com/HazukiY1/preloader-android")
    set_description("The preloader package")
    set_kind("library")
    add_urls("https://github.com/HazukiY1/preloader-android/archive/refs/tags/$(version).tar.gz",
             "https://github.com/HazukiY1/preloader-android.git")

    add_versions("v0.1.0", "FF492540672875134EBF1C17398254EE6D79CD3FA8B70AACDB85747E7815B4B1")

    add_deps("cmake")

    on_load(function (package)
        package:data_set("cmake.build_shared", true)
        package:add("includedirs", "include")
    end)

    on_install(function (package)
    import("package.tools.cmake").install(package, {})
    local instdir = package:installdir()
    if os.isdir("include") then
        os.cp("include/*", path.join(instdir, "include"))
    end
    if os.isdir("lib") then
        os.cp("lib/*", path.join(instdir, "lib"))
    end
end)
