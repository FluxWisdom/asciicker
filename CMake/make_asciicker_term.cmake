#-----------
# ASCIICKER_TERM
#-----------

set(TARGET "asciicker_term")

set(ASCIICKER_TERM_SOURCE
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
	"src/gamepad.cpp"
	"src/font1.cpp"
)

set(ASCIICKER_TERM_CXX_FLAGS	-std=c++17)
set(ASCIICKER_TERM_CPP_FLAGS	-save-temps=obj -pthread)
set(ASCIICKER_TERM_C_FLAGS		)
set(ASCIICKER_TERM_LD_FLAGS		-save-temps=obj -pthread -lutil -lgpm)

add_executable(${TARGET} ${ASCIICKER_TERM_SOURCE})

target_compile_options(
	${TARGET} PRIVATE
	$<$<COMPILE_LANGUAGE:CXX>:${ASCIICKER_TERM_CXX_FLAGS}>
	$<$<COMPILE_LANGUAGE:C,CXX>:${ASCIICKER_TERM_CPP_FLAGS}>
	$<$<COMPILE_LANGUAGE:C>:${ASCIICKER_TERM_C_FLAGS}>
)

target_compile_definitions(
	${TARGET} PRIVATE -DGAME -DPURE_TERM -DUSE_GPM
)

target_link_options(
	${TARGET} PRIVATE ${ASCIICKER_TERM_LD_FLAGS}
)