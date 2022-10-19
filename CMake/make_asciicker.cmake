#-----------
# ASCIICKER
#-----------

set(TARGET "asciicker")

set(ASCIICKER_SOURCE
	"src/gl.c"
	"src/gl45_emu.cpp"
	"src/x11.cpp"
	"src/sdl.cpp"
	"src/term.cpp"
	"src/game.cpp"
	"src/enemygen.cpp"
	"src/game_app.cpp"
	"src/network.cpp"
	"src/render.cpp"
	"src/terrain.cpp"
	"src/world.cpp"
	"src/inventory.cpp"
	"src/physics.cpp"
	"src/sprite.cpp"
	"src/upng.c"
	"src/tinfl.c"
	"src/rgba8.cpp"
	"src/audio.cpp"
	"src/stb_vorbis.cpp"
	"src/gamepad.cpp"
	"src/font1.cpp"
)

set(ASCIICKER_CXX_FLAGS	)
set(ASCIICKER_CPP_FLAGS	-save-temps=obj -pthread -Og)
set(ASCIICKER_C_FLAGS	)
set(ASCIICKER_LD_FLAGS	-g -save-temps=obj -pthread -Og -lutil -lGL -lX11 -lXinerama -lSDL2 -lpulse)

add_executable(${TARGET} ${ASCIICKER_SOURCE})

target_compile_options(
	${TARGET} PRIVATE
	$<$<COMPILE_LANGUAGE:CXX>:${ASCIICKER_CXX_FLAGS}>
	$<$<COMPILE_LANGUAGE:C,CXX>:${ASCIICKER_CPP_FLAGS}>
	$<$<COMPILE_LANGUAGE:C>:${ASCIICKER_C_FLAGS}>
)

target_compile_definitions(
	${TARGET} PRIVATE -DGAME -DUSE_SDL
)

target_link_options(
	${TARGET} PRIVATE ${ASCIICKER_LD_FLAGS}
)