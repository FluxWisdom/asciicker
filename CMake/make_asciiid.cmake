#-----------
# ASCIIID
#-----------

set(TARGET "asciiid")

set(ASCIIID_SOURCE
	"src/asciiid.cpp"
	"src/audio.cpp"
	"src/stb_vorbis.cpp"
	"src/term.cpp"
	"src/x11.cpp"
	"src/sdl.cpp"
	"src/urdo.cpp"
	"src/game.cpp"
	"src/enemygen.cpp"
	"src/render.cpp"
	"src/terrain.cpp"
	"src/world.cpp"
	"src/inventory.cpp"
	"src/physics.cpp"
	"src/sprite.cpp"
	"src/texheap.cpp"
	"src/rgba8.cpp"
	"src/upng.c"
	"src/tinfl.c"
	"src/gl.c"
	"src/gl45_emu.cpp"
	"src/imgui_impl_opengl3.cpp"
	"src/imgui/imgui.cpp"
	"src/imgui/imgui_demo.cpp"
	"src/imgui/imgui_draw.cpp"
	"src/imgui/imgui_widgets.cpp"
	"src/font1.cpp"
	"src/gamepad.cpp"
)

set(ASCIIID_CXX_FLAGS	)
set(ASCIIID_CPP_FLAGS	-g -save-temps=obj -pthread)
set(ASCIIID_C_FLAGS		)
set(ASCIIID_LD_FLAGS	-save-temps=obj -pthread -lGL -lX11 -lXinerama -lutil -lSDL2 -lpulse)

add_executable(${TARGET} ${ASCIIID_SOURCE})

target_compile_options(
	${TARGET} PRIVATE
	$<$<COMPILE_LANGUAGE:CXX>:${ASCIIID_CXX_FLAGS}>
	$<$<COMPILE_LANGUAGE:C,CXX>:${ASCIIID_CPP_FLAGS}>
	$<$<COMPILE_LANGUAGE:C>:${ASCIIID_C_FLAGS}>
)

target_compile_definitions(
	${TARGET} PRIVATE -DEDITOR -DUSE_SDL
)

target_link_options(
	${TARGET} PRIVATE ${ASCIIID_LD_FLAGS}
)